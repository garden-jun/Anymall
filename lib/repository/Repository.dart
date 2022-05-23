import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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

//------------------------------------------------------------------------------------------------------------------------
  // 로그인
  Future<Map<String, dynamic>> logIn(Map<String, dynamic> requestBody) async {
    late http.Response result;

    try {
      Uri url = Uri.parse(
          'https://kdh3keh6h4.execute-api.ap-northeast-2.amazonaws.com/test/user/login');
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

  // 디비 저장
  Future<void> storeLoginDb(String logInId) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      await _prefs.setString('logInId', logInId);
      print("write login success");
    } catch (e) {
      print(e);
    }
  }

  // 로그인 가져오기
  Future<String> getLoginId() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    String logInId = "";
    try {
      logInId = (await _prefs.getString('logInId')) ?? "";
      print("read login success");
    } catch (e) {
      print(e);
    }
    return logInId;
  }

  // Post페이지
  Future<Map<String, dynamic>> PostAPI(Map<String, String> requestBody) async {
    late http.Response result;
    // Map<String, dynamic> requestBody = new Map<String, dynamic>();
    String logInId;
    try {
      Uri url = Uri.parse(
          'https://kdh3keh6h4.execute-api.ap-northeast-2.amazonaws.com/test/sellcomment');
      // Uri url = Uri.https(authority, loginPath);
      // result = await http.post(url, body: json.encode(requestBody));
      logInId = await getLoginId();
      // requestBody["title"]
      // requestBody["price"]
      // requestBody["tags"]
      // requestBody["delieveryType"]
      // requestBody["x_coord"]
      // requestBody["y_coord"]
      // requestBody["pict1"]
      // requestBody["pick2"]
      requestBody["log_in_id"] = logInId;
      // requestBody["content"]
      // requestBody["address"]
      // requestBody["isSold"]

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

  Future<Map<String, dynamic>> ListPage() async {
    late http.Response result;
    Map<String, dynamic> requestBody = new Map<String, dynamic>();
    String logInId;
    try {
      Uri url = Uri.parse(
          'https://kdh3keh6h4.execute-api.ap-northeast-2.amazonaws.com/test/sellcomment/recommend');
      // Uri url = Uri.https(authority, loginPath);
      logInId = await getLoginId();
      requestBody["log_in_id"] = logInId;
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

  // 필터링 게시글 or 검색
  Future<Map<String, dynamic>> Search(String comment) async {
    late http.Response result;
    Map<String, dynamic> requestBody = new Map<String, dynamic>();

    try {
      Uri url = Uri.parse(
          'https://kdh3keh6h4.execute-api.ap-northeast-2.amazonaws.com/test/sellcomment/filter');
      // Uri url = Uri.https(authority, loginPath);
      requestBody['log_in_id'] = await getLoginId();
      requestBody["filtering_type"] = "검색";
      requestBody["filtering_value"] = comment;
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

  Future<int> getSellId() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    int sellId = 0;
    try {
      sellId = (await _prefs.getInt('comment_id')) ?? 0;
      print("read login success");
    } catch (e) {
      print(e);
    }
    return sellId;
  }

  // 게시글 상세 조회
  Future<Map<String, dynamic>> DetailItem() async {
    late http.Response result;
    Map<String, dynamic> requestBody = new Map<String, dynamic>();

    try {
      Uri url = Uri.parse(
          'https://kdh3keh6h4.execute-api.ap-northeast-2.amazonaws.com/test/sellcomment/getsellcomment');
      // Uri url = Uri.https(authority, loginPath);
      requestBody['log_in_id'] = await getLoginId();
      requestBody["sellCommentId"] = await getSellId();
      result = await http.post(url, body: json.encode(requestBody));
      print(result.body);
    } catch (e) {
      print(e);
      print("DetailItem");
      return {};
    }

    Map<String, dynamic> res = json.decode(result.body);
    return res;
  }
}
