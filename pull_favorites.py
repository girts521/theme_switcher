import requests
import os

WALLHAVEN_KEY = "API_KEY"

def get_urls():
    response = requests.get(f"https://wallhaven.cc/api/v1/collections/USER_NAME/COLLECTION_ID?apikey={WALLHAVEN_KEY}")
    if response.status_code == 200:
        data = response.json()
        for pic_data in data['data']:
            image = requests.get(pic_data['path'])
            file_name = f"{pic_data['id']}.jpg"
            if file_name not in os.listdir('.'):
                with open(file_name, 'wb') as file:
                    file.write(image.content)
            else:
                print(f"file {file_name} has already been downloaded")
    else:
        print(f"There was an error: {response.status_code}")

if __name__ == "__main__":
    get_urls()
