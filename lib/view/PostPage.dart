import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:anymall/repository/Repository.dart';
import 'ListPage.dart';
import '../Map/map_position.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? imagefile;
  TextEditingController title_ = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController tags = new TextEditingController();
  TextEditingController delieveryType = new TextEditingController();
  TextEditingController x_coord = new TextEditingController();
  TextEditingController y_coord = new TextEditingController();
  TextEditingController pict1 = new TextEditingController();
  TextEditingController pict2 = new TextEditingController();
  TextEditingController content = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController address2 = new TextEditingController();
  TextEditingController isSold = new TextEditingController();

  void aaa() async {
    TotalRepository tot = TotalRepository();
    Map<String, dynamic> response =
        await tot.PostAPI({"title": title_.text, "price": price.text});
    try {
      if (response["status"] == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ListPage()));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF0F2FF),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xff868cde)),
        title: const Text("판매글 작성"),
        centerTitle: true,
        titleTextStyle:
            TextStyle(color: Color(0xff868cde), fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color(0xffF0F2FF),
      body: Container(
        width: size.width,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(28))),
                padding: const EdgeInsets.all(18),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "글 제목",
                        style: TextStyle(fontSize: 17),
                      ),
                      TextInput(item: title_),
                      const SizedBox(height: 18),
                      Text(
                        "가격",
                        style: TextStyle(fontSize: 17),
                      ),
                      TextInput(item: price),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Text(
                            "거래 수단",
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            "(중복 선택 가능)",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SelectableButton(text: "택배"),
                          SelectableButton(text: "직거래")
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final image = await _picker.pickImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 30 // 이미지 크기 압축
                                  );
                              if (image?.path != null) {
                                setState(() {
                                  imagefile = XFile(image!.path);
                                  // _selectedFiles.clear();
                                });
                              }
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Icon(Icons.image),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(3, 3),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "최대 10장 선택 가능",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "게시글 내용을 작성해주세요."),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        "주소",
                        style: TextStyle(fontSize: 17),
                      ),
                      Row(
                        children: [
                          Expanded(child: TextInput(item: address)),
                          const SizedBox(width: 12),
                          ElevatedButton(
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => MapPosition()));
                              },
                              child: const Text("주소찾기"))
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextInput(item: address2),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Text(
                            "관심 카테고리 선택",
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            "(최소 1개)",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SelectableButton(text: "강아지"),
                              SelectableButton(text: "고양이"),
                              SelectableButton(text: "거북이")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SelectableButton(text: "햄스터"),
                              SelectableButton(text: "포유류"),
                              SelectableButton(text: "  조류  ")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SelectableButton(text: "파충류"),
                              SelectableButton(text: "  어류  "),
                              SelectableButton(text: "양서류")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        aaa();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListPage()));
                        print("현재 사용자 데이터 확인22");
                      },
                      child: const Text("게시하기")))
            ]),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  final TextEditingController item;
  const TextInput({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none),
        controller: item,
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
