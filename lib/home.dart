import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  List<String> list = [
    "test 1",
    "test 2",
    "test 3",
    "test 4",
    "test 5",
    "test 6",
  ];

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : (ModalRoute.of(context)!.settings.arguments) as Map;
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDaytime': result['isDaytime'],
                            'flag': result['flag']
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text('Edit Location', style: TextStyle(color: Colors.grey[300]),)),
                  SizedBox(
                    height: 12,
                  ),
                  Text(data['location'], style: TextStyle(color: Colors.white),),
                  SizedBox(
                    height: 12,
                  ),
                  Text(data['time'], style: TextStyle(color: Colors.white, fontSize: 30),),
                  Column(children: list.map((item) => Text(item)).toList())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}