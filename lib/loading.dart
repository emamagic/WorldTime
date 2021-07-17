import 'package:first_project/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  final String test = 'test';
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await worldTime.getTime();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': worldTime.location,
        'flag': worldTime.flag,
        'time': worldTime.time,
        'isDaytime': worldTime.isDaytime
      });
    });
    /**
     * you can access to [test] by calling -> widget.test
     */
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        )
      ),
    );
  }
}
