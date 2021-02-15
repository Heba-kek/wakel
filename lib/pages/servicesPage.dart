import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/chatDetails.dart';
import 'package:wakel/pages/packageDetails.dart';

class services extends StatefulWidget {
  @override
  _services createState() => new _services();
}

class _services extends State<services> {
  List<String> photo = [
    'assets/images/imggirl.png',
    'assets/images/imggirl.png',
    'assets/images/imggirl.png',
  ];
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
          actions: [
            Padding(
                padding: EdgeInsets.fromLTRB(35, 35, 35, 25),
                child: Icon(
                  Icons.search,
                  color: HexColor.fromHex("#4DBDEF"),
                ))
          ],
          title: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [Image.asset('assets/images/zaka.png')],
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          //  width: MediaQuery.of(context).size.width,
          //  height: MediaQuery.of(context).size.height,
          child: Padding(
            child: ListView(
              children: [
                Container(
                  //     height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(35, 3, 35, 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              AppLocalizations().lbSearch,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Cairo-Regular',
                                  color: HexColor.fromHex("#5C5C5C"),
                                  fontSize: 16),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor.fromHex("#7D7D7D")
                                      .withOpacity(0.15),
                                  spreadRadius: 0,
                                  blurRadius: 2,
                                  //  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
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
                                    (BuildContext context, int index) => Column(
                                  children: [
                                    GestureDetector(
                                      child: Padding(
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
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                          3,
                                                                          0,
                                                                          3,
                                                                          0),
                                                                      child:    Image.asset(
                                                                      photo[
                                                                          index])),
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
                                                                              style: TextStyle(fontFamily: 'Cairo-Regular',
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
                                                                              5,
                                                                              3,
                                                                              5,
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
                                                                  0,
                                                                  20,
                                                                  5),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                      'assets/images/audit.png'),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                          18,
                                                                          10,
                                                                          10,
                                                                          10),
                                                                      child:
                                                                      Text(
                                                                       '23232',
                                                                        style: TextStyle(fontFamily: 'Cairo-Regular',
                                                                            fontSize:
                                                                            12,
                                                                            color:
                                                                            HexColor.fromHex("#73AF00")),
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                         0,
                                                                          20,
                                                                          0),
                                                              child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(0, 0, 0, 15),
                                                                  child: Container(
                                                                    width: MediaQuery.of(context).size.width,
                                                                    child:
                                                                  Text(

                                                                    AppLocalizations().lbTRans,

                                                                    style:
                                                                    TextStyle(fontFamily: 'Cairo-Bold',
                                                                      fontSize:
                                                                      16,
                                                                    ),
                                                                  ),)),
                                                            ),

                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          0,
                                                                          20,
                                                                          25),
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [

                                                                  GestureDetector(child:
                                                                  Container(
                                                                    //   width: MediaQuery.of(context).size.width,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              50,
                                                                              10,
                                                                              50,
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        AppLocalizations().lbBuyPAck,
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
                                                                            const Color(0xFF2CDCF8),
                                                                            const Color(0xFF13A8E3),
                                                                          ],
                                                                        ),
                                                                        color: Colors.white),
                                                                  ),
                                                                  onTap: (){
                                                                    Navigator.of(context).push(
                                                                      PageRouteBuilder(
                                                                        pageBuilder: (_, __, ___) =>
                                                                            Directionality(
                                                                                textDirection: langSave ==
                                                                                    'ar'
                                                                                    ? TextDirection
                                                                                    .rtl
                                                                                    : TextDirection
                                                                                    .ltr,
                                                                                child:      PackageDetails(langSave)),

                                                                      ),
                                                                    );
                                                                  },),
                                                                 GestureDetector(child:  Padding(
                                                                   child:
                                                                   Container(
                                                                     //   width: MediaQuery.of(context).size.width,
                                                                     child:
                                                                     Padding(
                                                                       padding:
                                                                       EdgeInsets.all(13),
                                                                       child: Image.asset(
                                                                           'assets/images/msg.png'),
                                                                     ),
                                                                     decoration: BoxDecoration(
                                                                         borderRadius: BorderRadius.all(Radius.circular(
                                                                             15)),
                                                                         border: Border.all(
                                                                             color: HexColor.fromHex("#4DBDEF"),
                                                                             width: 2),
                                                                         color: Colors.white),
                                                                   ),
                                                                   padding: EdgeInsets
                                                                       .fromLTRB(
                                                                       12,
                                                                       0,
                                                                       12,
                                                                       0),
                                                                 ),
                                                                 onTap: (){
                                                                   Navigator.of(context).push(
                                                                     PageRouteBuilder(
                                                                       pageBuilder: (_, __, ___) =>
                                                                           Directionality(
                                                                               textDirection: langSave ==
                                                                                   'ar'
                                                                                   ? TextDirection
                                                                                   .rtl
                                                                                   : TextDirection
                                                                                   .ltr,
                                                                               child:      chatDetails(photo[0],AppLocalizations().lbAsma)),

                                                                     ),
                                                                   );
                                                                 },),
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
                                              Navigator.of(context).push(
                                                PageRouteBuilder(
                                                  pageBuilder: (_, __, ___) =>
                                                      Directionality(
                                                        textDirection: langSave ==
                                                            'ar'
                                                            ? TextDirection
                                                            .rtl
                                                            : TextDirection
                                                            .ltr,
                                                        child:  PackageDetails(langSave)),
                                                ),
                                              );
                                            },
                                          )),
                                      onTap: () {

                                      },
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(0),
                              ),
                            )),
                          ],
                        ),
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
