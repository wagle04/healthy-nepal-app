import 'dart:convert' as convert;

import 'package:healthynepal/config.dart';
import 'package:http/http.dart' as http;

class UserInfo {
  double _latitude;
  double _longitude;
  bool _fever;
  bool _cough;
  bool _soreThroat;
  bool _breathlessness;
  bool _stomachDisease;
  bool _lungsDisease;
  bool _kidneyDisease;
  bool _liverDisease;
  bool _heartDisease;
  bool _otherDisease;
  String _familySize;
  String _elderMembers;
  String _phoneNumber;
  String _name;

  //creating singleton class fro user info
  static final UserInfo _userInfo = UserInfo._internal();
  factory UserInfo() {
    return _userInfo;
  }
  UserInfo._internal();

  //setter functions
  set latitude(double lat) => _latitude = lat;
  set longitude(double long) => _longitude = long;
  set fever(bool f) => _fever = f;
  set cough(bool f) => _cough = f;
  set soreThroat(bool f) => _soreThroat = f;
  set breathlessness(bool f) => _breathlessness = f;
  set stomachDisease(bool f) => _stomachDisease = f;
  set lungsDisease(bool f) => _lungsDisease = f;
  set kidneyDisease(bool f) => _kidneyDisease = f;
  set liverDisease(bool f) => _liverDisease = f;
  set heartDisease(bool f) => _heartDisease = f;
  set otherDisease(bool f) => _otherDisease = f;
  set familySize(String x) => _familySize = x;
  set elderMembers(String x) => _elderMembers = x;
  set phoneNumber(String x) => _phoneNumber = x;
  set name(String x) => _name = x;

  //getter functions
  double get latitude => _latitude;
  double get longitude => _longitude;
  bool get fever => _fever;
  bool get cough => _cough;
  bool get soreThroat => _soreThroat;
  bool get breathlessness => _breathlessness;
  bool get stomachDisease => _stomachDisease;
  bool get lungsDisease => _lungsDisease;
  bool get kidneyDisease => _kidneyDisease;
  bool get liverDisease => _liverDisease;
  bool get heartDisease => _heartDisease;
  bool get otherDisease => _otherDisease;
  String get familySize => _familySize;
  String get elderMembers => _elderMembers;
  String get phoneNumber => _phoneNumber;
  String get name => _name;

  @override
  String toString() {
    return "{ " +
        "latitude: " +
        latitude.toString() +
        " longitude: " +
        longitude.toString() +
        " fever: " +
        fever.toString() +
        " cough: " +
        cough.toString() +
        " soreThroat: " +
        soreThroat.toString() +
        " breathlessness:" +
        breathlessness.toString() +
        " stomachDisease: " +
        stomachDisease.toString() +
        " lungsDisease: " +
        lungsDisease.toString() +
        " kidneyDisease: " +
        kidneyDisease.toString() +
        " liverDisease: " +
        liverDisease.toString() +
        " heartDisease: " +
        heartDisease.toString() +
        " otherDisease: " +
        otherDisease.toString() +
        " familySize: " +
        familySize.toString() +
        " elderMembers: " +
        elderMembers.toString() +
        " phoneNumber: " +
        phoneNumber.toString() +
        " name: " +
        name.toString() +
        " }";
  }

  String toParams() {
    String familySize = _familySize;
    if (_familySize == "4+") familySize = "5";
    String elderMembers = _elderMembers;
    if (_elderMembers == "2+") elderMembers = "3";
    return "?name=$_name&phoneNumber=$_phoneNumber&familySize=$familySize&elderMembers=$elderMembers&latitude=$_latitude&longitude=$_longitude&fever=$_fever&cough=$_cough&soreThroat=$_soreThroat&breathlessness=$_breathlessness&stomach=$_stomachDisease&lungs=$_liverDisease&kidney=$_kidneyDisease&liver=$_liverDisease&heart=$_heartDisease&other=$_otherDisease";
  }
}

class FormController {
  final void Function(String) callback;

  static const String URL = spreadSheetURL;

  static const STATUS_SUCCESS = 'SUCCESS';

  FormController(this.callback);

  void submitForm(UserInfo userInfo) async {
    try {
      await http.get(URL + userInfo.toParams()).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      callback("error");
      print(e);
    }
  }
}
