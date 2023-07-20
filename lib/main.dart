import 'package:despertador/pages/clock.dart';
import 'package:despertador/pages/settings.dart';
import 'package:despertador/pages/stopwatch.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const List<Widget> _widgeOptions = <Widget>[
    ClockPage(),
    StopwatchPage(),
    SettingsPage(),
  ];

  void _itemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Despertador'),
        ),
        body: Center(
          child: _widgeOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.av_timer), label: 'clock'),
            BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'time'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'settings'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.grey[700],
          onTap: _itemTaped,
        ),
      ),
    );
  }
}
