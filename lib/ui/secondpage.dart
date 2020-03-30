import 'package:flutter/material.dart';
import 'package:healthynepal/config.dart';
import 'package:healthynepal/ui/thirdpage.dart';
import 'package:healthynepal/ui/userinfo.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool stomach = false;
  bool lungs = false;
  bool kidney = false;
  bool liver = false;
  bool heart = false;
  bool others = false;

  UserInfo _userInfo = UserInfo();

  @override
  Widget build(BuildContext context) {
    final TextStyle style =
        TextStyle(fontSize: MediaQuery.of(context).size.width * 0.056);

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "तलका निम्नलिखित रोगमध्ये तपाईंको परिवारमा कसैलाई कुनै रोग छ/छन् ?",
                style: style,
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Divider(
                      color: Colors.black54,
                    ),
                    OrganDiseaseBox(
                      image: "assets/images/stomach.png",
                      text: "पेटको रोग",
                      textStyle: style,
                      boolValue: stomach,
                      onChangedTrue: (x) {
                        setState(() {
                          stomach = true;
                        });
                      },
                      onChangedFalse: (x) {
                        setState(() {
                          stomach = false;
                        });
                      },
                    ),
                    OrganDiseaseBox(
                      image: "assets/images/lungs.png",
                      text: "फोक्सोको रोग",
                      textStyle: style,
                      boolValue: lungs,
                      onChangedTrue: (x) {
                        setState(() {
                          lungs = true;
                        });
                      },
                      onChangedFalse: (x) {
                        setState(() {
                          lungs = false;
                        });
                      },
                    ),
                    OrganDiseaseBox(
                      image: "assets/images/kidney.png",
                      text: "चिनी रोग वा मिर्गौलाको रोग",
                      textStyle: style,
                      boolValue: kidney,
                      onChangedTrue: (x) {
                        setState(() {
                          kidney = true;
                        });
                      },
                      onChangedFalse: (x) {
                        setState(() {
                          kidney = false;
                        });
                      },
                    ),
                    OrganDiseaseBox(
                      image: "assets/images/liver.png",
                      text: "कलेजोको रोग",
                      textStyle: style,
                      boolValue: liver,
                      onChangedTrue: (x) {
                        setState(() {
                          liver = true;
                        });
                      },
                      onChangedFalse: (x) {
                        setState(() {
                          liver = false;
                        });
                      },
                    ),
                    OrganDiseaseBox(
                      image: "assets/images/heart.png",
                      text: "प्रेसर वा मुटुको रोग",
                      textStyle: style,
                      boolValue: heart,
                      onChangedTrue: (x) {
                        setState(() {
                          heart = true;
                        });
                      },
                      onChangedFalse: (x) {
                        setState(() {
                          heart = false;
                        });
                      },
                    ),
                    OrganDiseaseBox(
                      image: "assets/images/patient.png",
                      text: "अन्य दीर्घकालीन रोग",
                      textStyle: style,
                      boolValue: others,
                      onChangedTrue: (x) {
                        setState(() {
                          others = true;
                        });
                      },
                      onChangedFalse: (x) {
                        setState(() {
                          others = false;
                        });
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        color: Colors.lightBlue,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text(
                          "अगाडि जानुहोस्",
                          style: style.copyWith(color: Colors.white),
                        ),
                        onPressed: () {
                          _userInfo.stomachDisease = stomach;
                          _userInfo.lungsDisease = lungs;
                          _userInfo.kidneyDisease = kidney;
                          _userInfo.liverDisease = liver;
                          _userInfo.heartDisease = heart;
                          _userInfo.otherDisease = others;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThirdPage()));
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OrganDiseaseBox extends StatelessWidget {
  final text;
  final image;
  final boolValue;
  final onChangedTrue;
  final onChangedFalse;
  final textStyle;

  OrganDiseaseBox(
      {this.text,
      this.image,
      this.boolValue,
      this.onChangedTrue,
      this.onChangedFalse,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Image.asset(image),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                text,
                style: textStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Transform.scale(
                        child: Checkbox(
                          value: boolValue,
                          onChanged: onChangedTrue,
                        ),
                        scale: 1,
                      ),
                      Text(
                        "छ",
                        style: textStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Transform.scale(
                        child: Checkbox(
                          value: !boolValue,
                          onChanged: onChangedFalse,
                        ),
                        scale: 1,
                      ),
                      Text(
                        "छैन",
                        style: textStyle,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Divider(
          color: Colors.black54,
        ),
      ],
    );
  }
}
