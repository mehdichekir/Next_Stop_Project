import 'dart:convert';

import 'package:http/http.dart' as http;


class HelpersFunctions{
  static bool initialized = false;
  static List metropossibleWays=[];
  static List trainPossibleWays=[];
  static List busPossibleWays=[];
    static Future<void> initializeApp() async {
    
    if (!initialized) {
      initialized = true;
      metropossibleWays = await getMetroPossibleWays();
      print('metropossibleways = $metropossibleWays');
      trainPossibleWays=await getTrainPossibleWays();
      busPossibleWays = await getBusPossibleWays();
    }
  }
}

Future<List> getMetroPossibleWays() async {
  var possibleWays=[];
  List ligne1=[];
  List ligne2=[];
  List ligne3=[];
  List ligne4 = [];
    final url = Uri.https(
      'transport-app-7ec0a-default-rtdb.europe-west1.firebasedatabase.app',
      '/Feuil1.json',
    );

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body) as List<dynamic>;
      List<Map<String, String>> dataFormatted = data.map((item) {
  return Map<String, String>.from(item.map((key, value) {
    return MapEntry(key, value.toString());
  }));
}).toList();
  
      dataFormatted.map((item){
         if(item.values.contains('1')){
           ligne1.add(item['Station']);
         }
         else if(item.values.contains('2')){
          ligne2.add(item['Station']);
         }
         else if(item.values.contains('3')){
          ligne3.add(item['Station']);
         }else{
          ligne4.add(item['Station']);
         }
      }).toList();
      possibleWays=[ligne1.toSet().toList(),
      ligne2.toSet().toList(),
      ligne3.toSet().toList(),
      ligne4.toSet().toList()]; 
      return possibleWays;

    } catch (e) {
      print('Error occurred: $e');
      return [];
    }
  }


  Future<List> getTrainPossibleWays() async {
    final url = Uri.https(
      'transport-app-7ec0a-default-rtdb.europe-west1.firebasedatabase.app',
      '/train.json',
    );

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body) as List<dynamic>;
      List<Map<String, String>> trainPossibleWays = data.map((item) {
  return Map<String, String>.from(item.map((key, value) {
    return MapEntry(key, value.toString());
  }));
}).toList();
      return trainPossibleWays;

    } catch (e) {
      print('Error occurred: $e');
      return [];
    }
  }


    Future<List> getBusPossibleWays() async {
    final url = Uri.https(
      'transport-app-7ec0a-default-rtdb.europe-west1.firebasedatabase.app',
      '/bus.json',
    );

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body) as List<dynamic>;
      List<Map<String, String>> busPossibleWays = data.map((item) {
  return Map<String, String>.from(item.map((key, value) {
    return MapEntry(key, value.toString());
  }));
}).toList();
      return busPossibleWays;

    } catch (e) {
      print('Error occurred: $e');
      return [];
    }
  }


 