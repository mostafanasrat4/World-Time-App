import 'package:flutter/material.dart';
import 'OnlineTime.dart';
import 'country_time_screen.dart';

List<OnlineTime> countriesList = [
  OnlineTime(Location: 'Egypt', URL: 'Africa/Cairo'),
  OnlineTime(Location: 'Dubai', URL: 'Asia/Dubai'),
  OnlineTime(Location: 'Colombo', URL: 'Asia/Colombo'),
  OnlineTime(Location: 'Hong Kong', URL: 'Asia/Hong_Kong'),
  OnlineTime(Location: 'London', URL: 'Europe/London'),
  OnlineTime(Location: 'Moscow', URL: 'Europe/Moscow'),
  OnlineTime(Location: 'Berlin', URL: 'Europe/Berlin'),
  OnlineTime(Location: 'Tokyo', URL: 'Asia/Tokyo'),
  OnlineTime(Location: 'Paris', URL: 'Europe/Paris'),
  OnlineTime(Location: 'Johannesburg', URL: 'Africa/Johannesburg'),
];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "MyApp",
    initialRoute: '/main',
    routes: {
      '/main': (context) => const MyApp(),
      '/local_time': (context) => LocalTimeScreen()
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? Time = "Loading-Time";
  String? City = "Loading-City";
  String? Continent = "Loading-Continent";

  Future<void> fromonlinetimeclasswithindex(index) async {
    OnlineTime onlineTime = countriesList[index];
    await onlineTime.getTime();
    print(onlineTime.URL);
    print(onlineTime.Time);
    Time = onlineTime.Time;
    Continent = onlineTime.URL!.split('/')[0];
    City = onlineTime.URL!.split('/')[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("World Time App"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return InkWell(
                    child: Card(
                       child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          countriesList[position].Location.toString(),
                          style: const TextStyle(fontSize: 22.0, color: Colors.blue),
                        ),
                      ),
                    ),
                    onTap: () async {
                      await fromonlinetimeclasswithindex(position);
                      Navigator.pushNamed(context, '/local_time', arguments: {
                        'continent': Continent,
                        'city': City,
                        'time': Time
                      });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
