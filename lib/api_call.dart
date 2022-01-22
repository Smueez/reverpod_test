import 'package:http/http.dart';
import 'dart:convert';
import 'model.dart';

class APICall {
  Future<Model> getData() async {
    Response res = await get(Uri.parse('https://jsonkeeper.com/b/WPXD'));
    var data = await jsonDecode(res.body);
    Model model = Model.fromJson(data);

    return model;
  }
}