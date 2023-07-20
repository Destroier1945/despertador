import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  bool _isAlarmEnabled = false;

  final List<String> daysOfWeek = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado',
    'Domingo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text(
                  '7:00',
                  style: TextStyle(fontSize: 48),
                ),
                trailing: Switch(
                  value: _isAlarmEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isAlarmEnabled = value;
                    });
                  },
                ),
                subtitle: const Row(children: [
                  Icon(Icons.alarm),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Em 9 horas e 52 minutos'),
                ]),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Bom dia',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: daysOfWeek.map((day) {
                  final abbreviatedDay = day.substring(0, 3).toLowerCase();
                  return Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey,
                    ),
                    child: Center(
                      child: Text(
                        abbreviatedDay,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
