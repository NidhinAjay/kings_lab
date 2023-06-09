import 'package:http/http.dart' as http;

class Api {
  final String _Url = "https://dummyjson.com/auth";

  authData(data, apiUrl) async {
    var fullUrl = _Url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }

  getData(apiUrl) async{
    var fullUrl = _Url + apiUrl;
    return await http.get(
      Uri.parse(fullUrl)
    );
  }
}
