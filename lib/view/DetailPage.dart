import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1, height: 300, autoPlay: true),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("imgs/cat.jpg"),
                                    fit: BoxFit.cover)));
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                          Icon(Icons.arrow_back_ios_new, color: Colors.white)),
                  left: 20,
                  top: 50,
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                              size: 40,
                            ),
                            backgroundColor: Colors.grey.shade200),
                        const SizedBox(width: 18),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "닉네임",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "경기도 시흥시 ㅇㅇ동",
                              style: TextStyle(fontSize: 12),
                            ),
                            Row(
                              children: [
                                Icon(Icons.link),
                                const SizedBox(width: 4),
                                Text(
                                  "오픈채팅 링크",
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "게시글 제목",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Text(
                            "# 카테고리",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Text(
                            "# 카테고리",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "글 내용",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 60),
                    Row(
                      children: [
                        Text(
                          "거래 수단",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 24),
                        SelectableButton(text: "택배"),
                        const SizedBox(width: 24),
                        SelectableButton(text: "직거래"),
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  final String text;
  const SelectableButton({Key? key, required this.text}) : super(key: key);

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return _isSelected
        ? ElevatedButton(
            onPressed: () {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            child: Text(widget.text))
        : OutlinedButton(
            onPressed: () {
              setState(() {
                _isSelected = !_isSelected;
              });
            },
            child: Text(widget.text));
  }
}
