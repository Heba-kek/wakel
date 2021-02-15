import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/feedbackSuccess.dart';
import 'package:wakel/pages/packageSuccess.dart';

class providFeed extends StatefulWidget {
  @override
  _providFeed createState() => new _providFeed();
}

class _providFeed extends State<providFeed> {
  double rating = 3.5;
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
  void initState() {navigationPage();}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
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
                          AppLocalizations().lbProFeed,
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
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => feedSuccess(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                child: ListView(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            child: Stack(
                              children: [
                                GestureDetector(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(35, 25, 35, 25),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: HexColor.fromHex("#4DBDEF"),
                                      )),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pop(); // close the drawer
                                  },
                                ),
                                Center(
                                  child: Container(
                                      width: 106,
                                      height: 106,

                                      // child: Image.asset('assets/images/girl.png',),

                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          //   color: Colors.red,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/girl.png'),
                                              fit: BoxFit.cover))),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Center(
                                child: Text(
                                  AppLocalizations().lbStef,
                                  style: TextStyle(fontFamily: 'Cairo-Bold',
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              )),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Center(
                                child: Text(
                                  AppLocalizations().lbTRans,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                    fontSize: 15,
                                    color: HexColor.fromHex("#4DBDEF"),
                                  ),
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
                            child: Container(
                              height: 1,
                              color: HexColor.fromHex("#F9FBFC"),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations().lbComm,
                                  style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                      fontSize: 15,
                                      color: HexColor.fromHex("#303030")),
                                ),
                                new Spacer(),
                                StarRating(
                                  rating: 4.0,
                                  onRatingChanged: (rating) => setState(
                                          () => this.rating = rating),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations().lbSer,
                                  style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                      fontSize: 15,
                                      color: HexColor.fromHex("#303030")),
                                ),
                                new Spacer(),
                                StarRating(
                                  rating: 4.0,
                                  onRatingChanged: (rating) => setState(
                                          () => this.rating = rating),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations().lbProf,
                                  style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                      fontSize: 15,
                                      color: HexColor.fromHex("#303030")),
                                ),
                                new Spacer(),
                                StarRating(
                                  rating: 5.0,
                                  onRatingChanged: (rating) => setState(
                                          () => this.rating = rating),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations().lbTime,
                                  style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                      fontSize: 15,
                                      color: HexColor.fromHex("#303030")),
                                ),
                                new Spacer(),
                                StarRating(
                                  rating: 5.0,
                                  onRatingChanged: (rating) => setState(
                                          () => this.rating = rating),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                              child:
                          Container(
                            height: 201,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    //  offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            child: Column(children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations().lbFeed,
                                      style: TextStyle(fontFamily: 'Cairo-Bold',
                                        fontSize: 15,
                                        color: HexColor.fromHex("#303030"),
                                      ),
                                    ),
                                  )),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations().lbSerMsg,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                        fontSize: 13,
                                        color: HexColor.fromHex("#303030").withOpacity(0.41),
                                      ),
                                    ),
                                  )),
                            ],),
                          )),


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
