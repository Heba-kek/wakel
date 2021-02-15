import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/CustomDropdownButton.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/chosseAcount.dart';
import 'package:wakel/pages/homePage.dart';
import 'package:wakel/pages/otpPage.dart';
import 'package:wakel/pages/registerPage.dart';
import 'package:wakel/pages/signupFree.dart';

class login extends StatefulWidget {
  final String lang;
  final String page;

  login(this.lang, this.page);

  @override
  _login createState() => new _login();
}

class _login extends State<login> {
  final _pass = TextEditingController();
  final _name = TextEditingController();
  int _value = 1;
  String codeC;
  final _num = TextEditingController();

  int _current = 0;
  bool _valueMobile = false;
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
        body: Container(
          //  width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            child: ListView(
              children: [
                Container(
                  //  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        child: Text(
                          AppLocalizations().lbHello,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily:
                              'Cairo-Black',
                              fontSize: 18),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      ),
                      Padding(
                        child: Text(
                          AppLocalizations().lbWelmsg,
                          style: TextStyle(
                              color: HexColor.fromHex("#9A9A9A"),
                              fontWeight: FontWeight.bold,
                              fontFamily:
                              'Cairo-SemiBold',
                              fontSize: 12),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(3, 0, 6, 0),
                                      child:
                                          Image.asset('assets/images/mob.png'),
                                    ),
                                    Text(
                                      AppLocalizations().lbMobNu,

                                      style: TextStyle(
                                          fontFamily:
                                          'Cairo-Bold',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 110,
                                            child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 0, 5, 0),
                                                child: CustomDropdownButton(
                                                    value: _value,
                                                    items: [
                                                      DropdownMenuItem(
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                                'assets/images/sud.png'),
                                                            Padding(
                                                              child: Text("966",
                                                                  style:
                                                                      TextStyle(
                                                                    color: HexColor
                                                                        .fromHex(
                                                                            "#787878"),
                                                                    fontSize:
                                                                        15,
                                                                  )),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5),
                                                            )
                                                          ],
                                                        ),
                                                        value: 1,
                                                      ),
                                                      DropdownMenuItem(
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                                'assets/images/sud.png'),
                                                            Padding(
                                                              child: Text("971",
                                                                  style:
                                                                      TextStyle(
                                                                    color: HexColor
                                                                        .fromHex(
                                                                            "#787878"),
                                                                    fontSize:
                                                                        15,
                                                                  )),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5),
                                                            )
                                                          ],
                                                        ),
                                                        value: 2,
                                                      ),
                                                    ],
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _value = value;
                                                        if (value == 1) {
                                                          codeC = '963';
                                                        } else {
                                                          codeC = '966';
                                                        }
                                                      });
                                                    })),
                                          )
                                        ],
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(0, 16, 0, 0)),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
                                  Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.8,
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: TextField(
                                        controller: _num,
                                        cursorColor:
                                            HexColor.fromHex("#787878"),
                                        style: TextStyle(
                                            color: HexColor.fromHex("#787878")),
                                        decoration: InputDecoration(
                                          //  filled: true,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: HexColor.fromHex(
                                                    "#D7D7D7")),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: HexColor.fromHex(
                                                    "#D7D7D7")),
                                          ),
                                          fillColor: Colors.transparent,
                                          hintText: ' ',
                                          hintStyle: TextStyle(
                                              color:
                                                  HexColor.fromHex("#787878"),
                                              fontSize: 14),
                                          //can also add icon to the end of the textfiled
                                          //  suffixIcon: Icon(Icons.remove_red_eye),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                      child: Icon(
                                        Icons.lock,
                                        color: HexColor.fromHex("#4DBDEF"),
                                      ),
                                    ),
                                    Text(
                                      AppLocalizations().lbPass,
                                      style: TextStyle(
                                          fontFamily:
                                          'Cairo-Bold',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                            widget.lang == 'en'
                                ? Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                                    child: TextField(
                                      controller: _pass,
                                      // textAlign: TextAlign.right,
                                      //  controller: _title,
                                      cursorColor: Colors.transparent,
                                      //  maxLines: 10,
                                      obscureText: true,

                                      // cursorColor: HexColor.fromHex("#1F598E"),
                                      style: TextStyle(
                                          color: HexColor.fromHex("#BCBCBC"),
                                          fontSize: 25),
                                      decoration: InputDecoration(
                                        //  filled: true,
                                        alignLabelWithHint: true,

                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            /* Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          Directionality(
                                              textDirection:
                                              langSave == 'ar'
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                              child: otpPage(widget.free)),
                                    ),
                                  );*/
                                          },
                                          child: Padding(
                                            child: Container(
                                                child: Icon(
                                                  Icons.arrow_forward_sharp,
                                                  color: Colors.white,
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                70.0)),
                                                    gradient:
                                                        new LinearGradient(
                                                      colors: [
                                                        const Color(0xFF2CDCF8),
                                                        const Color(0xFF13A8E3),
                                                      ],
                                                    ))),
                                            padding: EdgeInsets.all(5),
                                          ),
                                        ),
                                        //  filled: true,

                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        fillColor: Colors.transparent,
                                        hintText: AppLocalizations().lbPass,
                                        hintStyle: TextStyle(
                                          color: HexColor.fromHex("#BCBCBC"),
                                          fontSize: 16,
                                        ),
                                        //can also add icon to the end of the textfiled
                                        //  suffixIcon: Icon(Icons.remove_red_eye),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                                    child: TextField(
                                      controller: _pass,
                                      // textAlign: TextAlign.right,
                                      //  controller: _title,
                                      cursorColor: Colors.transparent,
                                      //  maxLines: 10,
                                      obscureText: true,

                                      // cursorColor: HexColor.fromHex("#1F598E"),
                                      style: TextStyle(
                                          color: HexColor.fromHex("#BCBCBC"),
                                          fontSize: 25),
                                      decoration: InputDecoration(
                                        //  filled: true,
                                        alignLabelWithHint: true,

                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            /*Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          Directionality(
                                              textDirection:
                                              langSave == 'ar'
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                              child: otpPage(widget.free)),
                                    ),
                                  );*/
                                          },
                                          child: Padding(
                                            child: Container(
                                                child: Image.asset(
                                                  'assets/images/back.png',
                                                  width: 7,
                                                  height: 8,
                                                ),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                70.0)),
                                                    gradient:
                                                        new LinearGradient(
                                                      colors: [
                                                        const Color(0xFF13A8E3),
                                                        const Color(0xFF2CDCF8),
                                                      ],
                                                    ))),
                                            padding: EdgeInsets.all(4),
                                          ),
                                        ),
                                        //  filled: true,

                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        fillColor: Colors.transparent,
                                        hintText: AppLocalizations().lbPass,
                                        hintStyle: TextStyle(
                                          color: HexColor.fromHex("#BCBCBC"),
                                          fontSize: 16,
                                        ),
                                        //can also add icon to the end of the textfiled
                                        //  suffixIcon: Icon(Icons.remove_red_eye),
                                      ),
                                    ),
                                  ),
                            GestureDetector(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(60, 70, 60, 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 20, 10, 20),
                                    child: Text(
                                      AppLocalizations().lbAcouLog,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily:
                                          'Cairo-Bold',
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xFF13A8E3),
                                          const Color(0xFF2CDCF8),
                                        ],
                                      ),
                                      color: HexColor.fromHex("#F6F6F6")),
                                ),
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
                                              child: registerPage()),
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
                                              child: registerPageFree()),
                                    ),
                                  );
                                }
                              },
                            ),
                            /* Padding(
                          child: Text(AppLocalizations().lbNewU),
                          padding: EdgeInsets.fromLTRB(30, 100, 30, 10),
                        ),

                        GestureDetector(
                          child: Padding(
                            child: Text(
                              AppLocalizations().lbCreateA,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor.fromHex("#4DBDEF")),
                            ),
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => Directionality(
                                    textDirection: langSave ==
                                        'ar'
                                        ? TextDirection
                                        .rtl
                                        : TextDirection
                                        .ltr,
                                    child:registerPage()),
                              ),
                            );
                          },
                        ),*/
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        height: MediaQuery.of(context).size.height - 150,
                      )
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
