# Import
import requests, sys, time, os
from selenium.webdriver.common.by import By
from rich.console import Console
from util import m3u8
from util.driver import Driver


# Variable 
console = Console()
username = input("Profilename?: ")
print("")
user_agent = ""
auth = ""
user = {}
creator = {}
driver = Driver()
driver.create(minimize=True)
data = []
path = ""

def get_headers_as_dict(headers):
    dic = {}
    dict_cookie = {}
    for line in headers.split("\n"):
        if(str(line).strip() != ""):
            if line.startswith(("GET", "POST")):
                continue
            point_index = line.find(":")
            if(line[:point_index].strip() != "cookie"):
                dic[line[:point_index].strip()] = line[point_index+1:].strip()
            else:
                str_cookie = line[point_index+1:].strip()
                for cookies in str_cookie.split(";"):
                    dict_cookie[cookies.split("=")[0].strip()] = ''.join(cookies.split("=")[1:])
    return {'header': dic, 'cookie': dict_cookie}

def get_token():
    global user_agent, auth
    driver.get_page("https://slushy.com/")
    try: auth = "Bearer " + driver.get_local_storage()['id_token']
    except:
        console.log(f"[red] ERROR TOKEN RETRY OR LOGIN")
        sys.exit(0)

    for req in driver.driver.requests:
        if req.url == "https://slushy.com/":
            head_cookie = get_headers_as_dict( str(req.headers) )
            user_agent = head_cookie['header']['user-agent']

def get_headers():
    return {
        'authority': 'api.slushy.com',
        'accept': 'application/json, text/plain, */*',
        'accept-language': 'it-IT,it;q=0.9,en-US;q=0.8,en;q=0.7',
        'authorization': auth,
        'origin': 'https://www.slushy.com',
        'referer': 'https://www.slushy.com/',
        'user-agent': user_agent
    }

def get_me():
    global user
    r = requests.get('https://api.slushy.com/profile/my', headers=get_headers())
    if(r.status_code == 200):
        r_json = r.json()
        user['id'] = r_json['id']
        user['name'] = r_json['displayName']
        user['mail'] = r_json['email']
        console.log(f"LOGIN: {user}")

    elif(r.status_code == 401):
        console.log(f"[red]INSERT AUTH MANUALY [FALSE \ POSITIVE => RETRY]")
        sys.exit(0)
    else:
        console.log(f"[red]ERROR => [{r.status_code}]")
        sys.exit(0)

def get_creator():
    global creator
    r = requests.get(f'https://api.slushy.com/profile/me/{username}', headers=get_headers())
    if(r.ok):
        r_json = r.json()
        creator['id'] = r_json['id']
        creator['name'] = r_json['displayName']
        creator['n_post'] = r_json['postCount']
        creator['age'] = r_json['displayAge']
        creator['heigth'] = str(r_json['heightCentimeters']) + "cm"
        console.log(f"CREATOR: {creator}")

    else:
        console.log(f"[red]ERROR => API, CREATOR DOESNT EXIST")
        sys.exit(0)

def parse_post(post):

    obj = {}
    obj['url'] = f"https://www.slushy.com/feed/post/{post['id']}?creatorId={creator['id']}"
    obj['id'] = post['id']
    obj['text'] = post['caption']
    obj['type'] = post['type']
    obj['img_count'] = post['imagesCount']
    obj['movie_count'] = post['videosCount']
    list_media = []
    for media in post['media']:
        obj_single_media = {}
        obj_single_media['type'] = media['type']
        obj_single_media['is_visible'] = media['visible']
        obj_single_media['val_id'] = media['vaultId']
        obj_single_media['med_id'] = media['id']
        if(obj_single_media['is_visible']):
            if(obj_single_media['type'] == 'image'):
                obj_single_media['url'] = media['mediaUrls']['large']

                if(not os.path.exists(path + "/" + obj_single_media['val_id'] + ".jpg")):
                    console.log(f"[green]SAVE [blue](img) [white]=> [green]{obj_single_media['val_id']}")
                    r = requests.get(obj_single_media['url'])
                    open(path+"/img/" + obj_single_media['val_id'] + ".jpg", "wb").write(r.content)

            elif(obj_single_media['type'] == 'video'):
                obj_single_media['url'] = media['mediaUrls']['movie']

                if(not os.path.exists(path + "/movie/preview" + obj_single_media['val_id'] + ".jpg")):
                    console.log(f"[green]SAVE [blue](video\prev) [white]=> [green]{obj_single_media['val_id']}")
                    r = requests.get(media['mediaUrls']['preview'])
                    open(path+"/movie/preview/" + obj_single_media['val_id'] + ".mp4", "wb").write(r.content)

        list_media.append(obj_single_media)
    obj['media'] = list_media
    obj['n_media'] = len(post['media'])
    return obj

