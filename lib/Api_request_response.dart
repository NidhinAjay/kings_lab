import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kings_lab/Article_model_class.dart';


class ApiService
{
  Future<List<products>> getproducts() async{
    final url = 'https://dummyjson.com/products';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var body = json.decode(response.body);
      List<products> _data = List<products>.from(
          body['products'].map((e) => products.fromJson(e)).toList());

      print(body);

      return _data;

    }
    else{
      List<products> _data = [];
      return _data;
    }
  }
}