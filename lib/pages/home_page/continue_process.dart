import 'package:flutter/material.dart';
import 'package:flutter_music/constant/constant_app.dart';

class ContinueProcess extends StatefulWidget {
  @override
  _ContinueProcessState createState() => _ContinueProcessState();
}

class _ContinueProcessState extends State<ContinueProcess> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headline4,
            children: [
              TextSpan(text: "Continue "),
              TextSpan(
                text: "reading...",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(38.5),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 33,
                color: Color(0xFFD3D3D3).withOpacity(.84),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(38.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Crushing & Influence",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Gary Venchuk",
                                style: TextStyle(
                                  color: kLightBlackColor,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "Chapter 7 of 10",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: kLightBlackColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/images/book-1.png",
                          width: 55,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 7,
                  width: size.width * .65,
                  decoration: BoxDecoration(
                    color: kProgressIndicator,
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 40)
      ],
    );
  }
}
