import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthynepal/config.dart';
import 'package:healthynepal/ui/fourthpage.dart';
import 'package:healthynepal/ui/userinfo.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  String familySize = "2";
  String elderMember = "0";

  UserInfo _userInfo = UserInfo();

  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  showDialogForNumber(TextStyle style) {
    showDialog(
      context: context,
      child: SimpleDialog(
        title: Image.asset(
          "assets/images/name.png",
          height: 35,
          width: 35,
        ),
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: name,
                      controller: nameController,
                      style: style,
                      decoration: InputDecoration(
                        labelText: 'प्रयोगकर्ताको नाम',
                        labelStyle: style,
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: phoneNumber,
                      style: style,
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'सम्पर्क नम्बर',
                        labelStyle: style,
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                      ),
                    ),
                    FlatButton(
                      color: Colors.lightBlue,
                      child: Text(
                        "पेश गर्नुहोस्",
                        style: style.copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _userInfo.name = nameController.text;
                          _userInfo.phoneNumber = numberController.text;
                          _userInfo.familySize = familySize;
                          _userInfo.elderMembers = elderMember;
                          String responses;

                          FormController formController =
                              FormController((String response) {
                            Navigator.pop(context);
                            print("Response: $response");
                            setState(() {
                              responses = response;
                            });
                            if (response == FormController.STATUS_SUCCESS) {
                              print("successfully saved");
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FourthPage()),
                                  (Route<dynamic> route) => false);
                            } else {
                              print("error while saving");

                              Fluttertoast.showToast(
                                msg: 'अपलोड गर्दा त्रुटि',
                                backgroundColor: Colors.red,
                                timeInSecForIosWeb: 5,
                                textColor: Colors.white,
                              );
                            }
                          });
                          formController.submitForm(_userInfo);
                          if (responses != "error") {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              child: Dialog(
                                child: Container(
                                  height: 100,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          'अपलोड  हुँदैछ',
                                          style: style,
                                        ),
                                        CupertinoActivityIndicator(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style =
        TextStyle(fontSize: MediaQuery.of(context).size.width * 0.056);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              "तपाईंको घरमा कति जना हुनुहुन्छ?",
              style: style,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 40,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  NumberBox(
                    text: "1",
                    style: style,
                    selected: "1" == familySize,
                    onTap: () {
                      setState(() {
                        familySize = "1";
                      });
                    },
                  ),
                  NumberBox(
                    text: "2",
                    style: style,
                    selected: "2" == familySize,
                    onTap: () {
                      setState(() {
                        familySize = "2";
                      });
                    },
                  ),
                  NumberBox(
                    text: "3",
                    style: style,
                    selected: "3" == familySize,
                    onTap: () {
                      setState(() {
                        familySize = "3";
                      });
                    },
                  ),
                  NumberBox(
                    text: "4",
                    style: style,
                    selected: "4" == familySize,
                    onTap: () {
                      setState(() {
                        familySize = "4";
                      });
                    },
                  ),
                  NumberBox(
                    text: "4+",
                    style: style,
                    selected: "4+" == familySize,
                    onTap: () {
                      setState(() {
                        familySize = "4+";
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              "५० बर्ष माथिका कति जना हुनुहुन्छ?",
              style: style,
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  NumberBox(
                    text: "0",
                    style: style,
                    selected: "0" == elderMember,
                    onTap: () {
                      setState(() {
                        elderMember = "0";
                      });
                    },
                  ),
                  NumberBox(
                    text: "1",
                    style: style,
                    selected: "1" == elderMember,
                    onTap: () {
                      setState(() {
                        elderMember = "1";
                      });
                    },
                  ),
                  NumberBox(
                    text: "2",
                    style: style,
                    selected: "2" == elderMember,
                    onTap: () {
                      setState(() {
                        elderMember = "2";
                      });
                    },
                  ),
                  NumberBox(
                    text: "2+",
                    style: style,
                    selected: "2+" == elderMember,
                    onTap: () {
                      setState(() {
                        elderMember = "2+";
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                color: Colors.lightBlue,
                child: Text(
                  "अगाडि जानुहोस्",
                  style: style.copyWith(color: Colors.white),
                ),
                onPressed: () {
                  _userInfo.familySize = familySize;
                  _userInfo.elderMembers = elderMember;
                  showDialogForNumber(style);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NumberBox extends StatelessWidget {
  final text;
  final onTap;
  final selected;
  final style;
  NumberBox({this.text, this.onTap, this.selected, this.style});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: selected ? Colors.red : Colors.lightBlue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            text,
            style: style.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
