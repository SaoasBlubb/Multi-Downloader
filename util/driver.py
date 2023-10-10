# General import
import os, time, subprocess
from bs4 import BeautifulSoup
from seleniumwire import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from webdriver_manager.chrome import ChromeDriverManager
import undetected_chromedriver as uc

class Driver:
    service = None
    options = None
    driver = None
    def __init__(self) -> None:
        self.service = Service(ChromeDriverManager().install())
        self.options = webdriver.ChromeOptions()
        try: subprocess.check_output("TASKKILL /IM chrome.exe /F",  shell=True) 
        except: pass
    def create(self, minimize = False):
        self.options.add_argument("--window-size=1920,1080")
        self.options.add_argument('--user-data-dir=C:/Users/'+os.getlogin()+'/AppData/Local/Google/Chrome/User Data')
        self.options.add_experimental_option("useAutomationExtension", True)
        self.options.add_experimental_option("excludeSwitches",["enable-automation"])
        self.options.add_experimental_option('excludeSwitches', ['enable-logging'])
        self.driver = webdriver.Chrome(options=self.options,  service=self.service, seleniumwire_options={'disable_encoding': True})
        if(minimize): self.driver.minimize_window()
    def get_page(self, url, sleep=1):
        self.driver.get(url)
        time.sleep(sleep)
    def get_local_storage(self):
        return self.driver.execute_script("return window.localStorage;")
    def get_soup(self):
        return BeautifulSoup(self.driver.page_source, "lxml")
    def close(self):
        print("Close driver")
        self.driver.close()
        self.driver.quit()
