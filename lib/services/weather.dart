import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "9eb2eb1b2370849be0520b52bf5a96a5";

class WeatherModel {
  Future<dynamic> getCityWeather(name) async {
    NetWorkingClima serv = NetWorkingClima(
        url:
            "https://api.openweathermap.org/data/2.5/weather?q=$name&&appid=$apiKey&units=metric");
    var weatherData = await serv.getClimaData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocatiuon();
    print(loc.lattitude);
    print(loc.logitude);
    NetWorkingClima serv = NetWorkingClima(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=${loc.lattitude}&lon=${loc.logitude}&appid=$apiKey&units=metric");
    var weatherData = await serv.getClimaData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
