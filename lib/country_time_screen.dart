import 'package:flutter/material.dart';

class LocalTimeScreen extends StatelessWidget {
  const LocalTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("City Local Time"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data['time'],
              style: const TextStyle(fontSize: 56.0, color: Colors.white),
            ),
            Text(
              data['city'],
              style: const TextStyle(fontSize: 22.0, color: Colors.white),
            ),
            Text(
              data['continent'],
              style: const TextStyle(fontSize: 22.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
