import 'package:flutter/material.dart';

class signUpPage extends StatefulWidget {
  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  // Color _color = Color.fromARGB(103, 240, 242, 255);
  Color _color = Color(0xffF0F2FF);
  Color _color2 = Color(0xffA4A9E5);
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: _color,
          title: Text(
            '회원가입',
            style: TextStyle(
              color: Color(0xffA4A9E5),
            ),
          ),
          centerTitle: true, // 가운데 정렬
          elevation: 0.0 // 밑에 그림자 없애기
          ),
      body: Container(
        color: Color(0xffF0F2FF),
        child: Container(
          color: Color(0xffFFFFFF),
          margin: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
          child: ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(30.0),
              children: <Widget>[
                // Input name
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    style: TextStyle(fontSize: 11),
                    decoration: const InputDecoration(
                      labelText: '이름',

                      // contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(
                          color: Color(0xffA4A9E5),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                ),

                // Row(children: <Widget>[
                //   TextFormField(
                //     decoration: const InputDecoration(
                //       labelText: '닉네임',
                //       // contentPadding: EdgeInsets.all(15),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(40)),
                //         borderSide: BorderSide(
                //           color: Color(0xffA4A9E5),
                //           width: 1.0,
                //         ),
                //       ),
                //     ),
                //   ),

                //   // 중복 확인버튼
                //   ElevatedButton(
                //     onPressed: () {
                //       // Respond to button press
                //     },
                //     child: Text("중복화인"),
                //     style: ElevatedButton.styleFrom(
                //         shape: RoundedRectangleBorder(
                //             //모서리를 둥글게
                //             borderRadius: BorderRadius.circular(20)),
                //         primary: Color.fromARGB(255, 94, 90, 110),
                //         // onPrimary: Colors.blue,	//글자색
                //         // minimumSize: Size(250, 50), //width, height

                //         //child 정렬 - 아래의 Text('$test')
                //         textStyle: const TextStyle(fontSize: 15)),
                //   )
                // ]),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                ),

                // interested category
                Text(" 관심카테고리 선택 (최소 1개)"),

                Container(
                  child: Table(
                    border: TableBorder.all(color: Color(0xffA4A9E5)),
                    children: [
                      TableRow(
                        children: [
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              child: Checkbox(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  }),
                            ),
                            Text("강아지"),
                          ]),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              child: Checkbox(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  }),
                            ),
                            Text("고양이"),
                          ]),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              child: Checkbox(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  }),
                            ),
                            Text("거북이"),
                          ]),
                        ],
                      ),
                      TableRow(
                        children: [
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              child: Checkbox(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  }),
                            ),
                            Text("햄스터"),
                          ]),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              child: Checkbox(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  }),
                            ),
                            Text("포유류"),
                          ]),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              child: Checkbox(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  }),
                            ),
                            Text("조류"),
                          ]),
                        ],
                      ),
                      TableRow(
                        children: [
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              child: Checkbox(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  }),
                            ),
                            Text("파충류"),
                          ]),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              child: Checkbox(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  }),
                            ),
                            Text("어류"),
                          ]),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              child: Checkbox(
                                  value: _isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value;
                                    });
                                  }),
                            ),
                            Text("양서류"),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
