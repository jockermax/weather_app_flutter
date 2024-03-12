import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details_screen.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  List<String> cities = ['Dakar', 'Diourbel', 'Tambacounda', 'Kaffrine', 'Touba','Thies','Mbour', 'Tivaouane','Miami','Paris'];
  Map<String, Map<String, dynamic>> _weatherData = {};
  double _progress = 0;
  bool _isFetching = true;
  int _messageIndex = 0;
  Timer? _messageTimer;

  @override
  void initState() {
    super.initState();
    _fetchWeather();
    _startMessageTimer();
  }

  Future<void> _fetchWeather() async {
    const apiKey = 'ba1f37d96b69f37e298ae1a8ee373244';
    const interval = 10; // Seconds
    int currentCityIndex = 0;

    Timer.periodic(Duration(seconds: interval), (timer) async {
      if (currentCityIndex < cities.length) {
        final city = cities[currentCityIndex];
        final Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final temperature = data['main']['temp']; // Température en Celsius
          final clouds = data['clouds']['all']; // Pourcentage de nuages
          print('Weather for $city: Temperature: $temperature °C, Clouds: $clouds%');
          setState(() {
            _weatherData[city] = {'temperature': temperature, 'clouds': clouds};
            _progress += (100 / cities.length);
          });
        } else {
          print('Failed to fetch weather for $city');
        }
        currentCityIndex++;
      } else {
        timer.cancel();
        setState(() {
          _isFetching = false; // Arrêter la jauge de progression
        });
      }
    });
  }

  void _startMessageTimer() {
    _messageTimer = Timer.periodic(Duration(seconds: 6), (timer) {
      setState(() {
        _messageIndex = (_messageIndex + 1) % 3;
      });
    });
  }

  void _stopMessageTimer() {
    _messageTimer?.cancel();
    _messageTimer = null;
  }

  String _getMessage() {
    switch (_messageIndex) {
      case 0:
        return 'Nous téléchargeons les données...';
      case 1:
        return 'C\'est presque fini...';
      case 2:
        return 'Plus que quelques secondes avant d\'avoir le résultat...';
      default:
        return 'Nous téléchargeons les données...';
    }
  }

  @override
  void dispose() {
    _stopMessageTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progression'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: 20,
                      width: MediaQuery.of(context).size.width * (_progress / 100),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 38, 149, 51),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _isFetching
                  ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _getMessage(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              )
                  : Expanded(
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (BuildContext context, int index) {
                    final city = cities[index];
                    final weather = _weatherData[city];
                    final temperature = weather?['temperature'] ?? 'N/A';
                    final clouds = weather?['clouds'] ?? 'N/A';
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(city),
                          subtitle: Row(
                            children: [
                              Icon(Icons.thermostat_outlined),
                              SizedBox(width: 5),
                              Text('$temperature °C'),
                              SizedBox(width: 20),
                              Icon(Icons.cloud_outlined),
                              SizedBox(width: 5),
                              Text('$clouds%'),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  city: city,
                                  temperature: temperature,
                                  clouds: clouds,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _progress == 100
          ? FloatingActionButton(
        onPressed: () {
          setState(() {
            _progress = 0;
            _weatherData.clear();
            _isFetching = true;
            _startMessageTimer();
            _fetchWeather();
          });
        },
        child: Icon(Icons.replay),
      )
          : null,
    );
  }
}
