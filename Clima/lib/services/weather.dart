import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  String apikey = '2661c5eef4ceb2914b69bcca4e6fd204';
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

  Future<dynamic> getRandomLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var data = await networkHelper.getData();
    return data;
  }

  Future<dynamic> getRandomCityData(String cityname) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?q=${cityname}&appid=$apikey&units=metric');
    var data = await networkHelper.getData();
    print('data: $data');
    return data;
  }
}
