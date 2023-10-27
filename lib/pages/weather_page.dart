import 'package:couteau/util/drawer_comp.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Dio dio = Dio();
  String apiKey = '2adf6ca344caeb3a26200f7d050bbd0d'; // Reemplaza con tu propia API key de OpenWeatherMap
  String city = 'Santo Domingo'; // Cambia la ciudad a tu ubicación

  String temperature = '';
  String description = '';
  String iconCode = '';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Icon getWeatherIcon(String iconCode) {
    switch (iconCode) {
      case '01d':
        return Icon(Icons.wb_sunny, size: 75,);
      case '01n':
        return Icon(Icons.nightlight_round, size: 75);
      case '02d':
        return Icon(Icons.wb_cloudy, size: 75);
      case '02n':
        return Icon(Icons.cloud, size: 75);
      case '03d':
      case '03n':
        return Icon(Icons.cloud, size: 75);
      default:
        return Icon(Icons.cloud, size: 75);
    }
  }

  Future<void> fetchWeatherData() async {
    try {
      Response response = await dio.get(
          'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');

      if (response.statusCode == 200) {
        Map<String, dynamic> weatherData = response.data;
        setState(() {
          temperature = weatherData['main']['temp'].toStringAsFixed(1);
          description = weatherData['weather'][0]['description'];
          iconCode = weatherData['weather'][0]['icon'];

        });
      } else {
        print('Error: No se pudo cargar los datos del clima');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Icon weatherIcon = getWeatherIcon(iconCode);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Pronóstico del Tiempo - $city'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hoy en $city',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              '$temperature°C',
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(height: 20),
            weatherIcon,
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}