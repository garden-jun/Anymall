import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class SalePage extends StatefulWidget {
  @override
  _SalePageState createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  Color _color = Color(0xffF0F2FF);
  Color _color2 = Color(0xffA4A9E5);
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: _color,
          title: Text(
            '판매글 작성',
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
                // 글제목
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    style: TextStyle(fontSize: 11),
                    decoration: const InputDecoration(
                      labelText: '글제목',

                      // contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(40)),
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

                // 가격
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    style: TextStyle(fontSize: 11),
                    decoration: const InputDecoration(
                      labelText: '가격',

                      // contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(40)),
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

                // 거래 수단 선택
                Text("거래 수단 (중복 선택 가능)"),
                Container(
                  child: Table(
                    border: TableBorder.all(color: Color(0xffA4A9E5)),
                    children: [
                      TableRow(
                        children: [
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              height: 40,
                            ),
                            Text("    택배"),
                          ]),
                          Row(children: <Widget>[
                            SizedBox(
                              width: 35,
                              height: 40,
                            ),
                            Text("    직거래"),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                ),

                SizedBox(
                  height: 60,
                  child: TextFormField(
                    style: TextStyle(fontSize: 11),
                    decoration: const InputDecoration(
                      labelText: '게시글 내용',

                      // contentPadding: EdgeInsets.all(15),
                      enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.all(Radius.circular(40)),
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

                // 동물 카테고리 선택
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                ),

                ElevatedButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text("게시하기"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        //모서리를 둥글게
                        borderRadius: BorderRadius.circular(20)),
                    primary: Color(0xffA4A9E5),
                    // onPrimary: Colors.blue,	//글자색
                    minimumSize: Size(250, 50), //width, height

                    //child 정렬 - 아래의 Text('$test')
                    textStyle: const TextStyle(fontSize: 15),
                    // elevation: 10.0 // 그림자
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
