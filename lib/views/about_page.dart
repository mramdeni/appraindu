import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
   static const String _title = 'Aplikasi Cuaca - Tentang';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),
              flexibleSpace: Container(
              decoration: BoxDecoration(
              // LinearGradient
                gradient: LinearGradient(
                // colors for gradient
                  colors: [
                    Color.fromARGB(255, 151, 4, 4),
                    Color.fromARGB(255, 238, 33, 14),
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).popAndPushNamed('/home'),
            )
          ],
        ),
        body: Center(
          child: SelectionArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SelectionContainer.disabled(child: Text('Aplikasi Cuaca dibuat untuk memenuhi project akhir flutter.')),
                SelectionContainer.disabled(child: Text('Dibuat oleh Fikri dan Ramdeni. Terimakasih')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}