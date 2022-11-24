import 'package:flutter/material.dart';
import 'package:weather_app/views/current_weather.dart';
import 'package:weather_app/views/aditional_information.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Langkah pertama untuk membuat UI didalam App.
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        title: const Text(
          "Weather App",
          style: TextStyle(color: Color(000000)),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
            color: Color(000000),
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Membuat sebuah custom widget di dalam App.
          currentWeather(Icons.wb_sunny_rounded, "26.3", "Klaten"),
          SizedBox(
            height: 20.0,
          ),
          Text("Additional Information",
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          SizedBox(
            height: 20.0,
          ),
          additionalInformation("24", "2","1014", "24.6")
        ]),
    );
  }
}
