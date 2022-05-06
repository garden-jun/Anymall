import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Color _color = Color(0xffF0F2FF);
  // Color _color2 = Color(0xffF0F2FF);

  List<String> todoList = new List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    todoList.add('강아지목걸이');
    todoList.add('고양이목걸이');
    todoList.add('거북이목걸이');
    todoList.add('흠');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Detail Example'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              child: Text(
                todoList[index],
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/third', arguments: todoList[index]);
              },
            ),
          );
        },
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNavigation(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNavigation(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/second');
    setState(() {
      todoList.add(result as String);
    });
  }
}


/*
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   body: Column(
        // children: <Widget>[
        // // 상단 바
        // Container(
        //   width: 400,
        //   height: 100,
        //   color: Color(0xffF0F2FF),
        //   // margin: EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0),
        //   child: Row(
        //     children: <Widget>[
        //       // 상단바 그림
        //       SizedBox(
        //         child: Image.asset(
        //           "imgs/mainTop_img.PNG",
        //           fit: BoxFit.contain,
        //           height: 50,
        //         ),
        //       ),

        //       // 검색기능 구현
        //       SizedBox(
        //         width: 200,
        //         height: 20,
        //         child: TextFormField(
        //           style: TextStyle(fontSize: 11),
        //           decoration: const InputDecoration(
        //             labelText: '검색',
        //             icon: Icon(Icons.search),
        //             // contentPadding: EdgeInsets.all(15),
        //             enabledBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.all(Radius.circular(40)),
        //               borderSide: BorderSide(
        //                 color: Color(0xffA4A9E5),
        //                 width: 2.0,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        // Text("1231231243"),
        // Item List
        ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(30.0),
      children: <Widget>[
        SizedBox(
          child: Image.asset(
            "imgs/mainTop_img.PNG",
            fit: BoxFit.contain,
            height: 50,
          ),
        ),
      ],
    );
    //   ],
    // ));
  }
}
*/
