import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/chatDetails.dart';
import 'package:wakel/pages/homePage.dart';
import 'package:wakel/pages/packageSuccess.dart';

class packageTrcking extends StatefulWidget {
  final String lang;

  packageTrcking(this.lang);

  @override
  _packageTrcking createState() => new _packageTrcking();
}

class _packageTrcking extends State<packageTrcking> {
  double rating = 1.5;
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
          leadingWidth: 100,
          toolbarHeight: 100,
          elevation: 0,
          centerTitle: true,
          leading: RaisedButton(
            elevation: 0,
            color: Colors.white,
            child: widget.lang == 'ar'
                ? Padding(
                    padding: EdgeInsets.fromLTRB(40, 45, 0, 25),
                    child: Icon(
                      Icons.arrow_back,
                      color: HexColor.fromHex("#4DBDEF"),
                    ))
                : Padding(
                    padding: EdgeInsets.fromLTRB(0, 45, 0, 25),
                    child: Icon(
                      Icons.arrow_back,
                      color: HexColor.fromHex("#4DBDEF"),
                    )),
            onPressed: () {
              Navigator.of(context).pop(); // close the drawer

              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => Directionality(
                      textDirection: langSave == 'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: HomeScreen(langSave)),
                ),
              );
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          //  width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  child: Container(
                    height: 70,
                    color: HexColor.fromHex("#4DBDEF"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations().lbSetCom,
                          style: TextStyle(fontFamily: 'Cairo-Bold',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
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
                  children: [
                    Container(
                      //  height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 30, 20, 15),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations().lbPakDe,
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                              fontSize: 15,
                                              color:
                                                  HexColor.fromHex("#292929")),
                                        ),
                                        Padding(
                                          child: Text(
                                            AppLocalizations().lbShowMore,
                                            style: TextStyle(fontFamily: 'Cairo-Regular',
                                                fontSize: 12,
                                                color: HexColor.fromHex(
                                                    "#858585")),
                                          ),
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 8),
                                        )
                                      ],
                                    ),
                                    new Spacer(),
                                    Padding(
                                      child: Container(
                                        //   width: MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: HexColor.fromHex("#575757")),
                                      ),
                                      padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                    ),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Container(
                              height: 1,
                              color: HexColor.fromHex("#F9FBFC"),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 20, 20, 15),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations().lbEx,
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                              fontSize: 15,
                                              color:
                                                  HexColor.fromHex("#292929")),
                                        ),
                                        Padding(
                                          child: Text(
                                            AppLocalizations().lbShoeExD,
                                            style: TextStyle(fontFamily: 'Cairo-Regular',
                                                fontSize: 12,
                                                color: HexColor.fromHex(
                                                    "#858585")),
                                          ),
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 8),
                                        )
                                      ],
                                    ),
                                    new Spacer(),
                                    Padding(
                                      child: Container(
                                        //   width: MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: HexColor.fromHex("#575757")),
                                      ),
                                      padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                    ),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Container(
                              height: 1,
                              color: HexColor.fromHex("#F9FBFC"),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 15),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppLocalizations().lbTrack,
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                              fontSize: 15,
                                              color:
                                                  HexColor.fromHex("#292929")),
                                        ),
                                        Padding(
                                          child: Text(
                                            AppLocalizations().lbTrackMsg,
                                            style: TextStyle(fontFamily: 'Cairo-Regular',
                                                fontSize: 12,
                                                color: HexColor.fromHex(
                                                    "#858585")),
                                          ),
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 8),
                                        )
                                      ],
                                    ),
                                    new Spacer(),
                                    Padding(
                                      child: Container(
                                        //   width: MediaQuery.of(context).size.width,
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            gradient: LinearGradient(
                                              colors: [
                                                const Color(0xFF13A8E3),
                                                const Color(0xFF2CDCF8),
                                              ],
                                            ),
                                            color: HexColor.fromHex("#575757")),
                                      ),
                                      padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                    ),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.lang == 'en'
                                    ? Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(4, 32, 4, 3),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    7, 0, 0, 0),
                                                child: Container(
                                                  height: 1,
                                                  width: 9,
                                                  color: HexColor.fromHex(
                                                      "#4DBDEF"),
                                                )),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  child: Container(
                                                    height: 56,
                                                    width: 1,
                                                    color: HexColor.fromHex(
                                                        "#4DBDEF"),
                                                  ),
                                                  padding: EdgeInsets.fromLTRB(
                                                      7, 0, 0, 0),
                                                ),
                                                Image.asset(
                                                  'assets/images/trueblue.png',
                                                ),
                                                Padding(
                                                  child: Container(
                                                    height: 41,
                                                    width: 1,
                                                    color: HexColor.fromHex(
                                                        "#DFDFDF"),
                                                  ),
                                                  padding: EdgeInsets.fromLTRB(
                                                      7, 0, 0, 0),
                                                ),
                                                Image.asset(
                                                  'assets/images/trueblue.png',
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF"),
                                                ),
                                                Padding(
                                                  child: Container(
                                                    height: 34,
                                                    width: 1,
                                                    color: HexColor.fromHex(
                                                        "#DFDFDF"),
                                                  ),
                                                  padding: EdgeInsets.fromLTRB(
                                                      7, 0, 0, 0),
                                                ),
                                                Image.asset(
                                                  'assets/images/trueblue.png',
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ))
                                    : Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(4, 32, 4, 3),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    7, 0, 7, 0),
                                                child: Container(
                                                  height: 1,
                                                  width: 9,
                                                  color: HexColor.fromHex(
                                                      "#4DBDEF"),
                                                )),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  child: Container(
                                                    height: 56,
                                                    width: 1,
                                                    color: HexColor.fromHex(
                                                        "#4DBDEF"),
                                                  ),
                                                  padding: EdgeInsets.fromLTRB(
                                                      7, 0, 7, 0),
                                                ),
                                                Image.asset(
                                                  'assets/images/trueblue.png',
                                                ),
                                                Padding(
                                                  child: Container(
                                                    height: 41,
                                                    width: 1,
                                                    color: HexColor.fromHex(
                                                        "#DFDFDF"),
                                                  ),
                                                  padding: EdgeInsets.fromLTRB(
                                                      7, 0, 7, 0),
                                                ),
                                                Image.asset(
                                                  'assets/images/trueblue.png',
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF"),
                                                ),
                                                Padding(
                                                  child: Container(
                                                    height: 34,
                                                    width: 1,
                                                    color: HexColor.fromHex(
                                                        "#DFDFDF"),
                                                  ),
                                                  padding: EdgeInsets.fromLTRB(
                                                      7, 0, 7, 0),
                                                ),
                                                Image.asset(
                                                  'assets/images/trueblue.png',
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                widget.lang == 'en'
                                    ? Container(
                                        padding: EdgeInsets.all(0),
                                        width: 300,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                    'assets/images/imggirl.png'),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 3, 10, 3),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  4, 3, 4, 3),
                                                          child: Text(
                                                            AppLocalizations()
                                                                .lbAsma,
                                                            style: TextStyle(fontFamily: 'Cairo-Regular',
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                        StarRating(
                                                          rating: rating,
                                                          color:
                                                              HexColor.fromHex(
                                                                  "#F2F2F2"),
                                                          onRatingChanged:
                                                              (rating) =>
                                                                  setState(() =>
                                                                      this.rating =
                                                                          rating),
                                                        )
                                                      ],
                                                    )),
                                                new Spacer(),
                                                GestureDetector(
                                                  child: Padding(
                                                    child: Container(
                                                      //   width: MediaQuery.of(context).size.width,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        child: Image.asset(
                                                            'assets/images/chatmsg.png'),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                          border: Border.all(
                                                              color: HexColor
                                                                  .fromHex(
                                                                      "#4DBDEF"),
                                                              width: 2),
                                                          color: Colors.white),
                                                    ),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 1, 0),
                                                  ),
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      PageRouteBuilder(
                                                        pageBuilder: (_, __, ___) => Directionality(
                                                            textDirection:
                                                                langSave == 'ar'
                                                                    ? TextDirection
                                                                        .rtl
                                                                    : TextDirection
                                                                        .ltr,
                                                            child: chatDetails(
                                                                'assets/images/imggirl.png',
                                                                AppLocalizations()
                                                                    .lbAsma)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 20, 0, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        AppLocalizations().lbDe,
                                                        style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                            fontSize: 14),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 4, 0, 0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              AppLocalizations()
                                                                  .lbDayAgo,
                                                              style: TextStyle(fontFamily: 'Cairo-Regular',
                                                                  color: HexColor
                                                                      .fromHex(
                                                                          "#B1B1B1"),
                                                                  fontSize: 12),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 25, 0, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    AppLocalizations().lbProc,
                                                    style:
                                                        TextStyle(fontSize: 14,fontFamily: 'Cairo-SemiBold',),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 35, 0, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    AppLocalizations().lbFi,
                                                    style:
                                                        TextStyle(fontSize: 14,fontFamily: 'Cairo-SemiBold',),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.all(0),
                                        width: 300,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                    'assets/images/imggirl.png'),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 3, 10, 3),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  4, 3, 4, 3),
                                                          child: Text(
                                                            AppLocalizations()
                                                                .lbAsma,
                                                            style: TextStyle(fontFamily: 'Cairo-Regular',
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                        StarRating(
                                                          rating: rating,
                                                          color:
                                                              HexColor.fromHex(
                                                                  "#F2F2F2"),
                                                          onRatingChanged:
                                                              (rating) =>
                                                                  setState(() =>
                                                                      this.rating =
                                                                          rating),
                                                        )
                                                      ],
                                                    )),
                                                new Spacer(),
                                                GestureDetector(
                                                  child: Padding(
                                                    child: Container(
                                                      //   width: MediaQuery.of(context).size.width,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        child: Image.asset(
                                                            'assets/images/chatmsg.png'),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                          border: Border.all(
                                                              color: HexColor
                                                                  .fromHex(
                                                                      "#4DBDEF"),
                                                              width: 2),
                                                          color: Colors.white),
                                                    ),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 0, 1, 0),
                                                  ),
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                      PageRouteBuilder(
                                                        pageBuilder: (_, __, ___) => Directionality(
                                                            textDirection:
                                                                langSave == 'ar'
                                                                    ? TextDirection
                                                                        .rtl
                                                                    : TextDirection
                                                                        .ltr,
                                                            child: chatDetails(
                                                                'assets/images/imggirl.png',
                                                                AppLocalizations()
                                                                    .lbAsma)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        AppLocalizations().lbDe,
                                                        style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                            fontSize: 14),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                0, 4, 0, 0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              AppLocalizations()
                                                                  .lbDayAgo,
                                                              style: TextStyle(fontFamily: 'Cairo-Regular',
                                                                  color: HexColor
                                                                      .fromHex(
                                                                          "#B1B1B1"),
                                                                  fontSize: 12),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 15, 0, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    AppLocalizations().lbProc,
                                                    style:
                                                        TextStyle(fontSize: 14,fontFamily: 'Cairo-SemiBold',),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 27, 0, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    AppLocalizations().lbFi,
                                                    style:
                                                        TextStyle(fontSize: 14,fontFamily: 'Cairo-SemiBold',),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 110,
                                        color: HexColor.fromHex("#4DBDEF"),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 3),
                                        child: Text(
                                          AppLocalizations().lbFiD,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,fontFamily: 'Cairo-SemiBold',),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 110,
                                        color: HexColor.fromHex("#4DBDEF"),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 3),
                                        child: Text(
                                          AppLocalizations().lbSiD,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,fontFamily: 'Cairo-SemiBold',),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 110,
                                        color: HexColor.fromHex("#FFFFFF"),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 3),
                                        child: Text(
                                          AppLocalizations().lbThD,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,fontFamily: 'Cairo-SemiBold',),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                  shrinkWrap: true,
                ),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
              )
            ],
          ),
        ));
  }
}
