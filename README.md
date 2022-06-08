# Challenge: SwiftUI science fiction! 🖖🏻

![](https://upload.wikimedia.org/wikipedia/en/8/88/Star_Trek_PADD.jpg?20180101012719)

I went with a Star Trek theme, inspired by the LCARS (Library Computer Access/Retrieval System) design.

Tech used:
- SwiftUI 😍
- WeatherKit for the graph data 🌦
- Swift Charts 📈
- SwiftUI `Grid` for the numbers and buttons layout

### Result

Line chart with Symbols | Line chart
--|--
<img src="images/lineSymbols.png"> | <img src="images/linePlain.png">

Bar chart | Rule chart
--|--
<img src="images/bar.png"> | <img src="images/rule.png">

### Reference image

<img src="images/reference.png">

Source: https://en.wikipedia.org/wiki/LCARS

### Links

Challenge details: https://developer.apple.com/news/?id=f4phvjei

### Workarounds

After adding my bundle id and marking the capability and services to enable WeatherKit, I still receive the `401` error (after many hours).

As a workaround, I have temporarily used the bundle id from the sample sessions to obtain the weather data. `com.example.apple-samplecode.FlightPlanner`

> Please note, this is not production level code
