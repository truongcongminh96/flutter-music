import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/models/models.dart';

class ContentList extends StatefulWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentList(
      {Key key,
      @required this.title,
      @required @required this.contentList,
      this.isOriginals = false})
      : super(key: key);

  @override
  _ContentListState createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold))),
          Container(
              height: widget.isOriginals ? 500.0 : 220.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(vertical: 12.0),
                itemCount: widget.contentList.length,
                itemBuilder: (BuildContext context, int index) {
                  final Content content = widget.contentList[index];
                  return GestureDetector(
                    onTap: () => print(content.name),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      height: widget.isOriginals ? 400.0 : 200.0,
                      width: widget.isOriginals ? 200.0 : 130.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(content.imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
