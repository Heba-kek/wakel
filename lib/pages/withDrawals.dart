import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/servicesPage.dart';
import 'package:wakel/pages/withDrawCash.dart';

class Withdrawals extends StatefulWidget {
  @override
  _Withdrawals createState() => new _Withdrawals();
}

class _Withdrawals extends State<Withdrawals> {
  bool viewtext = false;
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
                padding: EdgeInsets.fromLTRB(0, 45, 0, 25),
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
              AppLocalizations().lbWith,
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: HexColor.fromHex("#FBFBFB"),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(
                                          width: 1,
                                          color: HexColor.fromHex("#ECECEC")),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          //  offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 15, 20, 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            AppLocalizations()
                                                                .lbWithReq,
                                                            style: TextStyle(fontFamily: 'Cairo-Bold',
                                                                fontSize: 14,
                                                                color: HexColor
                                                                    .fromHex(
                                                                        "#292929")))
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    child: Text(
                                                        'ID: 9837726113',
                                                        style: TextStyle(fontFamily: 'Cairo-Regular',
                                                            fontSize: 12,
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#858585"))),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            new Spacer(),
                                            Padding(
                                              child: Row(
                                                children: [
                                                  Text('51.00',
                                                      style: TextStyle(fontFamily: 'Cairo-Black',
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              HexColor.fromHex(
                                                                  "#73AF00"))),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 0, 5, 0),
                                                    child: Text(
                                                        AppLocalizations()
                                                            .lbSar,
                                                        style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                            fontSize: 15,
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#73AF00"))),
                                                  )
                                                ],
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 20, 10, 20),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations()
                                                              .lbPaidOn +
                                                          ': 12thApril, 2020',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ),
                                                    new Spacer(),
                                                    Padding(
                                                      child: Image.asset(
                                                          'assets/images/truew.png'),
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 0, 5, 0),
                                                    ),
                                                    Text(
                                                      AppLocalizations().lbConf,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                )),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              gradient: new LinearGradient(
                                                colors: [
                                                  const Color(0xFF73AF00),
                                                  const Color(0xFFB9DC4B),
                                                ],
                                              ),
                                            ),
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                              20, 0, 20, 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: HexColor.fromHex("#FBFBFB"),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(
                                          width: 1,
                                          color: HexColor.fromHex("#ECECEC")),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          //  offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 15, 20, 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            AppLocalizations()
                                                                .lbWithReq,
                                                            style: TextStyle(fontFamily: 'Cairo-Bold',
                                                                fontSize: 14,
                                                                color: HexColor
                                                                    .fromHex(
                                                                        "#292929")))
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    child: Text(
                                                        'ID: 9837726113',
                                                        style: TextStyle(fontFamily: 'Cairo-Regular',
                                                            fontSize: 12,
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#858585"))),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            new Spacer(),
                                            Padding(
                                              child: Row(
                                                children: [
                                                  Text('51.00',
                                                      style: TextStyle(fontFamily: 'Cairo-Black',
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              HexColor.fromHex(
                                                                  "#4DBDEF"))),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 0, 5, 0),
                                                    child: Text(
                                                        AppLocalizations()
                                                            .lbSar,
                                                        style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                            fontSize: 15,
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#4DBDEF"))),
                                                  )
                                                ],
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 20, 10, 20),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      AppLocalizations()
                                                              .lbPaidOn +
                                                          ': ' +
                                                          AppLocalizations()
                                                              .lbPending,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ),
                                                    new Spacer(),
                                                    Padding(
                                                      child: Image.asset(
                                                          'assets/images/truew.png'),
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              5, 0, 5, 0),
                                                    ),
                                                    Text(
                                                      AppLocalizations()
                                                          .lbPending,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                )),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              gradient: new LinearGradient(
                                                colors: [
                                                  const Color(0xFF13A8E3),
                                                  const Color(0xFF4DBDEF),
                                                ],
                                              ),
                                            ),
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                              20, 0, 20, 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: HexColor.fromHex("#FBFBFB"),
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(
                                          width: 1,
                                          color: HexColor.fromHex("#ECECEC")),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          //  offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 15, 20, 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            AppLocalizations()
                                                                .lbWithReq,
                                                            style: TextStyle(fontFamily: 'Cairo-Bold',
                                                                fontSize: 14,
                                                                color: HexColor
                                                                    .fromHex(
                                                                        "#292929")))
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    child: Text(
                                                        'ID: 9837726113',
                                                        style: TextStyle(
                                                            fontSize: 12,fontFamily: 'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#858585"))),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            new Spacer(),
                                            Padding(
                                              child: Row(
                                                children: [
                                                  Text('51.00',
                                                      style: TextStyle(fontFamily: 'Cairo-Black',
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              HexColor.fromHex(
                                                                  "#73AF00"))),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 0, 5, 0),
                                                    child: Text(
                                                        AppLocalizations()
                                                            .lbSar,
                                                        style: TextStyle(fontFamily: 'Cairo-Bold',
                                                            fontSize: 15,
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#73AF00"))),
                                                  )
                                                ],
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 20, 10, 20),
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            AppLocalizations()
                                                                    .lbPaidOn +
                                                                ': ' +
                                                                AppLocalizations()
                                                                    .lbRejected,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10),
                                                          ),
                                                          new Spacer(),
                                                          Padding(
                                                            child: Image.asset(
                                                                'assets/images/truew.png'),
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    5, 0, 5, 0),
                                                          ),
                                                          Text(
                                                            AppLocalizations()
                                                                .lbRejected,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10),
                                                          ),
                                                        ],
                                                      ),
                                                      onTap: () {
                                                        setState(() {
                                                          viewtext = !viewtext;
                                                        });
                                                      },
                                                    ),
                                                    viewtext == false
                                                        ? Visibility(
                                                            visible: false,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          10),
                                                              child: Container(
                                                                child: Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            10,
                                                                            20,
                                                                            10,
                                                                            50),
                                                                    child: Text(
                                                                      langSave ==
                                                                              'en'
                                                                          ? 'Short description for the info about the notification & ation & things Short description for the info about thi e notification & things Short description for the infowShort description for the info about the notification &ation & things Short description for the info about thie notification & things.'
                                                                          : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم الإنسان',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: TextStyle(fontFamily: 'Cairo-Regular',
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              8),
                                                                    )),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10)),
                                                                  color: Color(
                                                                      0x45FFFFFF),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        : Visibility(
                                                            visible: true,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          10),
                                                              child: Container(
                                                                child: Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            10,
                                                                            20,
                                                                            10,
                                                                            50),
                                                                    child: Text(
                                                                      langSave ==
                                                                              'en'
                                                                          ? 'Short description for the info about the notification & ation & things Short description for the info about thi e notification & things Short description for the infowShort description for the info about the notification &ation & things Short description for the info about thie notification & things.'
                                                                          : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم الإنسان',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: TextStyle(fontFamily: 'Cairo-Regular',
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              8),
                                                                    )),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10)),
                                                                  color: Color(
                                                                      0x45FFFFFF),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                  ],
                                                )),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              gradient: new LinearGradient(
                                                colors: [
                                                  const Color(0xFFDC133C),
                                                  const Color(0xFFEF4D4D),
                                                ],
                                              ),
                                            ),
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                              20, 0, 20, 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  child: Container(
                    color: HexColor.fromHex("#4DBDEF"),
                    height: 70,
                    child: Center(
                      child: Text(
                        AppLocalizations().lbREqWN,
                        style: TextStyle(fontFamily: 'Cairo-Bold',fontSize: 18, color: Colors.white),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => Directionality(
                            textDirection: langSave == 'ar'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            child: withDrawCash()),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
