import schedule
import time
from script import run_stock_job

from datatime import datatime

def basic_job():
    print("job started at:", datatime.now())


schedule.every().minute.do(basic_job)

schedule.every().minute.do(run_stock_job)

while True:
    schedule.run_pending()
    time.sleep(1)