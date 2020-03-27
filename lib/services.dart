import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<NewState> fetchAlbum() async {
  final response =
      await  http.get('https://hpb.health.gov.lk/api/get-current-statistical');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return NewState.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Couldnt get data');
  }
}

class Data {
  final int newCases;
  final int totCases;
  final String updateDateTime;
  final int localDeaths;
  final int localRecovered;

  Data({
    this.newCases,
    this.totCases,
    this.updateDateTime,
    this.localDeaths,
    this.localRecovered,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      newCases: json['local_new_cases'],
      totCases: json['local_total_cases'],
      updateDateTime: json['update_date_time'],
      localDeaths: json['local_deaths'],
      localRecovered: json['local_recovered'],
    );
  }
}

class NewState {
  final Data data;

  NewState({this.data});

  factory NewState.fromJson(Map<String, dynamic> json) {
    return NewState(data: Data.fromJson(json['data']));
  }
}
