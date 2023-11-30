import subprocess
import requests


# 指定要运行的脚本
script_file = "script/download.sh"
# 获取语言
languages_url = "https://commonvoice.mozilla.org/api/v1/languages"
response = requests.get(languages_url)
languages = response.json()
for language in languages:
    language_name = language["name"]
    base_url = f"https://commonvoice.mozilla.org/api/v1/bucket/dataset/cv-corpus-15.0-2023-09-08%2Fcv-corpus-15.0-2023-09-08-{language_name}.tar.gz"
    response = requests.get(base_url).json()
    url = response["url"]
    # print(url)
    script_args = [url]
    print(f"下载{language_name}数据集...")
    subprocess.run(["bash", script_file] + script_args)
print(f"数据集全部下载完成")
