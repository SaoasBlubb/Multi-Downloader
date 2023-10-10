import os, re, glob, time, tqdm, requests, subprocess, shutil
from functools import partial
from requests.models import Response
from multiprocessing.dummy import Pool
 
cookies = {}
headers = {}

def download_ts_file(ts_url: str, store_dir: str):
    ts_name = ts_url.split('/')[-1].split("?")[0]
    ts_dir = store_dir + "/" + ts_name
    if(not os.path.isfile(ts_dir)):
        ts_res = requests.get(ts_url, headers=headers, cookies=cookies)
        if isinstance(ts_res, Response) and ts_res.status_code == 200:
            with open(ts_dir, 'wb+') as f:
                f.write(ts_res.content)
        else:
            print(f"Failed to download streaming file: {ts_name}.")
        time.sleep(0.7)

def download(m3u8_link, merged_mp4):
    m3u8_http_base = m3u8_link.rstrip(m3u8_link.split("/")[-1])
    m3u8_content = requests.get(m3u8_link, headers={
        'authority': 'cdn.slushy.com',
        'accept': '*/*',
        'accept-language': 'it-IT,it;q=0.9,en-US;q=0.8,en;q=0.7',
        'origin': 'https://www.slushy.com',
        'referer': 'https://www.slushy.com/',
    }).text
    m3u8 = m3u8_content.split('\n')
    ts_url_list = []
    ts_names = []
    for i_str in range(len(m3u8)):
        line_str = m3u8[i_str]
        if line_str.startswith("#EXTINF"):
            ts_url = m3u8[i_str+1]
            ts_names.append(ts_url.split('/')[-1])
            if not ts_url.startswith("http"):
                ts_url = m3u8_http_base + ts_url
            ts_url_list.append(ts_url)
    if(len(ts_url_list) != 0):
        os.makedirs("temp_ts", exist_ok=True)
        pool = Pool(5)
        gen = pool.imap(partial(download_ts_file, store_dir="temp_ts"), ts_url_list)
        for _ in tqdm.tqdm(gen, total=len(ts_url_list), desc="Down"):
            pass
        pool.close()
        pool.join()
        downloaded_ts = sorted(glob.glob("temp_ts\*.ts"), key=lambda x:float(re.findall("(\d+)",x)[0]))
        files_str = "concat:"
        for ts_filename in downloaded_ts:
            files_str += ts_filename+'|'
        files_str.rstrip('|')
        subprocess.run(['ffmpeg', '-i', files_str, '-c', 'copy', '-bsf:a', 'aac_adtstoasc', merged_mp4], stderr=subprocess.DEVNULL)
        shutil.rmtree("temp_ts")
    else:
        print("No file to download")
