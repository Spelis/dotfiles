import requests

r = requests.get('https://wttr.in/Alvsbyn?format=j1')
if r.status_code == 200:
    r = r.json()

    moons = {
        "New Moon": "🌑",
        "Waxing Crescent": "🌒",
        "First Quarter":"🌓",
        "Waxing Gibbous": "🌔",
        "Full Moon":"🌕",
        "Waning Gibbous":"🌖",
        "Last Quarter": "🌗",
        "Waning Crescent":"🌘"
        }

    weather = {
    "Sunny": " ",
    "Cloudy": " ",
    "Overcast": " ",
    "Partly cloudy": "󰖕 ",
    "Mist": " ",
    "Fog": " ",
    "Haze": " ",
    "Snow": " ",
    "Sleet": " ",
    "Rain": " ",
    "Thunderstorm": " ",
    "Tornado": "",
    "Hurricane": "",
    "Smoke": " ",
    "Dust": "",
    "Sand": "",
    "Duststorm": "",
    "Sandstorm": "",
    "Hot": " ",
    "Cold": "",
    "Windy": " ",
    "Calm": " ",
    "Unknown": "❓"
    }


    print(f'{weather[r["current_condition"][0]["weatherDesc"][0]["value"]]}{r["current_condition"][0]["temp_C"]}°C {moons[r["weather"][0]["astronomy"][0]["moon_phase"]]} {r["weather"][0]["astronomy"][0]["moon_phase"]}')

else:
    print("rate limit")
