import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API {
  static const baseUrl = "";

  static addTransaction(Map tData) async {
    try {
      final res = await http.post(Uri.parse("uri"), body: tData);

      if (res.statusCode == 200) {
        //
      } else {
        //
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
