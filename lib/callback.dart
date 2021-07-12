import 'package:http/http.dart' as http;

class Callback {
  final _urlto = "http://192.168.1.104:8000/api/";

  final urltohouseimages = "http://192.168.1.104:8000/images/";

  _setHeaders() => {'Accept': 'application/json'};

  getData(url) async {
    var fullUrl = Uri.parse(_urlto + url);
    return await http.get(fullUrl, headers: _setHeaders());
  }

  postData(url, data) async {
    var fullUrl = Uri.parse(_urlto + url);
    return await http.post(fullUrl, headers: _setHeaders(), body: data);
  }
}
