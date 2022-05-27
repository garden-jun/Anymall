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
  Future<Map<String, dynamic>> PostAPI(
      String title, String price, String pict) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://kdh3keh6h4.execute-api.ap-northeast-2.amazonaws.com/test/sellcomment'));
    String logInId = await getLoginId();
    request.fields.addAll({
      'title': title,
      'price': price,
      'tags': '["강아지", "고양이"]',
      'delieveryType': '택배',
      'x_coord': '127.034629',
      'y_coord': '37.6491192',
      'log_in_id': logInId,
      'content': '바뀜 test.',
      'address': '서울시 도봉구 쌍문동 286-60',
      'isSold': '0',
      'sellCommentId': '3'
    });
    request.files.add(await http.MultipartFile.fromPath('pict1', pict));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String res = await response.stream.bytesToString();
      print(res);
      Map<String, dynamic> resJson = json.decode(res);
      return resJson;
    } else {
      print(response.reasonPhrase);
      return {};
    }
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

    Map<String, dynamic> res = json.decode(utf8.decode(result.bodyBytes));
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
      print("getSellId success");
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

    Map<String, dynamic> res = json.decode(utf8.decode(result.bodyBytes));
    return res;
  }
}