def get_all_media():
    global data
    total_media = -1
    cursor = ""
    r = requests.get(f"https://api.slushy.com/search/me/feed?hideOnMain=false&sort=new&paginationId=&creatorId={creator['id']}&showLimitedDistribution=true", headers=get_headers())
    if(r.ok):
        r_json = r.json()
        total_media = r_json['total'] -1
        console.log("MEDIA TO FIND: ", r_json['total'])
        cursor = r_json['paginationId']

        for post in r_json['body']:
            data.append(parse_post(post['post']))
        console.log(f"MEDIA FIND: [ {len(data)} / {total_media} ]")

        while(cursor != ""):
            r = requests.get(f"https://api.slushy.com/search/me/feed?hideOnMain=false&sort=new&paginationId={cursor}&creatorId={creator['id']}&showLimitedDistribution=true", headers=get_headers())
            r_json = r.json()
            cursor = r_json['paginationId']
            for post in r_json['body']:
                data.append(parse_post(post['post']))
            console.log(f"MEDIA FIND: [ {len(data)} / {total_media} ]")

        console.log("END GET API")

    else:
        console.log(f"[red]ERROR => API TIMELINE")

def get_caption():
    soup = driver.get_soup()
    try:
        msg = soup.find("p", class_ = "text-12 mt-5 leading-tight")
        return msg.text
    except:
        console.log(f"[red]ERROR UPDATE OFFSET CAP")
        console.log(f"[red]END IDK")
        sys.exit(0)

def click_next_button(sleep = 0.5):
    valid_butt = []
    for e in driver.driver.find_elements(By.CSS_SELECTOR,'button[type="button"]'):
        if "flex justify-center" in str(e.get_attribute("class")):
            valid_butt.append(e)

    try:
        console.log(f"[green]GO DOWN")
        driver.driver.execute_script("arguments[0].click();", valid_butt[2]);
    except:
        console.log(f"[red]CANT CLICK")
        return False
    
    time.sleep(sleep)

def find_ts():
    list_ts = []
    for req in driver.driver.requests:
        if ".ts" in req.url:
            list_ts.append([req.url, get_headers_as_dict(str(req.headers))])

    if(len(list_ts) != 0):

        return {
            'CloudFront-Key-Pair-Id': list_ts[-1][1]['cookie']['CloudFront-Key-Pair-Id'], 
            'CloudFront-Policy': list_ts[-1][1]['cookie']['CloudFront-Policy'],
            'CloudFront-Signature': list_ts[-1][1]['cookie']['CloudFront-Signature']
        }, {
            'authority': 'cdn.slushy.com', 
            'accept': '*/*', 
            'accept-language': 'it-IT,it;q=0.9,en-US;q=0.8,en;q=0.7', 
            'origin': 'https://www.slushy.com', 
            'referer': 'https://www.slushy.com/', 
            'user-agent': list_ts[-1][1]['header']['user-agent']
        }
    
    else:
        console.log(f"[red]ERROR CANT FIND TS")
        return False

def try_find_video():
    list_vv = []
    for req in driver.driver.requests:
        if ".m3u8" in req.url:
            list_vv.append(req.url)
    if(len(list_vv) != 0):
        return list_vv[-1]
    else:
        console.log(f"[red]CANT FIND NOTHING")
        return False

def download_all_media(sleep_load = 15):

    def down_post(post):
        if(int(post['movie_count']) > 0):
            for sub_post in post['media']:
                if(sub_post['type'] == 'video' and sub_post['is_visible'] == True):
                    path_file = path + "/" + post['id'] + ".mp4"
                    console.log(f"GET SUB VIDEO => {sub_post['med_id']}")
                    driver.get_page(url=post['url'], sleep=sleep_load)
                    if(not os.path.exists(path_file)):
                        try:
                            m3u8.cookies, m3u8.headers = find_ts()
                            m3u8.download(post['media'][0]['url'], path+"/movie/" + post['id'] + ".mp4")
                            break
                        except:
                            pass

    for post in data:
        console.log(f"GET => {data.index(post)} OF {len(data)}")
        down_post(post)
        del driver.driver.requests

    console.log(f"[red]END DOWNLOAD")

def main():

    global path
    get_token()
    driver.get_page(f"https://slushy.com/@{username}/feed?type=new")
    get_me()
    get_creator()
    path = os.path.join("Downloads/Slushy/Profile", username)
    os.makedirs(path, exist_ok=True)
    os.makedirs(path+"/img", exist_ok=True)
    os.makedirs(path+"/movie", exist_ok=True)
    os.makedirs(path+"/movie/preview", exist_ok=True)
    get_all_media()
    download_all_media()

main()
