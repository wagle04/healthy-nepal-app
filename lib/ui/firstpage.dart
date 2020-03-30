import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:healthynepal/config.dart';
import 'package:healthynepal/ui/secondpage.dart';
import 'package:healthynepal/ui/userinfo.dart';
import 'package:location/location.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool fever = false;
  bool cough = false;
  bool soreThroat = false;
  bool breathlessness = false;
  UserInfo _userInfo = UserInfo();

  //for getting location
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  Future<void> getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.DENIED) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.GRANTED) {
        return;
      }
    }
    _locationData = await location.getLocation();
    _userInfo.latitude = _locationData.latitude;
    _userInfo.longitude = _locationData.longitude;
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final TextStyle style = TextStyle(fontSize: screenWidth * 0.056);

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "तपाईंलाई अहिले कस्तो छ?",
                style: style,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: screenHeight * 0.65,
              width: double.infinity,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerLeft,
                  image: AssetImage(
                    "assets/images/anatomy.jpg",
                  ),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Circle(
                    top: screenHeight * 0.0656,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                  Circle(
                    top: screenHeight * 0.17,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                  Circle(
                    top: screenHeight * 0.24,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                  Circle(
                    top: screenHeight * 0.4100,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                  Line(
                    top: screenHeight * 0.0820,
                    width: screenWidth * 0.44,
                  ),
                  Line(
                    top: screenHeight * 0.185,
                    width: screenWidth * 0.44,
                  ),
                  Line(
                    top: screenHeight * 0.255,
                    width: screenWidth * 0.44,
                  ),
                  Line(
                    top: screenHeight * 0.42638,
                    width: screenWidth * 0.44,
                  ),
                  ContainerBox(
                    top: screenHeight * 0.0164,
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.4,
                    text: "ज्वरो आएको छ?",
                    boolValue: fever,
                    onChangedTrue: (x) {
                      setState(() {
                        fever = true;
                      });
                    },
                    onChangedFalse: (x) {
                      setState(() {
                        fever = false;
                      });
                    },
                  ),
                  ContainerBox(
                    top: screenHeight * 0.125,
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.4,
                    text: "खोकी लागेको छ?",
                    boolValue: cough,
                    onChangedTrue: (x) {
                      setState(() {
                        cough = true;
                      });
                    },
                    onChangedFalse: (x) {
                      setState(() {
                        cough = false;
                      });
                    },
                  ),
                  ContainerBox(
                    top: screenHeight * 0.235,
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.4,
                    text: "घाँटी दुखेको छ?",
                    boolValue: soreThroat,
                    onChangedTrue: (x) {
                      setState(() {
                        soreThroat = true;
                      });
                    },
                    onChangedFalse: (x) {
                      setState(() {
                        soreThroat = false;
                      });
                    },
                  ),
                  ContainerBox(
                    top: screenHeight * 0.37718,
                    height: screenHeight * 0.1,
                    width: screenWidth * 0.4,
                    text: "सास फेर्न अप्ठेरो छ?",
                    boolValue: breathlessness,
                    onChangedTrue: (x) {
                      setState(() {
                        breathlessness = true;
                      });
                    },
                    onChangedFalse: (x) {
                      setState(() {
                        breathlessness = false;
                      });
                    },
                  ),
                  Positioned(
                    right: 10,
                    bottom: 0,
                    child: FlatButton(
                      color: Colors.lightBlue,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(
                        "अगाडि जानुहोस्",
                        style: style.copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        _userInfo.fever = fever;
                        _userInfo.cough = cough;
                        _userInfo.soreThroat = soreThroat;
                        _userInfo.breathlessness = breathlessness;
                        if (_userInfo.latitude == null ||
                            _userInfo.longitude == null) {
                          Fluttertoast.showToast(
                            msg: "लोकेसन अनुपलब्ध ।",
                            backgroundColor: Colors.red,
                            timeInSecForIosWeb: 5,
                            textColor: Colors.white,
                          );
                          getLocation();
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondPage()));
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerBox extends StatelessWidget {
  final top;
  final text;
  final width;
  final height;
  final boolValue;
  final onChangedTrue;
  final onChangedFalse;

  ContainerBox({
    this.top,
    this.text,
    this.width,
    this.height,
    this.boolValue,
    this.onChangedTrue,
    this.onChangedFalse,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: width * 0.515625 / 0.4,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.red[300],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: width * 0.056 / 0.4),
            ),
            Flexible(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Transform.scale(
                            child: Checkbox(
                              value: boolValue,
                              onChanged: onChangedTrue,
                            ),
                            scale: 1,
                          ),
                        ),
                        Flexible(
                            child: Text(
                          "छ",
                          style: TextStyle(fontSize: width * 0.056 / 0.4),
                        )),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Transform.scale(
                            child: Checkbox(
                              value: !boolValue,
                              onChanged: onChangedFalse,
                            ),
                            scale: 1,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "छैन",
                            maxLines: 1,
                            style: TextStyle(fontSize: width * 0.056 / 0.4),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  final top;
  final width;

  Line({this.top, this.width});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: width * 0.078125 / 0.44,
      child: Container(
        height: width * 0.00327988 / 0.44,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final top;
  final screenHeight;
  final screenWidth;

  Circle({
    this.top,
    this.screenHeight,
    this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: screenWidth * 0.015625,
      child: Container(
        height: screenWidth * 0.0625,
        width: screenWidth * 0.0625,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
      ),
    );
  }
}
