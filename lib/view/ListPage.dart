import 'package:anymall/repository/Repository.dart';
import 'package:flutter/material.dart';
import 'PostPage.dart';
import 'DetailPage.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController Comment = new TextEditingController();
  Map<String, dynamic> sellComments = {
    "pict": "",
    "title": "",
    "distance": "",
    "price": "",
    "sellCommentId": "",
    "isSold": ""
  };

  void aaa() async {
    TotalRepository tot = TotalRepository();
    try {
      sellComments = await tot.ListPage();
    } catch (e) {
      print(e);
    }
  }

  void searchcomment(String comment) async {
    TotalRepository tot = TotalRepository();
    try {
      await tot.Search(comment);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    aaa();
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
            height: kToolbarHeight,
            child: Row(
              children: [
                Expanded(child: Image.asset("imgs/logo.png")),
                const SizedBox(width: 12),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: TextField(
                        controller: Comment,
                        decoration: InputDecoration(
                            hintText: "검색",
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: Colors.black,
                            border: InputBorder.none),
                      ),
                    ))
              ],
            )),
        backgroundColor: const Color(0xffF0F2FF),
        elevation: 0,
        toolbarHeight: kToolbarHeight * 2,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24),
          itemBuilder: (context, index) => PostItem()),
      bottomNavigationBar: Container(
          height: kToolbarHeight + 30,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: kToolbarHeight,
                    width: size.width,
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    color: const Color(0xffF0F2FF),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Icon(Icons.add_box_outlined),
                            onTap: () {
                              searchcomment("고양이");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PostPage()));
                            },
                          ),
                          Icon(Icons.person_outline_rounded)
                        ]),
                  )),
              Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xff868cde),
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
                    child: const Icon(Icons.refresh, color: Colors.white),
                  ))
            ],
          )),
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(2, 2),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: GridTile(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("imgs/cat.jpg"), fit: BoxFit.cover),
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("게시글 제목",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      const Text("거리", style: TextStyle(fontSize: 10)),
                      const Text("가격",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
