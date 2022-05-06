import 'package:http/http.dart' as http;
import 'dart:convert';

class TotalRepository {
  final String authority =
      "https://kdh3keh6h4.execute-api.ap-northeast-2.amazonaws.com/test";

  final String loginPath = "/user/login";

  static final TotalRepository _totalRepository =
      TotalRepository._privTotalRepository();

  factory TotalRepository() {
    return _totalRepository;
  }

  TotalRepository._privTotalRepository() {}

  Future<Map<String, dynamic>> logIn(Map<String, dynamic> requestBody) async {
    late http.Response result;

    try {
      Uri url = Uri.parse(authority + loginPath);
      // Uri url = Uri.https(authority, loginPath);
      result = await http.post(url, body: json.encode(requestBody));
      print(result.body);
      print(111111);
    } catch (e) {
      print(e);
      print(2222233333);
      return {};
    }

    Map<String, dynamic> res = json.decode(result.body);
    return res;
  }
}
