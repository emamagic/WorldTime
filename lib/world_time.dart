import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try {
      var uri = Uri.http("worldtimeapi.org", "/api/timezone/$url", {'q': '{http}'});
      var response = await get(uri);
      if(response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
        time = DateFormat.jm().format(now);

      } else {
        print('network has problem status cod is ${response.statusCode}');
      }
    } catch(e) {
      print('caught error: $e');
      time = 'could not get time data';
    }

  }

}