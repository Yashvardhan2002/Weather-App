import 'networking.dart';
import 'location_screen.dart';
import 'location.dart';
import 'loading_screen.dart';

const openWeatheURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatheURL?q=$cityName&appid=79eebb710cb27b4ca403ae3510082ba9&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();

    return weatherData;

  }


    Future<dynamic> getLocationWeather() async{
      Location location = Location();
      await location.getCurrentLocation();

      NetworkHelper networkHelper = NetworkHelper('$openWeatheURL?lat=${location.latitude}&lon=${location.longitude}&appid=79eebb710cb27b4ca403ae3510082ba9&units=metric');

      var weatherData = await networkHelper.getData();
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
