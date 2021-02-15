import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/homePage.dart';
import 'package:wakel/pages/homePageFree.dart';

class otpPage extends StatefulWidget {
  final String page;

  otpPage(this.page);

  @override
  _otpPage createState() => new _otpPage();
}

class _otpPage extends State<otpPage> {
  final FocusNode _oneN = FocusNode();
  final FocusNode _twoN = FocusNode();
  final FocusNode _threeN = FocusNode();
  final FocusNode _fourN = FocusNode();
  final FocusNode _fiveN = FocusNode();
  final FocusNode _sexN = FocusNode();
  final _numo = TextEditingController();
  final _numt = TextEditingController();
  final _numth = TextEditingController();
  final _numf = TextEditingController();
  SpecificLocalizationDelegate _specificLocalizationDelegate;
  String langSave;

  Future navigationPage() async {
    var preferences = await SharedPreferences.getInstance();

    langSave = preferences.getString('lang');
    print("lang saved == $langSave");
    //langSave=lang1;
    if (langSave == 'ar') {
      _specificLocalizationDelegate =
          SpecificLocalizationDelegate(new Locale("ar"));

      AppLocalizations.load(new Locale("ar"));
    } else {
      _specificLocalizationDelegate =
          SpecificLocalizationDelegate(new Locale("en"));
      AppLocalizations.load(new Locale("en"));
    }
  }

