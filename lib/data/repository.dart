import 'dart:convert';

import 'package:e_commerce/data/model/detail_model.dart';
import 'package:e_commerce/data/model/model_toko.dart';
import 'package:http/http.dart' as http;

import 'model/model.dart';

class Repository {
  final String URL = "https://jsonplaceholder.typicode.com/todos";
  final String URL_TOKO = "https://api.escuelajs.co/api/v1/";

  Future<List<Root>> getData() async {
    var response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      List<Root> data = (jsonDecode(response.body) as List)
          .map((e) => Root.fromJson(e))
          .toList();
      return data;
    } else {
      throw Exception("Failed load " + response.statusCode.toString());
    }
  }

  Future<List<ModelToko>> getDataToko() async {
    var response = await http.get(Uri.parse(URL_TOKO + "categories"));
    if (response.statusCode == 200) {
      List<ModelToko> data = (jsonDecode(response.body) as List)
          .map((e) => ModelToko.fromJson(e))
          .toList();
      return data;
    } else {
      throw Exception("Failed load " + response.statusCode.toString());
    }
  }

  Future<List<ProductModel>> getProducts(id) async {
    var response =
        await http.get(Uri.parse(URL_TOKO + "categories/" + id + "/products"));
    if (response.statusCode == 200) {
      List<ProductModel> data = (jsonDecode(response.body) as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return data;
    } else {
      throw Exception("Failed load " + response.statusCode.toString());
    }
  }
}
