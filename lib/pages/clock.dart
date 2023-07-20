import 'dart:async';

import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  String hour = DateTime.now().hour.toString();
  String minute = DateTime.now().minute.toString();
  String second = DateTime.now().second.toString();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      var now = DateTime.now();
      hour = now.hour.toString();
      minute = now.minute.toString();
      second = now.second.toString();
    });

    // Agendamos uma nova atualização a cada segundo
    _timer = Timer(const Duration(seconds: 1), _updateTime);
  }

  @override
  void dispose() {
    // Certifique-se de cancelar o timer quando o widget for descartado
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 350,
          decoration: BoxDecoration(
            color: Colors.blueGrey[400],
            borderRadius: BorderRadius.circular(25),
            boxShadow: kElevationToShadow[1],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$hour : ',
                style: const TextStyle(fontSize: 72),
              ),
              Text('$minute : ', style: const TextStyle(fontSize: 72)),
              Text(
                second,
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
