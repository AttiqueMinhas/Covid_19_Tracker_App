import 'dart:convert';

import 'package:covid_tracker/Models/world_states_model.dart';
import 'package:covid_tracker/Services/Utilities/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SplashServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppURL.worldStatesApi));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('Erroe');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    var data;
    try {
      final response = await http.get(Uri.parse(AppURL.countriesList));
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        return data;
      } else {
        return data;
        //throw Exception('Error');
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
