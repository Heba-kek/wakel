import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/packageSuccess.dart';

class freelanceProfile extends StatefulWidget {
  @override
  _freelanceProfile createState() => new _freelanceProfile();
}

class _freelanceProfile extends State<freelanceProfile> {
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
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 120,
        leadingWidth: 100,
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
        elevation: 0,

        //  centerTitle: true,  automaticallyImplyLeading: false,
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.fromLTRB(35, 40, 35, 25),
              child: Container(
                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF13A8E3),
                        const Color(0xFF2CDCF8),
                      ],
                    ),
                    color: HexColor.fromHex("#4DBDEF")),
                child: Image.asset(
                  'assets/images/chatp.png',
                  // color: Colors.white,
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
        title: Padding(
          child: Center(
            child: Stack(
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
          ),
          padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
        ),
        // backgroundColor: HexColor.fromHex("#3C7DBA").withOpacity(1),
        backgroundColor: HexColor.fromHex("#FCFCFC"),
      ),
      body: Container(
        color: HexColor.fromHex("#FCFCFC"),
        //  width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              child: ListView(
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                        /* Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Center(
                              child: Text(
                                AppLocalizations().lbSen,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: HexColor.fromHex("#858585"),
                                ),
                              ),
                            )),*/
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
                        Padding(
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
                                        style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                          fontSize: 13,
                                          color: HexColor.fromHex("#73AF00"),
                                        ),
                                      )),
                                ],
                              ),
                            )),
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
                                        style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          AppLocalizations().lbProLit,
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                              color:
                                                  HexColor.fromHex("#858585"),
                                              fontSize: 11),
                                        ),
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.fromLTRB(1, 10, 8, 10),
                                ),
                                Padding(
                                  child: Column(
                                    children: [
                                      Text(
                                        '\$1827',
                                        style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          AppLocalizations().lbPaid,
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                              color:
                                                  HexColor.fromHex("#858585"),
                                              fontSize: 11),
                                        ),
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                                ),
                                Padding(
                                  child: Column(
                                    children: [
                                      Text(
                                        '535',
                                        style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          AppLocalizations().lbRev,
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                              color:
                                                  HexColor.fromHex("#858585"),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: GestureDetector(
                                            child: Container(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      35, 20, 35, 20),
                                                  child: Text(
                                                    AppLocalizations()
                                                        .lbPackages,
                                                    style: TextStyle(
                                                        fontFamily: 'Cairo-Bold',
                                                        fontSize: 13,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(0),
                                          child: GestureDetector(
                                            child: Container(
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      30, 20, 30, 20),
                                                  child: Text(
                                                    AppLocalizations()
                                                        .lbPackages,
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
                                                    style: TextStyle(fontFamily: 'Cairo-Bold',
                                                        fontSize: 13,
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
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 5, 0),
                                              child: GestureDetector(
                                                child: Container(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                                  padding: EdgeInsets
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
                                                                          padding: EdgeInsets.fromLTRB(
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
                                                                                padding: EdgeInsets.fromLTRB(4, 3, 4, 3),
                                                                                child: Text(
                                                                                  AppLocalizations().lbAsma,
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Cairo-Regular',
                                                                                    fontSize: 12,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              StarRating(
                                                                                rating: rating,
                                                                                onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                                              )
                                                                            ],
                                                                          )),
                                                                      new Spacer(),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                                                              child: Row(
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
                                                                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                                                              child: Text(
                                                                                AppLocalizations().lbThDay,
                                                                                style: TextStyle(fontFamily: 'Cairo-SemiBold',
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
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          20,
                                                                          15),
                                                                  child: Padding(
                                                                      padding: EdgeInsets.all(0),
                                                                      child: Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        child:
                                                                            Text(
                                                                          AppLocalizations()
                                                                              .lbTRans,
                                                                          style:
                                                                              TextStyle(fontFamily: 'Cairo-Bold',
                                                                            fontSize:
                                                                                16,
                                                                          ),
                                                                        ),
                                                                      )),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          20,
                                                                          5),
                                                                  child: Padding(
                                                                      padding: EdgeInsets.all(0),
                                                                      child: Text(
                                                                        'He was an awesome client that i loved workingwith and he paid at time',
                                                                        style: TextStyle(fontFamily: 'Cairo-Regular',
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                HexColor.fromHex("#858585")),
                                                                      )),
                                                                ),
                                                              ],
                                                            ),
                                                            decoration: BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: HexColor.fromHex(
                                                                            "#7D7D7D")
                                                                        .withOpacity(
                                                                            0.15),
                                                                    spreadRadius:
                                                                        0,
                                                                    blurRadius:
                                                                        2,
                                                                    //  offset: Offset(0, 3), // changes position of shadow
                                                                  ),
                                                                ],
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                color: Colors
                                                                    .white)),
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
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 5, 0),
                                              child: GestureDetector(
                                                child: Container(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                                  padding: EdgeInsets
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
                                                                          padding: EdgeInsets.fromLTRB(
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
                                                                                padding: EdgeInsets.fromLTRB(4, 3, 4, 3),
                                                                                child: Text(
                                                                                  AppLocalizations().lbAsma,
                                                                                  style: TextStyle(fontFamily: 'Cairo-Bold',
                                                                                    fontSize: 12,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              StarRating(
                                                                                rating: rating,
                                                                                onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                                              )
                                                                            ],
                                                                          )),
                                                                      new Spacer(),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                              padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                                                              child: Row(
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
                                                                                        style: TextStyle(fontFamily: 'Cairo-SemiBold',color: HexColor.fromHex("#4DBDEF")),
                                                                                      ))
                                                                                ],
                                                                              )),
                                                                          Padding(
                                                                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                                                              child: Text(
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
                                                                /* Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                  20, 0,20, 5),
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
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          0,
                                                                          20,
                                                                          5),
                                                                  child: Padding(
                                                                      padding: EdgeInsets.all(0),
                                                                      child: Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        child:
                                                                            Text(
                                                                          AppLocalizations()
                                                                              .lbTRans,
                                                                          style:
                                                                              TextStyle(fontFamily: 'Cairo-Bold',
                                                                            fontSize:
                                                                                16,
                                                                          ),
                                                                        ),
                                                                      )),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          0,
                                                                          13,
                                                                          5),
                                                                  child: Row(
                                                                    children: [
                                                                      Image.asset(
                                                                          'assets/images/audit.png'),
                                                                      Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              18,
                                                                              10,
                                                                              10,
                                                                              10),
                                                                          child:
                                                                              Text(
                                                                            '64537',
                                                                            style:
                                                                                TextStyle(fontSize: 12, color: HexColor.fromHex("#73AF00")),
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          0,
                                                                          10,
                                                                          25),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        //   width: MediaQuery.of(context).size.width,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              56,
                                                                              20,
                                                                              56,
                                                                              20),
                                                                          child:
                                                                              Text(
                                                                            AppLocalizations().lbBuyPAck,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                TextStyle(fontFamily: 'Cairo-Bold',color: Colors.white, fontSize: 15),
                                                                          ),
                                                                        ),
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                            gradient: new LinearGradient(
                                                                              colors: [
                                                                                const Color(0xFF2CDCF8),
                                                                                const Color(0xFF13A8E3),
                                                                              ],
                                                                            ),
                                                                            color: Colors.white),
                                                                      ),
                                                                      Padding(
                                                                        child:
                                                                            Container(
                                                                          //   width: MediaQuery.of(context).size.width,
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(20),
                                                                            child:
                                                                                Image.asset('assets/images/msg.png'),
                                                                          ),
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.all(Radius.circular(15)),
                                                                              border: Border.all(color: HexColor.fromHex("#4DBDEF"), width: 2),
                                                                              color: Colors.white),
                                                                        ),
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            0,
                                                                            10,
                                                                            0),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            decoration: BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: HexColor.fromHex(
                                                                            "#7D7D7D")
                                                                        .withOpacity(
                                                                            0.15),
                                                                    spreadRadius:
                                                                        0,
                                                                    blurRadius:
                                                                        2,
                                                                    //  offset: Offset(0, 3), // changes position of shadow
                                                                  ),
                                                                ],
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                color: Colors
                                                                    .white)),
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
            )
          ],
        ),
      ),
    );
  }
}
