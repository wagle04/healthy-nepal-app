import 'package:flutter/material.dart';
import 'package:healthynepal/config.dart';
import 'package:url_launcher/url_launcher.dart';

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  _launchURL() async {
    const url = 'http://volunteer.healthynepal.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLCodeForCore() async {
    const url = 'https://codeforcore.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final TextStyle style = TextStyle(fontSize: width * 0.056);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  "तपाईंले दिनुभएको जानकारीको लागि धन्यवाद !",
                  style: style,
                ),
                SizedBox(height: 20),
                Image.asset(
                  "assets/images/stay-home.png",
                  height: width * 0.3125,
                  width: width * 0.3125,
                ),
                SizedBox(height: 20),
                Text(
                  "सुरक्षित रहनुहोला !",
                  style: style,
                ),
                SizedBox(height: 20),
                Text(
                  "नयाँ जानकारी आए यहि एप बाट सु-सुचित गर्नेछौ ।",
                  style: style,
                ),
                SizedBox(height: 30),
                Text(
                  'स्वयंसेवकको रुपमा जोडिनको लागी',
                  style: style,
                ),
                GestureDetector(
                  onTap: _launchURL,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "http://volunteer.healthynepal.org/",
                          style: style.copyWith(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontFamily: 'Utsaah',
                          ),
                        ),
                        TextSpan(
                          text: '  आवद्ध हुनुहोला ।',
                          style: style.copyWith(
                            color: Colors.black,
                            fontFamily: 'Utsaah',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: _launchURL,
                  child: Image.asset(
                    "assets/images/banner.png",
                    height: width * 0.15625,
                    width: width * 0.46875,
                  ),
                ),
                SizedBox(height: 10),
                Text('Developed by:', style: style),
                GestureDetector(
                  onTap: _launchURLCodeForCore,
                  child: Image.asset(
                    "assets/images/c4clogo.png",
                    height: width * 0.15625,
                    width: width * 0.46875,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String name(String val) {
  if (val.isEmpty)
    return 'नाम आवश्यक छ';
  else
    return null;
}

String phoneNumber(String val) {
  if (val.isEmpty)
    return 'सम्पर्क नम्बर आवश्यक छ';
  else if (val.length != 10)
    return 'गलत सम्पर्क नम्बर';
  else
    return null;
}
