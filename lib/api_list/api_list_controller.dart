import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:myapp/model/list_of_spacecraft/list_of_spacecraft.dart';
import 'package:myapp/model/list_of_spacecraft/spacecraft.dart';

class ApiListController {
  static Future<List<Spacecraft>> fetchScraftList() async {
    var url = Uri.parse("https://isro.vercel.app/api/spacecrafts");

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      ListOfSpacecraft listOfSpacecraft =
          ListOfSpacecraft.fromJson(jsonResponse);

      return listOfSpacecraft.spacecrafts ?? [];

      print('Number of books about http: $jsonResponse.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [];
    }
  }
}
