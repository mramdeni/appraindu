import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_api.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/views/current_weather.dart';
import 'package:weather_app/views/aditional_information.dart';
import 'package:weather_app/views/about_page.dart';

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
      routes: {
        '/home': (context) => const HomePage(),
        '/about_page': (context) => const AboutPage()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Fungsi untuk memanggil API dengan Future
  WeatherApi client = WeatherApi();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("Klaten");
  }

  @override
  Widget build(BuildContext context) {
    // Langkah pertama untuk membuat UI didalam App.
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              // LinearGradient
              gradient: LinearGradient(
                // colors for gradient
                colors: [
                  Color.fromARGB(255, 4, 48, 151),
                  Color.fromARGB(255, 14, 171, 238),
                ],
              ),
            ),
          ),
          elevation: 0.0,
          title: const Text(
            "Aplikasi Cuaca",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () =>
            Navigator.of(context).popAndPushNamed('/about_page'),
            icon: Icon(Icons.info),
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        // drawer: const NavigationDrawer(),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Membuat sebuah custom widget di dalam App.
                    currentWeather(Icons.wb_sunny_rounded, "${data!.temp}°C",
                        "${data!.cityName}"),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Informasi Tambahan",
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
                    // Menambahkan Widget Informasi
                    additionalInformation("${data!.wind}", "${data!.humidity}",
                        "${data!.pressure}", "${data!.feels_like}")
                    // Memasukkan API
                  ]);
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ));
  }
}

// class NavigationDrawer extends StatelessWidget {
//   const NavigationDrawer({super.key});

//   @override
//   Widget build(BuildContext context) => Drawer(
//         child: SingleChildScrollView(
//             child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             buildHeader(context),
//             // buildMenuItems(context),
//           ],
//         )),
//       );

//   Widget buildHeader(BuildContext context) => Container(
//     padding: EdgeInsets.only(
//       top: MediaQuery.of(context).padding.top,
//     ),
//   );

//   Widget buildMenuItems(BuildContext context) => Container(
//     padding: const EdgeInsets.all(24),
//     child: Wrap(
//       runSpacing: 16,
//       children: [
//         ListTile(
//           leading: const Icon(Icons.home_max_outlined),
//           title: const Text('home'),
//           onTap: () =>
//             Navigator.of(context).pushReplacement(MaterialPageRoute(
//               builder: (context) => const HomePage()
//           )),
//         ),
//         ListTile(
//           leading: const Icon(Icons.info),
//           title: const Text('about'),
//           onTap: () =>
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (context) => const AboutPage()
//           )),
//         ),
//       ],
//     ),
//   );
// }
