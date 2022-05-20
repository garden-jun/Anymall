import 'package:anymall/repository/Repository.dart';
import 'package:flutter/material.dart';
import 'ListPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color _color = Color(0xffF0F2FF);
  Color _color2 = Color(0xffA4A9E5);
  TextEditingController logIn = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
            title: Image.asset(
              "imgs/anymall_mark.PNG",
              fit: BoxFit.contain,
              height: 60,
            ),
            backgroundColor: Color(0xff868cde),
            centerTitle: true, // 가운데 정렬
            elevation: 0.0 // 밑에 그림자 없애기
            ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 40.0, top: 60.0, right: 40.0),
        child: Column(
          children: <Widget>[
            Text(
              "Any몰",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: _color2,
                // fontFamily: 'Signatra',
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(5.0, 4.0),
                    blurRadius: 10.0,
                    color: Color.fromARGB(255, 202, 201, 201),
                  ),
                  // Shadow(
                  //   offset: Offset(10.0, 10.0),
                  //   blurRadius: 8.0,
                  //   color: Color.fromARGB(125, 0, 0, 255),
                  // ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
            ),
            // Input Id
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: logIn,
                style: TextStyle(fontSize: 11),
                decoration: const InputDecoration(
                  labelText: '아이디 입력',

                  // contentPadding: EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(
                      color: Color(0xffA4A9E5),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            ),

            // Input Password
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: password,
                style: TextStyle(fontSize: 11),
                decoration: const InputDecoration(
                  labelText: '비밀번호 입력',

                  // contentPadding: EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(
                      color: Color(0xffA4A9E5),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
            // ),

            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text(
                "아이디 찾기 | 비밀번호 찾기",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 141, 140, 140),
                ),
                textAlign: TextAlign.left,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
            ),

            ElevatedButton(
              onPressed: () {
                aaa();
                //Navigator.push(context,
                //MaterialPageRoute(builder: (context) => ListPage()));
              },
              child: Text("로그인"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      //모서리를 둥글게
                      borderRadius: BorderRadius.circular(40)),
                  primary: Color(0xffA4A9E5),
                  // onPrimary: Colors.blue,	//글자색
                  minimumSize: Size(300, 50), //width, height

                  //child 정렬 - 아래의 Text('$test')
                  textStyle: const TextStyle(fontSize: 15),
                  elevation: 10.0 // 그림자
                  ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            ),

            OutlinedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text("회원가입"),
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    //모서리를 둥글게
                    borderRadius: BorderRadius.circular(40),
                  ),
                  side: BorderSide(
                    color: Color(0xffA4A9E5),
                    width: 2.0,
                  ),
                  primary: Color(0xffA4A9E5),
                  // onPrimary: Colors.blue,	//글자색
                  minimumSize: Size(300, 50), //width, height

                  //child 정렬 - 아래의 Text('$test')
                  textStyle: const TextStyle(fontSize: 15)),
            )
          ],
        ),
      ),
    );
  }

  void aaa() async {
    TotalRepository tot = TotalRepository();
    Map<String, dynamic> response =
        await tot.logIn({"logInId": logIn.text, "password": password.text});
    try {
      if (response["status"] == 0) {
        await tot.storeLoginDb(logIn.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ListPage()));
      }
    } catch (e) {
      print(e);
    }
  }
}
