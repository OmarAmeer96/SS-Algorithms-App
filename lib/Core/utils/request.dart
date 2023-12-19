import 'dart:convert';

import 'package:http/http.dart';

Future getData(String url) async {
  Response response = await get(Uri.parse(url));
  return response.body;
}

Future postData(String url, Map<String, String> body) async {
  Response response = await post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(body),
  );
  return response.body;
}
