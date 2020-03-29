import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<NewState> fetchAlbum() async {
  print("fetchAlbum");
  final response =
      await http.get('https://hpb.health.gov.lk/api/get-current-statistical');

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
  final int activeCases;
  final int totLocalCases;
  final int localDeaths;
  final int localRecovered;
  final int inHospital;

  final int totGlobalCases;
  final int globalNewCases;
  final int globalDeaths;
  final int globalNewDeaths;
  final int globalRecovered;

  final String updateTime;

  Data({
    this.newCases,
    this.activeCases,
    this.totLocalCases,
    this.localDeaths,
    this.localRecovered,
    this.inHospital,
    this.globalNewCases,
    this.globalDeaths,
    this.globalNewDeaths,
    this.totGlobalCases,
    this.globalRecovered,
    this.updateTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      newCases: json['local_new_cases'],
      activeCases: json['local_active_cases'],
      totLocalCases: json['local_total_cases'],
      localDeaths: json['local_deaths'],
      localRecovered: json['local_recovered'],
      inHospital: json['local_total_number_of_individuals_in_hospitals'],
      globalNewCases: json['global_new_cases'],
      globalDeaths: json['global_deaths'],
      globalNewDeaths: json['global_new_deaths'],
      totGlobalCases: json['global_total_cases'],
      globalRecovered: json['global_recovered'],
      updateTime: json['update_date_time'],
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
