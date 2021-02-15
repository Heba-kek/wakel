import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/servicesPage.dart';

class settingPage extends StatefulWidget {
  @override
  _settingPage createState() => new _settingPage();
}

class _settingPage extends State<settingPage> {
  bool textT = false;
  bool textP = false;
  List<String> photo = [
    'assets/images/khho.png',
    'assets/images/book.png',
    'assets/images/grafic.png',
    'assets/images/prog.png',
    'assets/images/tar.png',
    'assets/images/jam.png',
  ];
  List<String> title = [
    AppLocalizations().lbkhho,
    AppLocalizations().lbBooks,
    AppLocalizations().lbGra,
    AppLocalizations().lbPros,
    AppLocalizations().lbTra,
    AppLocalizations().lbGh,
  ];
  List<bool> chech = [false, false, false, false, false, false];

  bool textt = false;
  String clickt = '0';
  bool texto = false;
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
          leadingWidth: 100,
          centerTitle: true,
          leading: RaisedButton(
            padding: EdgeInsets.zero,
            highlightColor: Colors.transparent,
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
              AppLocalizations().lbSett,
              style: TextStyle(
                  fontFamily: 'Cairo-Black', fontSize: 20, color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          //  width: MediaQuery.of(context).size.width,
          //color: Colors.red,
          //  height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  child: Container(
                    height: 70,
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations().lbAppV,
                          style: TextStyle(
                              fontFamily: 'Cairo-Bold',
                              fontSize: 18,
                              color: HexColor.fromHex("#464646")),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            '3.0.14 - 14233321',
                            style: TextStyle(
                                fontFamily: 'Cairo-Regular',
                                fontSize: 18,
                                color: HexColor.fromHex("#CCCCCC")),
                          ),
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  onTap: () {
                    /*Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => packageSuccess(),
                      ),
                    );*/
                  },
                ),
              ),
              Padding(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
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
                                                              .lbNotiSet,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo-Bold',
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black))
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  child: Text(
                                                      AppLocalizations()
                                                          .lbChossec,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Cairo-SemiBold',
                                                          fontSize: 12,
                                                          color:
                                                              HexColor.fromHex(
                                                                  "#858585"))),
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          texto == false
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
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                texto = !texto;
                              });
                            },
                          ),
                          texto == false
                              ? Visibility(
                                  visible: false,
                                  child: Text(''),
                                )
                              : Visibility(
                                  visible: true,
                                  child: Padding(
                                    child: Container(
                                      //  height: MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          Container(
                                              //  height: MediaQuery.of(context).size.height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    child: Container(
                                                      height: 530,
                                                      child: GridView.count(
                                                        crossAxisCount: 2,
                                                        shrinkWrap: false,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        mainAxisSpacing: 10.0,
                                                        crossAxisSpacing: 20.0,
                                                        children: List.generate(
                                                            photo.length,
                                                            (index) {
                                                          return Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 0, 0, 0),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  chech[index] =
                                                                      !chech[
                                                                          index];
                                                                });
                                                              },
                                                              child: Container(
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                10,
                                                                                10,
                                                                                10,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(shape: BoxShape.circle, color: chech[index] ? HexColor.fromHex("#E1E1E1") : HexColor.fromHex("#4DBDEF")),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(5.0),
                                                                                child: chech[index]
                                                                                    ? Icon(
                                                                                        Icons.check,
                                                                                        size: 10.0,
                                                                                        color: Colors.white,
                                                                                      )
                                                                                    : Icon(
                                                                                        Icons.check,
                                                                                        size: 10.0,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                Image.asset(
                                                                              photo[index],

                                                                              // fit: BoxFit.fill,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            10),
                                                                        child:
                                                                            Text(
                                                                          title[
                                                                              index],
                                                                          style: TextStyle(
                                                                              fontFamily: 'Cairo-Bold',
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 10),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          color: HexColor.fromHex(
                                                                              "#C7C7C7"),
                                                                          width:
                                                                              1),
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              20)),
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.all(20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            95, 15, 95, 5),
                                                    child: GestureDetector(
                                                      child: Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(55,
                                                                    20, 55, 20),
                                                            child: Center(
                                                              child: Text(
                                                                AppLocalizations()
                                                                    .lbSave,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Cairo-SemiBold',
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: HexColor
                                                                    .fromHex(
                                                                        "#DFDFDF"),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                const Color(
                                                                    0xFF43ACD5),
                                                                const Color(
                                                                    0xFF4DBDEF),
                                                              ],
                                                            ),
                                                          )),
                                                      onTap: () {
                                                        setState(() {
                                                          clickt = '2';
                                                        });
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  ),
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
                                                              .lbUpMem,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo-Bold',
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black))
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  child: Text(
                                                      AppLocalizations()
                                                          .lbUpMemMsg,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Cairo-SemiBold',
                                                          fontSize: 12,
                                                          color:
                                                              HexColor.fromHex(
                                                                  "#858585"))),
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          textt == false
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
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                textt = !textt;
                              });
                            },
                          ),
                          textt == false
                              ? Visibility(
                                  visible: false,
                                  child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text(AppLocalizations().lbFaqq,
                                          style: TextStyle(
                                              fontFamily: 'Cairo-SemiBold',
                                              fontSize: 13,
                                              color: Colors.black))),
                                )
                              : clickt == '0'
                                  ? Padding(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  HexColor.fromHex("#DFDFDF"),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 5, 5, 5),
                                                child: GestureDetector(
                                                  child: Container(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                25, 10, 25, 10),
                                                        child: Text(
                                                          AppLocalizations()
                                                              .lbBasic,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo-Bold',
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            const Color(
                                                                0xFF43ACD5),
                                                            const Color(
                                                                0xFF4DBDEF),
                                                          ],
                                                        ),
                                                        border: Border.all(
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#DFDFDF"),
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      )),
                                                  onTap: () {
                                                    setState(() {
                                                      clickt = '0';
                                                    });
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 5, 5, 5),
                                                child: GestureDetector(
                                                  child: Container(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                25, 10, 25, 10),
                                                        child: Text(
                                                          AppLocalizations()
                                                              .lbPlus,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo-Bold',
                                                              fontSize: 13,
                                                              color: HexColor
                                                                  .fromHex(
                                                                      "888888")),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      )),
                                                  onTap: () {
                                                    setState(() {
                                                      clickt = '1';
                                                    });
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 5, 5, 5),
                                                child: GestureDetector(
                                                  child: Container(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                25, 10, 25, 10),
                                                        child: Text(
                                                          AppLocalizations()
                                                              .lbProS,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo-Bold',
                                                              fontSize: 13,
                                                              color: HexColor
                                                                  .fromHex(
                                                                      "888888")),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      )),
                                                  onTap: () {
                                                    setState(() {
                                                      clickt = '2';
                                                    });
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      padding:
                                          EdgeInsets.fromLTRB(30, 20, 30, 0),
                                    )
                                  : clickt == '1'
                                      ? Padding(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF"),
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 5, 5, 5),
                                                    child: GestureDetector(
                                                      child: Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(25,
                                                                    10, 25, 10),
                                                            child: Text(
                                                              AppLocalizations()
                                                                  .lbBasic,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Cairo-Bold',
                                                                  fontSize: 13,
                                                                  color: HexColor
                                                                      .fromHex(
                                                                          "888888")),
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                          )),
                                                      onTap: () {
                                                        setState(() {
                                                          clickt = '0';
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 5, 5, 5),
                                                    child: GestureDetector(
                                                      child: Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(25,
                                                                    10, 25, 10),
                                                            child: Text(
                                                              AppLocalizations()
                                                                  .lbPlus,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Cairo-Bold',
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: HexColor
                                                                    .fromHex(
                                                                        "#DFDFDF"),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                const Color(
                                                                    0xFF43ACD5),
                                                                const Color(
                                                                    0xFF4DBDEF),
                                                              ],
                                                            ),
                                                          )),
                                                      onTap: () {
                                                        setState(() {
                                                          clickt = '1';
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 5, 5, 5),
                                                    child: GestureDetector(
                                                      child: Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(25,
                                                                    10, 25, 10),
                                                            child: Text(
                                                              AppLocalizations()
                                                                  .lbProS,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Cairo-Bold',
                                                                  fontSize: 13,
                                                                  color: HexColor
                                                                      .fromHex(
                                                                          "888888")),
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                          )),
                                                      onTap: () {
                                                        setState(() {
                                                          clickt = '2';
                                                        });
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                              30, 20, 30, 0),
                                        )
                                      : Padding(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF"),
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 5, 5, 5),
                                                    child: GestureDetector(
                                                      child: Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(25,
                                                                    10, 25, 10),
                                                            child: Text(
                                                              AppLocalizations()
                                                                  .lbBasic,
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Cairo-Bold',
                                                                  fontSize: 13,
                                                                  color: HexColor
                                                                      .fromHex(
                                                                          "888888")),
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                          )),
                                                      onTap: () {
                                                        setState(() {
                                                          clickt = '0';
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 5, 5, 5),
                                                    child: GestureDetector(
                                                      child: Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(25,
                                                                    10, 25, 10),
                                                            child: Text(
                                                              AppLocalizations()
                                                                  .lbPlus,
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      'Cairo-Bold',
                                                                  color: HexColor
                                                                      .fromHex(
                                                                          "888888")),
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .transparent,
                                                          )),
                                                      onTap: () {
                                                        setState(() {
                                                          clickt = '1';
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 5, 5, 5),
                                                    child: GestureDetector(
                                                      child: Container(
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(25,
                                                                    10, 25, 10),
                                                            child: Text(
                                                              AppLocalizations()
                                                                  .lbProS,
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  fontFamily:
                                                                      'Cairo-Bold',
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: HexColor
                                                                    .fromHex(
                                                                        "#DFDFDF"),
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                const Color(
                                                                    0xFF43ACD5),
                                                                const Color(
                                                                    0xFF4DBDEF),
                                                              ],
                                                            ),
                                                          )),
                                                      onTap: () {
                                                        setState(() {
                                                          clickt = '2';
                                                        });
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          padding: EdgeInsets.fromLTRB(
                                              30, 20, 30, 0),
                                        ),
                          textt == false
                              ? Visibility(
                                  visible: false,
                                  child: Text('hgg'),
                                )
                              : Visibility(
                                  visible: true,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(30, 10, 30, 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 0),
                                              child: Text(
                                                AppLocalizations().lbWakB,
                                                style: TextStyle(
                                                    fontFamily: 'Cairo-Bold',
                                                    color: HexColor.fromHex(
                                                        "#292929"),
                                                    fontSize: 16),
                                              ),
                                            ),
                                            new Spacer(),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 0),
                                              child: Text(
                                                '\$10.00',
                                                style: TextStyle(
                                                    fontFamily: 'Cairo-Black',
                                                    color: HexColor.fromHex(
                                                        "#4DBDEF"),
                                                    fontSize: 19,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              child: Text(
                                                AppLocalizations().lbPerM,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo-SemiBold',
                                                  color: HexColor.fromHex(
                                                      "#4DBDEF"),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 15, 10, 0),
                                              child: Image.asset(
                                                  'assets/images/iconb.png'),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 15, 10, 0),
                                              child: Text(
                                                AppLocalizations().lbCustonC,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo-Regular',
                                                  color: HexColor.fromHex(
                                                      "#858585"),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 15, 10, 0),
                                              child: Image.asset(
                                                  'assets/images/bookmark.png'),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 15, 10, 0),
                                              child: Text(
                                                AppLocalizations().lbBook,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo-Regular',
                                                  color: HexColor.fromHex(
                                                      "#858585"),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 15, 10, 0),
                                              child: Image.asset(
                                                  'assets/images/dis.png'),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 15, 10, 0),
                                              child: Text(
                                                AppLocalizations().lbOfferF,
                                                style: TextStyle(
                                                  fontFamily: 'Cairo-Regular',
                                                  color: HexColor.fromHex(
                                                      "#858585"),
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 15, 5, 5),
                                          child: GestureDetector(
                                            child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      25, 20, 25, 20),
                                                  child: Center(
                                                    child: Text(
                                                      AppLocalizations().lbGo,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Cairo-Bold',
                                                          fontSize: 13,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: HexColor.fromHex(
                                                          "#DFDFDF"),
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      const Color(0xFF43ACD5),
                                                      const Color(0xFF4DBDEF),
                                                    ],
                                                  ),
                                                )),
                                            onTap: () {
                                              setState(() {
                                                clickt = '2';
                                              });
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
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
                                                              .lbPP,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo-Bold',
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black))
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  child: Text(
                                                      AppLocalizations().lbPPM,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Cairo-SemiBold',
                                                          fontSize: 12,
                                                          color:
                                                              HexColor.fromHex(
                                                                  "#858585"))),
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          textP == false
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
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                textP = !textP;
                              });
                            },
                          ),
                          textP == false
                              ? Visibility(
                                  visible: false,
                                  child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text(AppLocalizations().lbFaqq,
                                          style: TextStyle(
                                              fontFamily: 'Cairo-Bold',
                                              fontSize: 13,
                                              color: Colors.black))),
                                )
                              : Visibility(
                                  visible: true,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          langSave == 'en'
                                              ? 'But I must explain to you how all this mistaken ideai of denouncing pleasure and praising pain was boyi and I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrBut I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyixplorer of the truth, the master-builder of human hrBut I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyiand I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrppiness. No one rejects.'
                                              : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم والسلام، وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد جعل الله السلام تحية المسلم، بحيث لا ينبغي أن يتكلم الإنسان وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد جعل الله السلام تحية المسلم، بحيث لا ينبغي أن يتكلم الإنسان وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد تعاملاتهم في الحياة',
                                          style: TextStyle(
                                              fontFamily: 'Cairo-Regular',
                                              fontSize: 12,
                                              color:
                                                  HexColor.fromHex("#858585")),
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
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
                                                              .lbT,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Cairo-Bold',
                                                              fontSize: 13,
                                                              color:
                                                                  Colors.black))
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  child: Text(
                                                      AppLocalizations().lbTm,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Cairo-SemiBold',
                                                          fontSize: 12,
                                                          color:
                                                              HexColor.fromHex(
                                                                  "#858585"))),
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          new Spacer(),
                                          textT == false
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
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                textT = !textT;
                              });
                            },
                          ),
                          textT == false
                              ? Visibility(
                                  visible: false,
                                  child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text(AppLocalizations().lbFaqq,
                                          style: TextStyle(
                                              fontFamily: 'Cairo-Bold',
                                              fontSize: 13,
                                              color: Colors.black))),
                                )
                              : Visibility(
                                  visible: true,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(40, 10, 40, 10),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          langSave == 'en'
                                              ? 'But I must explain to you how all this mistaken ideai of denouncing pleasure and praising pain was boyi and I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrBut I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyixplorer of the truth, the master-builder of human hrBut I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyiand I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrppiness. No one rejects.'
                                              : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم والسلام، وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد جعل الله السلام تحية المسلم، بحيث لا ينبغي أن يتكلم الإنسان وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد جعل الله السلام تحية المسلم، بحيث لا ينبغي أن يتكلم الإنسان وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد تعاملاتهم في الحياة',
                                          style: TextStyle(
                                              fontFamily: 'Cairo-Regular',
                                              fontSize: 12,
                                              color:
                                                  HexColor.fromHex("#858585")),
                                          textAlign: TextAlign.start,
                                        ),
                                      )),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
              )
            ],
          ),
        ));
  }
}
