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

class proileNine extends StatefulWidget {
  @override
  _proileNine createState() => new _proileNine();
}

class _proileNine extends State<proileNine> {
  double rating = 3.5;
  bool rev=false;
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
  void initState() {navigationPage();}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 120,
        leading:  RaisedButton(
          elevation: 0,
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.fromLTRB(15, 45, 35, 25),
              child: Icon(
                Icons.arrow_back,
                color: HexColor.fromHex("#4DBDEF"),
              )),
          onPressed: (){
            Navigator.of(context).pop(); // close the drawer

            print('ugcj');
          },),
        elevation: 0,

        //  centerTitle: true,  automaticallyImplyLeading: false,
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.fromLTRB(5, 40, 35, 25),
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
                //  color: Colors.white,
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
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                            )),
                        Padding(
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
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          AppLocalizations().lbProLit,
                                          style: TextStyle(
                                              color:
                                              HexColor.fromHex("#858585"),
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
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          AppLocalizations().lbPaid,
                                          style: TextStyle(
                                              color:
                                              HexColor.fromHex("#858585"),
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
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          AppLocalizations().lbRev,
                                          style: TextStyle(
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 10, 20, 5),
                          child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Row(
                                children: [
                                  Text(
                                    'Latest Reviews',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: HexColor.fromHex("#464646")),
                                  ),
                                  new Spacer(),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      'Show More',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: HexColor.fromHex("#4DBDEF")),
                                    ),),
                                  Image.asset('assets/images/arrowd.png',width: 10,)
                                ],
                              )),
                        ),
                        Column(
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
                                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                            child: GestureDetector(child: Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        0, 10, 0, 10),
                                                    child: Container(
                                                        width: 320,
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(20, 10,
                                                                  20, 0),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                      photo[index]),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                          10,
                                                                          3,
                                                                          10,
                                                                          3),
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
                                                                              AppLocalizations().lbAsma,
                                                                              style:
                                                                              TextStyle(
                                                                                fontSize:
                                                                                12,
                                                                              ),
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
                                                                          padding: EdgeInsets
                                                                              .fromLTRB(
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
                                                                                    style: TextStyle(fontWeight: FontWeight.bold, color: HexColor.fromHex("#4DBDEF")),
                                                                                  )),
                                                                              Padding(
                                                                                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                                                                  child: Text(
                                                                                    AppLocalizations().lbSar,
                                                                                    style: TextStyle(color: HexColor.fromHex("#4DBDEF")),
                                                                                  ))
                                                                            ],
                                                                          )),
                                                                      /*Padding(
                                                                          padding: EdgeInsets
                                                                              .fromLTRB(
                                                                              2,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                          child:
                                                                          Text(
                                                                            AppLocalizations().lbThDay,
                                                                            style: TextStyle(
                                                                                color: HexColor.fromHex(
                                                                                  "#4DBDEF",
                                                                                ),
                                                                                fontSize: 12),
                                                                          ))*/
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),

                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(20, 10,
                                                                  20, 15),
                                                              child: Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                                  child: Text(
                                                                    AppLocalizations().lbTRans,
                                                                    style:
                                                                    TextStyle(
                                                                      fontSize: 16,
                                                                    ),
                                                                  )),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(20, 0,
                                                                  13, 5),
                                                              child:   StarRating(
                                                                rating:
                                                                rating,
                                                                onRatingChanged:
                                                                    (rating) =>
                                                                    setState(() => this.rating = rating),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(20, 10,
                                                                  20, 5),
                                                              child: Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                                  child: Text(
                                                                    'He was an awesome client that i loved workingwith and he paid at time',
                                                                    style:
                                                                    TextStyle(
                                                                        fontSize: 12,
                                                                        color: HexColor.fromHex("#858585")
                                                                    ),
                                                                  )),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(20, 10,
                                                                  20, 15),
                                                              child: Padding(
                                                                  padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                                  child:Row(children: [
                                                                    Text(
                                                                      AppLocalizations().lbThAge,
                                                                      style:
                                                                      TextStyle(
                                                                          fontSize: 12,
                                                                          color: HexColor.fromHex("#4DBDEF")
                                                                      ),
                                                                    )
                                                                  ],)),
                                                            ),
                                                          ],
                                                        ),
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: HexColor.fromHex("#7D7D7D")
                                                                    .withOpacity(0.15),
                                                                spreadRadius: 0,
                                                                blurRadius: 2,
                                                                //  offset: Offset(0, 3), // changes position of shadow
                                                              ),
                                                            ],
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                            color: Colors.white)),
                                                  )
                                                ],
                                              ),
                                            ),
                                              onTap: (){
                                                /* Navigator.of(context).push(
                                                  PageRouteBuilder(
                                                    pageBuilder: (_, __, ___) => PackageDetails(),
                                                  ),
                                                );*/
                                              },)),
                                      ],
                                    ),
                                    padding: EdgeInsets.all(0),
                                  ),
                                )),
                          ],
                        )
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