  @override
  void initState() {
    navigationPage();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          centerTitle: true,
          leading: RaisedButton(
            elevation: 0,
            color: HexColor.fromHex("#FCFCFC"),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 35, 25),
                child: Icon(
                  Icons.arrow_back,
                  color: HexColor.fromHex("#4DBDEF"),
                )),
            onPressed: () {
              Navigator.of(context).pop(); // close the drawer

              print('ugcj');
            },
          ),
          backgroundColor: HexColor.fromHex("#FCFCFC"),
        ),
        body: Container(
          color: HexColor.fromHex("#FCFCFC"),
          //  width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            child: ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                        child: Text(
                          AppLocalizations().lbOtp,
                          style: TextStyle(     fontFamily: 'Cairo-Black',
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                          AppLocalizations().lbOtpM,
                          style: TextStyle(     fontFamily: 'Cairo-SemiBold',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: HexColor.fromHex("#9A9A9A")),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Container(
                                      width: 65,
                                      height: 77,
                                      child: Center(
                                        child: Theme(
                                            data: new ThemeData(
                                                primaryColor:
                                                    Colors.transparent,
                                                // accentColor: Colors.orange,
                                                hintColor: Colors.transparent),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.center,
                                              textInputAction:
                                                  TextInputAction.next,
                                              //  autofocus: true,

                                              controller: _numo,
                                              onChanged: (v) {
                                                FocusScope.of(context)
                                                    .requestFocus(_twoN);
                                              },

                                              maxLength: 1,
                                              cursorColor: Colors.transparent,
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      "#4DBDEF"),
                                                  fontSize: 34),
                                              decoration: InputDecoration(
                                                // contentPadding: EdgeInsets.all(10),

                                                filled: true,
                                                labelStyle: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor),

                                                fillColor: Colors.transparent,
                                                //can also add icon to the end of the textfiled
                                                //  suffixIcon: Icon(Icons.remove_red_eye),
                                              ),
                                            )),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: HexColor.fromHex("#7D7D7D")
                                                .withOpacity(0.15),
                                            spreadRadius: 3,
                                            blurRadius: 9,
                                            //  offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Container(
                                      width: 65,
                                      height: 77,
                                      child: Center(
                                        child: Theme(
                                            data: new ThemeData(
                                                primaryColor:
                                                    Colors.transparent,
                                                // accentColor: Colors.orange,
                                                hintColor: Colors.transparent),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.center,
                                              textInputAction:
                                                  TextInputAction.next,
                                              //  autofocus: true,

                                              controller: _numt,
                                              focusNode: _twoN,
                                              onChanged: (v) {
                                                FocusScope.of(context)
                                                    .requestFocus(_threeN);
                                              },

                                              maxLength: 1,
                                              cursorColor: Colors.transparent,
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      "#4DBDEF"),
                                                  fontSize: 34),
                                              decoration: InputDecoration(
                                                filled: true,
                                                labelStyle: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor),

                                                fillColor: Colors.transparent,
                                                //can also add icon to the end of the textfiled
                                                //  suffixIcon: Icon(Icons.remove_red_eye),
                                              ),
                                            )),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: HexColor.fromHex("#7D7D7D")
                                                .withOpacity(0.15),
                                            spreadRadius: 3,
                                            blurRadius: 9,
                                            //  offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Container(
                                      width: 65,
                                      height: 77,
                                      child: Center(
                                        child: Theme(
                                            data: new ThemeData(
                                                primaryColor:
                                                    Colors.transparent,
                                                // accentColor: Colors.orange,
                                                hintColor: Colors.transparent),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.center,
                                              textInputAction:
                                                  TextInputAction.next,
                                              //  autofocus: true,
                                              focusNode: _threeN,

                                              controller: _numth,
                                              onChanged: (v) {
                                                FocusScope.of(context)
                                                    .requestFocus(_fourN);
                                              },

                                              maxLength: 1,
                                              cursorColor: Colors.transparent,
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      "#4DBDEF"),
                                                  fontSize: 34),
                                              decoration: InputDecoration(
                                                filled: true,
                                                labelStyle: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor),

                                                fillColor: Colors.transparent,
                                                //can also add icon to the end of the textfiled
                                                //  suffixIcon: Icon(Icons.remove_red_eye),
                                              ),
                                            )),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: HexColor.fromHex("#7D7D7D")
                                                .withOpacity(0.15),
                                            spreadRadius: 3,
                                            blurRadius: 9,
                                            //  offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Container(
                                      width: 65,
                                      height: 77,
                                      child: Center(
                                        child: Theme(
                                            data: new ThemeData(
                                                primaryColor:
                                                    Colors.transparent,
                                                // accentColor: Colors.orange,
                                                hintColor: Colors.transparent),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              textAlign: TextAlign.center,
                                              textInputAction:
                                                  TextInputAction.next,
                                              //  autofocus: true,
                                              focusNode: _fourN,

                                              controller: _numf,

                                              maxLength: 1,
                                              cursorColor: Colors.transparent,
                                              style: TextStyle(
                                                  color: HexColor.fromHex(
                                                      "#4DBDEF"),
                                                  fontSize: 34),
                                              decoration: InputDecoration(
                                                filled: true,
                                                labelStyle: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor),

                                                fillColor: Colors.transparent,
                                                //can also add icon to the end of the textfiled
                                                //  suffixIcon: Icon(Icons.remove_red_eye),
                                              ),
                                            )),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: HexColor.fromHex("#7D7D7D")
                                                .withOpacity(0.15),
                                            spreadRadius: 3,
                                            blurRadius: 9,
                                            //  offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                //  width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                                  child: Text(
                                    AppLocalizations().lbCon,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'Cairo-Bold',
                                        color: Colors.white, fontSize: 19),
                                  ),
                                ),
                                decoration: langSave == 'en'
                                    ? BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80)),
                                        border: Border.all(
                                            width: 1,
                                            color: HexColor.fromHex("#E1E1E1")),
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFF13A8E3),
                                            const Color(0xFF2CDCF8),
                                          ],
                                        ))
                                    : BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80)),
                                        border: Border.all(
                                            width: 1,
                                            color: HexColor.fromHex("#E1E1E1")),
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFF2CDCF8),
                                            const Color(0xFF13A8E3),
                                          ],
                                        )),
                              ),
                              onTap: () {
                                if (widget.page == '1') {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          Directionality(
                                              textDirection: langSave == 'ar'
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                              child: HomeScreen(langSave)),
                                    ),
                                  );
                                } else {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          Directionality(
                                              textDirection: langSave == 'ar'
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                              child: HomeScreenfree(langSave)),
                                    ),
                                  );
                                }
                              },
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
                                child: Container(
                                  //  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Image.asset(
                                          'assets/images/retry.png',
                                        )),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      border: Border.all(
                                          width: 2,
                                          color: HexColor.fromHex("#4DBDEF")),
                                      color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
                        child: Text(
                          AppLocalizations().lbWrongM,
                          style: TextStyle(fontFamily: 'Cairo-SemiBold',fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                          AppLocalizations().lbChangeM,
                          style: TextStyle(fontFamily: 'Cairo-Bold',
                              fontWeight: FontWeight.bold,
                              fontSize: 21,
                              color: HexColor.fromHex("#4DBDEF")),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
              shrinkWrap: true,
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          ),
        ));
  }
}
