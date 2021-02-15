import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/LocalHelper.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/accountBalanceTop.dart';
import 'package:wakel/pages/addPackage.dart';
import 'package:wakel/pages/editAccount.dart';
import 'package:wakel/pages/packageSuccess.dart';
import 'package:wakel/pages/settingPage.dart';
import 'package:wakel/pages/splashActivity.dart';
import 'package:wakel/pages/withDrawals.dart';

class FreeProfileHome extends StatefulWidget {
  @override
  _FreeProfileHome createState() => new _FreeProfileHome();
}

class _FreeProfileHome extends State<FreeProfileHome> {
  double rating = 3.5;
  bool rev = false;
  List<String> photo = [
    'assets/images/imggirl.png',
    'assets/images/imggirl.png',
    'assets/images/imggirl.png',
  ];
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
    return new Container(
        color: HexColor.fromHex("#FCFCFC"),
        //  width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          child: ListView(
            children: [
              Container(
                //  height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(35, 29, 35, 40),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xFFE71E20),
                                          const Color(0xFFEB5E1A),
                                        ],
                                      ),
                                      color: HexColor.fromHex("#4DBDEF")),
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    barrierColor: Color(0x97000000),
                                    builder: (BuildContext context) {
                                      return showDialogLang();
                                    });
                              },
                            ),
                            Stack(
                              children: [
                                Container(
                                    width: 90,
                                    height: 90,
                                    child: Image.asset(
                                      'assets/images/chatg.png',
                                      fit: BoxFit.fill,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      //   color: Colors.red,
                                    )),
                                Padding(
                                  child: Image.asset('assets/images/sign.png'),
                                  padding: EdgeInsets.fromLTRB(33, 75, 25, 0),
                                )
                              ],
                            ),
                            GestureDetector(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(35, 29, 25, 40),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xFF13A8E3),
                                          const Color(0xFF2CDCF8),
                                        ],
                                      ),
                                      color: HexColor.fromHex("#4DBDEF")),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => Directionality(
                                        textDirection: langSave == 'ar'
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                        child: editAccount()),
                                  ),
                                );
                              },
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Center(
                          child: Text(
                            AppLocalizations().lbStef,
                            style: TextStyle(
                              fontFamily: 'Cairo-Bold',
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Center(
                          child: Text(
                            'مبرمج مواقع',
                            style: TextStyle(
                              fontFamily: 'Cairo-SeminBold',
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: StarRating(
                              rating: 4.0,
                              onRatingChanged: (rating) =>
                                  setState(() => this.rating = rating),
                            ))
                          ],
                        )),
                    /*  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/audit.png'),
                            Padding(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Text(
                                  '85723',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: HexColor.fromHex("#73AF00"),
                                  ),
                                )),
                          ],
                        ),
                      )),*/
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Divider(
                            color: HexColor.fromHex("#CFCFCF"),
                            height: 1,
                          ),
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              child: Column(
                                children: [
                                  Text(
                                    '3472',
                                    style: TextStyle( fontFamily: 'Cairo-Bold',
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                    child: Text(
                                      AppLocalizations().lbProLit,
                                      style: TextStyle( fontFamily: 'Cairo-SemiBold',
                                          color: HexColor.fromHex("#858585"),
                                          fontSize: 11),
                                    ),
                                  )
                                ],
                              ),
                              padding: EdgeInsets.fromLTRB(18, 10, 28, 10),
                            ),
                            Padding(
                              child: Column(
                                children: [
                                  Text(
                                    '\$1827',
                                    style: TextStyle(fontFamily: 'Cairo-Bold',
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                    child: Text(
                                      AppLocalizations().lbPaid,
                                      style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                          color: HexColor.fromHex("#858585"),
                                          fontSize: 11),
                                    ),
                                  )
                                ],
                              ),
                              padding: EdgeInsets.fromLTRB(18, 10, 28, 10),
                            ),
                            Padding(
                              child: Column(
                                children: [
                                  Text(
                                    '535',
                                    style: TextStyle(fontFamily: 'Cairo-Bold',
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                    child: Text(
                                      AppLocalizations().lbRev,
                                      style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                          color: HexColor.fromHex("#858585"),
                                          fontSize: 11),
                                    ),
                                  )
                                ],
                              ),
                              padding: EdgeInsets.fromLTRB(18, 10, 28, 10),
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Divider(
                            color: HexColor.fromHex("#CFCFCF"),
                            height: 1,
                          ),
                        )),
                    Padding(
                      child: Text(
                        AppLocalizations().lbCurrentB,
                        style: TextStyle(fontFamily: 'Cairo-SemiBold',
                            fontSize: 15, color: HexColor.fromHex("#464646")),
                      ),
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  child: GestureDetector(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 17, 0, 17),
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 0, 8, 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  HexColor.fromHex("#575757")),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 15, 10, 15),
                                            child: Image.asset(
                                              'assets/images/quas.png',
                                              width: 22,
                                              height: 22,
                                            ),
                                          )),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              Directionality(
                                                  textDirection:
                                                      langSave == 'ar'
                                                          ? TextDirection.rtl
                                                          : TextDirection.ltr,
                                                  child: settingPage()),
                                        ),
                                      );
                                    },
                                  ),
                                  padding: EdgeInsets.fromLTRB(18, 0, 28, 0),
                                ),
                                Padding(
                                  child: Column(
                                    children: [
                                      Text(
                                        '1827',
                                        style: TextStyle(fontFamily: 'Cairo-Regular',
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          AppLocalizations().lbSar,
                                          style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                              fontSize: 20,
                                              color:
                                                  HexColor.fromHex("#4DBDEF")),
                                        ),
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.fromLTRB(18, 0, 28, 0),
                                ),
                                Padding(
                                  child: GestureDetector(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 17, 0, 17),
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 0, 8, 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                colors: [
                                                  const Color(0xFF13A8E3),
                                                  const Color(0xFF2CDCF8),
                                                ],
                                              ),
                                              color:
                                                  HexColor.fromHex("#575757")),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 15, 10, 15),
                                            child: Image.asset(
                                              'assets/images/doll.png',
                                              color: Colors.white,
                                              width: 22,
                                              height: 24,
                                            ),
                                          )),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              Directionality(
                                                  textDirection:
                                                      langSave == 'ar'
                                                          ? TextDirection.rtl
                                                          : TextDirection.ltr,
                                                  child: Withdrawals()),
                                        ),
                                      );
                                    },
                                  ),
                                  padding: EdgeInsets.fromLTRB(18, 0, 28, 0),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: GestureDetector(
                                child: Container(
                                  //   width: MediaQuery.of(context).size.width,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(102, 20, 102, 20),
                                    child: Text(
                                      AppLocalizations().lbAddPa,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontFamily: 'Cairo-Bold',
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      gradient: new LinearGradient(
                                        colors: [
                                          const Color(0xFF43A325),
                                          const Color(0xFFB9DC4B),
                                        ],
                                      ),
                                      color: Colors.white),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          Directionality(
                                              textDirection: langSave == 'ar'
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                              child: addPAckage()),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Divider(
                            color: HexColor.fromHex("#CFCFCF"),
                            height: 1,
                          ),
                        )),
                    rev == false
                        ? Padding(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: HexColor.fromHex("#DFDFDF"),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: GestureDetector(
                                        child: Container(
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  35, 20, 35, 20),
                                              child: Text(
                                                AppLocalizations().lbPackages,
                                                style: TextStyle(
                                                    fontSize: 13,fontFamily: 'Cairo-Bold',
                                                    color: HexColor.fromHex(
                                                        "#888888")),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                            )),
                                        onTap: () {
                                          setState(() {
                                            rev = false;
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: GestureDetector(
                                        child: Container(
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  50, 20, 50, 20),
                                              child: Text(
                                                AppLocalizations().lbRev,
                                                style: TextStyle(fontFamily: 'Cairo-Bold',
                                                    fontSize: 13,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  const Color(0xFF43ACD5),
                                                  const Color(0xFF4DBDEF),
                                                ],
                                              ),
                                              border: Border.all(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF"),
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                        onTap: () {
                                          setState(() {
                                            rev = true;
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                          )
                        : Padding(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: HexColor.fromHex("#DFDFDF"),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: GestureDetector(
                                        child: Container(
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  30, 20, 30, 20),
                                              child: Text(
                                                AppLocalizations().lbPackages,
                                                style: TextStyle(fontFamily: 'Cairo-Bold',
                                                    fontSize: 13,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  const Color(0xFF43ACD5),
                                                  const Color(0xFF4DBDEF),
                                                ],
                                              ),
                                              border: Border.all(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF"),
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                        onTap: () {
                                          setState(() {
                                            rev = false;
                                          });
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: GestureDetector(
                                        child: Container(
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  50, 20, 50, 20),
                                              child: Text(
                                                AppLocalizations().lbRev,
                                                style: TextStyle(
                                                    fontSize: 13,fontFamily: 'Cairo-Bold',
                                                    color: HexColor.fromHex(
                                                        "#888888")),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                color: Colors.transparent)),
                                        onTap: () {
                                          setState(() {
                                            rev = true;
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            padding: EdgeInsets.fromLTRB(35, 20, 35, 0),
                          ),
                    rev == false
                        ? Column(
                            children: [
                              Container(
                                  child: Padding(
                                padding: EdgeInsets.all(0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  //  scrollDirection: Axis.vertical,
                                  itemCount: photo.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Column(
                                    children: [
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 0),
                                          child: GestureDetector(
                                            child: Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 10),
                                                    child: Container(
                                                        width: 320,
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          20,
                                                                          0),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                      photo[
                                                                          index]),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              3,
                                                                              10,
                                                                              3),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                4,
                                                                                3,
                                                                                4,
                                                                                3),
                                                                            child:
                                                                                Text(
                                                                              AppLocalizations().lbAsma,
                                                                              style: TextStyle(
                                                                                fontFamily: 'Cairo-Regular',
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                5),
                                                                            child:
                                                                                StarRating(
                                                                              rating: rating,
                                                                              onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      )),
                                                                  new Spacer(),
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              3,
                                                                              0,
                                                                              3),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Padding(
                                                                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '51.00 ',
                                                                                    style: TextStyle(fontFamily: 'Cairo-Black',fontWeight: FontWeight.bold, color: HexColor.fromHex("#4DBDEF")),
                                                                                  )),
                                                                              Padding(
                                                                                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                                                                  child: Text(
                                                                                    AppLocalizations().lbSar,
                                                                                    style: TextStyle(fontFamily: 'Cairo-Bold',color: HexColor.fromHex("#4DBDEF")),
                                                                                  ))
                                                                            ],
                                                                          )),
                                                                      Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              2,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            AppLocalizations().lbThDay,
                                                                            style: TextStyle(fontFamily: 'Cairo-Regular',
                                                                                color: HexColor.fromHex(
                                                                                  "#4DBDEF",
                                                                                ),
                                                                                fontSize: 12),
                                                                          ))
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          20,
                                                                          0),
                                                              child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                      AppLocalizations()
                                                                          .lbTRans,
                                                                      style:
                                                                          TextStyle(fontFamily: 'Cairo-Bold',
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                  )),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          20,
                                                                          5),
                                                              child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  child: Text(
                                                                    langSave ==
                                                                            'en'
                                                                        ? 'He was an awesome client that i loved workingwith and he paid at time'
                                                                        : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم الإنسان',
                                                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                                                        fontSize:
                                                                            12,
                                                                        color: HexColor.fromHex(
                                                                            "#858585")),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: HexColor
                                                                        .fromHex(
                                                                            "#7D7D7D")
                                                                    .withOpacity(
                                                                        0.15),
                                                                spreadRadius: 0,
                                                                blurRadius: 2,
                                                                //  offset: Offset(0, 3), // changes position of shadow
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                            color:
                                                                Colors.white)),
                                                  )
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              /* Navigator.of(context).push(
                                                  PageRouteBuilder(
                                                    pageBuilder: (_, __, ___) => PackageDetails(),
                                                  ),
                                                );*/
                                            },
                                          )),
                                    ],
                                  ),
                                  padding: EdgeInsets.all(0),
                                ),
                              )),
                            ],
                          )
                        : Column(
                            children: [
                              Container(
                                  child: Padding(
                                padding: EdgeInsets.all(0),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  //  scrollDirection: Axis.vertical,
                                  itemCount: photo.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Column(
                                    children: [
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 0),
                                          child: GestureDetector(
                                            child: Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 10),
                                                    child: Container(
                                                        width: 320,
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          20,
                                                                          0),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                      photo[
                                                                          index]),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              3,
                                                                              10,
                                                                              3),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                4,
                                                                                3,
                                                                                4,
                                                                                3),
                                                                            child:
                                                                                Text(
                                                                              AppLocalizations().lbAsma,
                                                                              style: TextStyle(fontFamily: 'Cairo-REgular',
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          StarRating(
                                                                            rating:
                                                                                rating,
                                                                            onRatingChanged: (rating) =>
                                                                                setState(() => this.rating = rating),
                                                                          )
                                                                        ],
                                                                      )),
                                                                  new Spacer(),
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              3,
                                                                              0,
                                                                              3),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Padding(
                                                                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '51.00 ',
                                                                                    style: TextStyle(fontFamily: 'Cairo-Black',fontWeight: FontWeight.bold, color: HexColor.fromHex("#4DBDEF")),
                                                                                  )),
                                                                              Padding(
                                                                                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                                                                  child: Text(
                                                                                    AppLocalizations().lbSar,
                                                                                    style: TextStyle(fontFamily: 'Cairo-bold',color: HexColor.fromHex("#4DBDEF")),
                                                                                  ))
                                                                            ],
                                                                          )),
                                                                      Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              2,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            AppLocalizations().lbThDay,
                                                                            style: TextStyle(fontFamily: 'Cairo-Regular',
                                                                                color: HexColor.fromHex(
                                                                                  "#4DBDEF",
                                                                                ),
                                                                                fontSize: 12),
                                                                          ))
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            /*   Padding(
                                                        padding: EdgeInsets
                                                            .fromLTRB(
                                                            20, 0, 0, 5),
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                                'assets/images/audit.png'),
                                                            Padding(
                                                                padding:
                                                                EdgeInsets
                                                                    .all(
                                                                    1),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.fromLTRB(
                                                                          4,
                                                                          3,
                                                                          4,
                                                                          3),
                                                                      child:
                                                                      Text(
                                                                        '54632',
                                                                        style: TextStyle(
                                                                            fontSize: 10,
                                                                            color: HexColor.fromHex("#73AF00")),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                            new Spacer(),

                                                          ],
                                                        ),
                                                      ),*/
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          0,
                                                                          20,
                                                                          5),
                                                              child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                      AppLocalizations()
                                                                          .lbTRans,
                                                                      style:
                                                                          TextStyle(fontFamily: 'Cairo-Bold',
                                                                        fontSize:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                  )),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          10,
                                                                          25),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    //   width: MediaQuery.of(context).size.width,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              96,
                                                                              20,
                                                                              96,
                                                                              20),
                                                                      child:
                                                                          Text(
                                                                        AppLocalizations()
                                                                            .lbEditP,
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(fontFamily: 'Cairo-Bold',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 15),
                                                                      ),
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                        gradient: new LinearGradient(
                                                                          colors: [
                                                                            const Color(0xFF13A8E3),
                                                                            const Color(0xFF2CDCF8),
                                                                          ],
                                                                        ),
                                                                        color: Colors.white),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: HexColor
                                                                        .fromHex(
                                                                            "#7D7D7D")
                                                                    .withOpacity(
                                                                        0.15),
                                                                spreadRadius: 0,
                                                                blurRadius: 2,
                                                                //  offset: Offset(0, 3), // changes position of shadow
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                            color:
                                                                Colors.white)),
                                                  )
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              /* Navigator.of(context).push(
                                                  PageRouteBuilder(
                                                    pageBuilder: (_, __, ___) => PackageDetails(),
                                                  ),
                                                );*/
                                            },
                                          )),
                                    ],
                                  ),
                                  padding: EdgeInsets.all(0),
                                ),
                              )),
                            ],
                          ),
                  ],
                ),
              )
            ],
            shrinkWrap: true,
          ),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        ));
  }

  Widget showDialogLang() {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Container(
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(22.0)),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'change',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.praimarydark),
                  ),
                ),
                GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('English'),
                    ),
                    onTap: () async {
                      var preferences = await SharedPreferences.getInstance();

                      AppLocalizations().locale == 'en';
                      helper.onLocaleChanged(new Locale("en"));
                      AppLocalizations.load(new Locale("en"));
                      preferences.setString('lang', 'en');

                      preferences.remove('sessionId');

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Directionality(
                                  textDirection: langSave == 'ar'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: Splash())),
                          ModalRoute.withName("/Home"));
                    }),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('العربية'),
                  ),
                  onTap: () async {
                    String lang = AppLocalizations().locale;
                    var preferences = await SharedPreferences.getInstance();

// Save a value

                    AppLocalizations().locale == 'ar';
                    helper.onLocaleChanged(new Locale("ar"));
                    AppLocalizations.load(new Locale("ar"));
                    preferences.setString('lang', 'ar');

                    preferences.remove('sessionId');

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Directionality(
                                textDirection: langSave == 'ar'
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                child: Splash())),
                        ModalRoute.withName("/Home"));
                  },
                ),
              ],
            )),
      ),
    );
  }
}
