import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:uas_43a87006190301/api/api_key.dart';

class HTTP {
  static Future<http.Response> get(String url, String addOn) async {
    url = mainURL + url + "/$api_key";

    if (addOn != "") {
      url += "/$addOn";
    }

    log(url);

    final response = await http.get(Uri.parse(url));
    log(response.statusCode.toString());

    return response;
  }
}
