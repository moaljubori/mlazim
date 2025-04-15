// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:convert';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart' as http;

import 'models/classes.dart';

const String api_website = 'http://mlazimiq.com/';

class RemoteService {
  Future<clas> fetchClasses() async {
    final response = await http.get(Uri.parse(
        api_website + 'ServerApi/all.php?GETDATA=1&lang=' + 'EN_lang'.tr));
    if (response.statusCode == 200) {
     // print(jsonDecode(response.body)['classes']);
      return clas.fromJson(jsonDecode(response.body)['classes']);
    } else {
      throw Exception('Failed to load fetchClasses');
    }
  }
}
