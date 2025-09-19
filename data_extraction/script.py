import requests
import os
import csv
import time
from dotenv import load_dotenv

load_dotenv()

Api_Key = os.getenv("POLYGON_API_KEY")

LIMIT = 1000

def run_stock_job():
    url =f"https://api.polygon.io/v3/reference/tickers?market=stocks&active=true&order=asc&limit={LIMIT}&sort=ticker&apiKey={Api_Key}"
    
    response = requests.get(url)

    tickers = []
    data = response.json()

    for ticker in data['results']:
        tickers.append(ticker)


    while 'next_url' in data:
        print("requesting next page", data['next_url'])
        response = requests.get(data['next_url'] + f'&apiKey={Api_Key}')
        data = response.json()
        print(data)
        print("sleeping for 13 sec due to polygon free tier rate limit")
        time.sleep(13)
        for ticker in data['results']:
            tickers.append(ticker)
    

    sample_ticker ={'ticker': 'VIS', 
        'name': 'Vanguard Industrials ETF', 
        'market': 'stocks', 
        'locale': 'us', 
        'primary_exchange': 'ARCX', 
        'type': 'ETF', 
        'active': True, 
        'currency_name': 'usd', 
        'cik': '0000052848', 
        'composite_figi': 'BBG000HX9TN0', 
        'share_class_figi': 'BBG001SHVTX5', 
        'last_updated_utc': '2025-09-19T06:05:18.517298768Z'
    }

    #write fieldnames to a CSV file with sample_ticker schema
    fieldnames = list(sample_ticker.keys())
    output_csv = 'tickers.csv'
    with open(output_csv, mode ='w', newline = '', encoding='utf-8') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for t in tickers:
            row = {key: t.get(key, '') for key in fieldnames}
            writer.writerow(row)
    print(f"Wrote {len(tickers)} row to (output_csv)")


if __name__ == '__main__':
    run_stock_job()