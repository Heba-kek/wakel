import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/servicesPage.dart';

class faqPage extends StatefulWidget {
  @override
  _faqPage createState() => new _faqPage();
}

class _faqPage extends State<faqPage> {
  bool textv = false;
  bool textvt = false;

  bool textvth = false;

  bool textvf = false;

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
          leadingWidth: 100,
          elevation: 0,
          centerTitle: true,
          leading: RaisedButton(
            elevation: 0,
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.fromLTRB(15, 45, 35, 25),
                child: Icon(
                  Icons.arrow_back,
                  color: HexColor.fromHex("#4DBDEF"),
                )),
            onPressed: () {
              Navigator.of(context).pop(); // close the drawer

              print('ugcj');
            },
          ),
          title: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(
              AppLocalizations().lbFaq,
              style: TextStyle(fontFamily: 'Cairo-Black',fontSize: 20, color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          //  width: MediaQuery.of(context).size.width,
          //color: Colors.red,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    child: Container(
                      //  height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: HexColor.fromHex("#FBFBFB"),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                40, 15, 20, 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          AppLocalizations()
                                                              .lbFaqq,
                                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          textv == false
                                              ? Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      40, 15, 20, 10),
                                                  child: Container(
                                                    //   width: MediaQuery.of(context).size.width,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_right,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: HexColor.fromHex(
                                                            "#575757")),
                                                  ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      40, 15, 20, 10),
                                                  child: Container(
                                                    //   width: MediaQuery.of(context).size.width,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_sharp,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          const Color(
                                                              0xFF13A8E3),
                                                          const Color(
                                                              0xFF2CDCF8),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  textv == false
                                      ? Visibility(
                                          visible: false,
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: Text(
                                                  AppLocalizations().lbFaqq,
                                                  style: TextStyle(fontFamily: 'Cairo-Bold',
                                                      fontSize: 13,
                                                      color: Colors.black))),
                                        )
                                      : Visibility(
                                          visible: true,
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  40, 10, 40, 10),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  langSave == 'en'
                                                      ? 'But I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyiand I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrppiness. No one rejects.'
                                                      : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم  الإنسان',
                                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                                      fontSize: 12,
                                                      color: HexColor.fromHex(
                                                          "#858585")),
                                                  textAlign: TextAlign.start,
                                                ),
                                              )),
                                        ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                textv = !textv;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: HexColor.fromHex("#FBFBFB"),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                40, 15, 20, 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          AppLocalizations()
                                                              .lbFaqq,
                                                          style: TextStyle(fontFamily: 'Cairo-Black',
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          textvt == false
                                              ? Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      40, 15, 20, 10),
                                                  child: Container(
                                                    //   width: MediaQuery.of(context).size.width,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_right,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: HexColor.fromHex(
                                                            "#575757")),
                                                  ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      40, 15, 20, 10),
                                                  child: Container(
                                                    //   width: MediaQuery.of(context).size.width,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_sharp,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          const Color(
                                                              0xFF13A8E3),
                                                          const Color(
                                                              0xFF2CDCF8),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  textvt == false
                                      ? Visibility(
                                          visible: false,
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: Text(
                                                  AppLocalizations().lbFaqq,
                                                  style: TextStyle(fontFamily: 'Cairo-Black',
                                                      fontSize: 13,
                                                      color: Colors.black))),
                                        )
                                      : Visibility(
                                          visible: true,
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  40, 10, 40, 10),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  langSave == 'en'
                                                      ? 'But I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyiand I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrppiness. No one rejects.'
                                                      : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم  الإنسان',
                                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                                      fontSize: 12,
                                                      color: HexColor.fromHex(
                                                          "#858585")),
                                                  textAlign: TextAlign.start,
                                                ),
                                              )),
                                        ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                textvt = !textvt;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: HexColor.fromHex("#FBFBFB"),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                40, 15, 20, 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          AppLocalizations()
                                                              .lbFaqq,
                                                          style: TextStyle(fontFamily: 'Cairo-Black',
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          textvth == false
                                              ? Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      40, 15, 20, 10),
                                                  child: Container(
                                                    //   width: MediaQuery.of(context).size.width,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_right,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: HexColor.fromHex(
                                                            "#575757")),
                                                  ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      40, 15, 20, 10),
                                                  child: Container(
                                                    //   width: MediaQuery.of(context).size.width,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_sharp,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          const Color(
                                                              0xFF13A8E3),
                                                          const Color(
                                                              0xFF2CDCF8),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  textvth == false
                                      ? Visibility(
                                          visible: false,
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: Text(
                                                  AppLocalizations().lbFaqq,
                                                  style: TextStyle(fontFamily: 'Cairo-Black',
                                                      fontSize: 13,
                                                      color: Colors.black))),
                                        )
                                      : Visibility(
                                          visible: true,
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  40, 10, 40, 10),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  langSave == 'en'
                                                      ? 'But I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyiand I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrppiness. No one rejects.'
                                                      : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم  الإنسان',
                                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                                      fontSize: 12,
                                                      color: HexColor.fromHex(
                                                          "#858585")),
                                                  textAlign: TextAlign.start,
                                                ),
                                              )),
                                        ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                textvth = !textvth;
                              });
                            },
                          ),
                          GestureDetector(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: HexColor.fromHex("#FBFBFB"),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                40, 15, 20, 10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                          AppLocalizations()
                                                              .lbFaqq,
                                                          style: TextStyle(fontFamily: 'Cairo-Black',
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          textvf == false
                                              ? Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      40, 15, 20, 10),
                                                  child: Container(
                                                    //   width: MediaQuery.of(context).size.width,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_right,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10)),
                                                        color: HexColor.fromHex(
                                                            "#575757")),
                                                  ),
                                                )
                                              : Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      40, 15, 20, 10),
                                                  child: Container(
                                                    //   width: MediaQuery.of(context).size.width,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_sharp,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          const Color(
                                                              0xFF13A8E3),
                                                          const Color(
                                                              0xFF2CDCF8),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  textvf == false
                                      ? Visibility(
                                          visible: false,
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: Text(
                                                  AppLocalizations().lbFaqq,
                                                  style: TextStyle(
                                                      fontSize: 13,fontFamily: 'Cairo-Black',
                                                      color: Colors.black))),
                                        )
                                      : Visibility(
                                          visible: true,
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  40, 10, 40, 10),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  langSave == 'en'
                                                      ? 'But I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyiand I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrppiness. No one rejects.'
                                                      : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم  الإنسان',
                                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                                      fontSize: 12,
                                                      color: HexColor.fromHex(
                                                          "#858585")),
                                                  textAlign: TextAlign.start,
                                                ),
                                              )),
                                        ),
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                textvf = !textvf;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
