import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String? url;

  Future getData() async {
    try {
      // print("check get data");
      http.Response response = await http.get(Uri.parse(url.toString()));
      // print("yes get data");

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





// "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlE3YTZzeEpKMUc4c0EyUTFhT3Z0aCJ9.eyJodHRwczovL2FwaS5zYWhoYS5haS9jbGFpbXMvc2FoaGFBcGlTY29wZSI6IlByb2R1Y3Rpb24iLCJodHRwczovL2FwaS5zYWhoYS5haS9jbGFpbXMvYWNjb3VudElkIjoiNmIxMzU1ZWItNTcyYi00ZjMyLTkxNzUtYmJlNWFkOTdjMGIzIiwiaXNzIjoiaHR0cHM6Ly9zYWhoYS1wcm9kdWN0aW9uLmF1LmF1dGgwLmNvbS8iLCJzdWIiOiJ2cnJYWlN1TE5nWE1YdDZSMEhaWWFaUEk1YWRyb0tWUUBjbGllbnRzIiwiYXVkIjoiaHR0cHM6Ly9zYWhoYS1wcm9kdWN0aW9uLmF1LmF1dGgwLmNvbS9hcGkvdjIvIiwiaWF0IjoxNjg4NzE2OTE1LCJleHAiOjE2ODg4MDMzMTUsImF6cCI6InZyclhaU3VMTmdYTVh0NlIwSFpZYVpQSTVhZHJvS1ZRIiwic2NvcGUiOiJhY2NvdW50X3Rva2VuIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.s0x7TKYwqWUkAoBBcZbG6PYPAr52HzuzwcEv4ieigqgaka4Iy3I0HZ_6uXN8Hp1LzBft3bwRlT5Cs1MWRCBjPoe6O97Nya_-Fwpyo9kQTOyTl0FW5Gds_52TIL16MSjfhdM9FjdH-xu69gbVmnrrLBbaDLJinrSrWYq0IrHGskPteX_iRxu1Q1L-VIiCvJo_-e7qU4eyD5Yj9C1iZUepOEJPSC9k_RqJ7NWtZ_AXeYM0tpUonclB99gUB6HyoD6EkBfUmZEUb9SdcznTKFIdVo73qisEV9NC5uABl0qWkSi1dYzD1iRR-Laez4MeOEg2Pz_xwBhnNy-UTe2YVOtuEA"