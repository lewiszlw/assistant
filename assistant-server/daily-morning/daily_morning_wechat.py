from datetime import date, datetime
import math
from wechatpy import WeChatClient
from wechatpy.client.api import WeChatMessage, WeChatTemplate
import requests
import os
import random
import config

today = datetime.now()
love_start_date = config.LOVE_START_DATE # 例如 2020-01-01
weather_city = config.WEATHER_CITY  # 例如 武汉
lover_birthday = config.LOVER_BIRTHDAY  # 例如 02-01

# 可通过微信公众平台测试号申请
app_id = os.environ["WECHAT_APP_ID"]
app_secret = os.environ["WECHAT_APP_SECRET"]

user_ids = config.WECHAT_USER_IDS
template_id = config.WECHAT_TEMPLATE_ID


def get_weather():
  url = "http://autodev.openspeech.cn/csp/api/v2.1/weather?openId=aiuicus&clientType=android&sign=android&city=" + weather_city
  res = requests.get(url).json()
  weather = res['data']['list'][0]
  return weather['weather'], math.floor(weather['temp'])

def love_days_count():
  delta = today - datetime.strptime(love_start_date, "%Y-%m-%d")
  return delta.days

def lover_birthday_left():
  next = datetime.strptime(str(date.today().year) + "-" + lover_birthday, "%Y-%m-%d")
  if next < datetime.now():
    next = next.replace(year=next.year + 1)
  return (next - today).days

def get_words():
  apis = ["https://api.shadiao.pro/chp", "https://api.shadiao.pro/pyq"]
  words = requests.get(random.choice(apis))
  if words.status_code != 200:
    return get_words()
  return words.json()['data']['text']

def get_random_color():
  return "#%06x" % random.randint(0, 0xFFFFFF)


client = WeChatClient(app_id, app_secret)

wm = WeChatMessage(client)
wea, temperature = get_weather()
content_pattern = """
今日天气：{weather}
当前温度：{temperature} 摄氏度
今天是我们恋爱的第 {love_days} 天
距离你的生日还有 {lover_birthday_left} 天
{words}
"""
content = content_pattern.format(
  weather=wea, 
  temperature=temperature, 
  love_days=love_days_count(), 
  lover_birthday_left=lover_birthday_left(), 
  words=get_words()
)
print("content: %s" % content)
data = {
  "daily_morning": {"value": content, "color": get_random_color()}
}
for user_id in user_ids:
  res = wm.send_template(user_id, template_id, data)
  print(res)