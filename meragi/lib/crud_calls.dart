import 'package:http/http.dart';

import 'dart:convert';

import 'package:meragi/data_modals.dart';

Future<List<Miragi>> getCases() async {
  Uri api = "fakestoreapi.com/products" as Uri;
  Response res = await get(api);

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    List<Miragi> cases =
        body.map((dynamic item) => Miragi.fromJson(item)).toList();
    return cases;
  } else {
    throw "Failed to load cases list";
  }
}
