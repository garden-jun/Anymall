import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:anymall/repository/Repository.dart';

class DetailPage extends StatefulWidget {
  final String sellCommentId_w;
  DetailPage({required this.sellCommentId_w}) {
    print("testestes");
    print(this.sellCommentId_w);
  }
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late String title;
  late String address;
  late String price;
  late String content;
  late List<String> tags;
  late String x_coord;
  late String y_coord;
  late String pictUrls;
  late String owner;
  // late String open_chatting_link = t1["open_chatting_link"];
  late String sellCommentId;
  late String isSold;
  late String nickname;
  late String open_chatting_link;
  late String deliveryType;

  bool networkFinished = false;

  void aaa() async {
    TotalRepository tot = TotalRepository();
    print("sellCommentID_w @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    print(widget.sellCommentId_w);

    try {
      Map<String, dynamic> resp =
          await tot.DetailItem(sellCommentId: widget.sellCommentId_w);
      print("aaa:");
      print(resp);

      Map<String, dynamic> t1 = resp as Map<String, dynamic> ?? {};
      title = t1["title"];
      address = t1["address"];
      price = t1["price"].toString();
      content = t1["content"];
      tags = [];
      for (dynamic t in t1["tags"]) {
        tags.add(t.toString());
      }

      x_coord = t1["x_coord"];
      y_coord = t1["y_coord"];
      pictUrls = t1["pictUrls"][0];
      owner = t1["owner"];
      open_chatting_link =
          t1["open_chatting_link"] ?? 'http://openchatting.link';
      sellCommentId = t1["comment_id"].toString();
      isSold = t1["is_sold"].toString();
      nickname = t1["nickname"];
      deliveryType = t1["delievery_type"] ?? '택배22';

      setState(() {
        networkFinished = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    aaa();
  }

  @override
  Widget build(BuildContext context) {
    return !networkFinished
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
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
                                  child: Image.network(pictUrls),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(pictUrls ?? ''),
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
                            child: Icon(Icons.arrow_back_ios_new,
                                color: Colors.white)),
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
                                    nickname,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    address,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.link),
                                      const SizedBox(width: 4),
                                      Text(
                                        open_chatting_link,
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
                            title,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          showtags(tags),
                          const SizedBox(height: 24),
                          Text(
                            content,
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 60),
                          Row(children: [
                            Text(
                              "거래 수단",
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(width: 24),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Text(
                                deliveryType,
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ])
                        ],
                      )),
                ],
              ),
            ),
          );
  }

  Row showtags(List<String> tags) {
    List<Widget> tag = [];

    for (String temp in tags) {
      Widget t = Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Text(
          temp,
          style: TextStyle(color: Colors.grey),
        ),
      );
      // const SizedBox(width: 24),

      tag.add(t);
    }

    return Row(children: tag);
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
