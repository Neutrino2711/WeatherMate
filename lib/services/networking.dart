import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String? url;

  Future getData() async {
    try {
      print("check get data");
      http.Response response = await http.get(Uri.parse(url.toString()));
      print("yes get data");

      if (response.statusCode == 200) {
        String? data = response.body;
        return jsonDecode(data);
      } else {
        // print("check");
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
