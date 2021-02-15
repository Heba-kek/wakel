import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/lang/localss.dart';

class ProjectPageHomeFree extends StatefulWidget {
  @override
  _ProjectPageHomeFree createState() => new _ProjectPageHomeFree();
}

class _ProjectPageHomeFree extends State<ProjectPageHomeFree> {
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
      //  width: MediaQuery.of(context).size.width,
      color: HexColor.fromHex("#FCFCFC"),

      height: MediaQuery.of(context).size.height,
      child: Padding(
        child: ListView(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height,
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
                      itemBuilder: (BuildContext context, int index) => Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                      child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.1,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 10, 10, 5),
                                                child: Row(
                                                  children: [
                                                    Image.asset(photo[index]),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Text(
                                                          AppLocalizations()
                                                              .lbAsma,
                                                          style: TextStyle(  fontFamily: 'Cairo-Regular',
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                    new Spacer(),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                2, 0, 2, 0),
                                                        child: Text(
                                                          '51.00 ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,  fontFamily: 'Cairo-Black',
                                                              color: HexColor
                                                                  .fromHex(
                                                                      "#4DBDEF")),
                                                        )),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                2, 0, 2, 0),
                                                        child: Text(
                                                          AppLocalizations()
                                                              .lbSar,
                                                          style: TextStyle(  fontFamily: 'Cairo-Bold',
                                                              color: HexColor
                                                                  .fromHex(
                                                                      "#4DBDEF")),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 0, 10, 10),
                                                child: Padding(
                                                    padding: EdgeInsets.all(0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Text(
                                                        AppLocalizations()
                                                            .lbTRans,
                                                        style: TextStyle(  fontFamily: 'Cairo-Bold',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    )),
                                              ),
                                              index == 0
                                                  ? Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              20, 0, 10, 10),
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    AppLocalizations()
                                                                        .lbOnPro,
                                                                    style: TextStyle(  fontFamily: 'Cairo-SemiBold',
                                                                        fontSize:
                                                                            12,
                                                                        color: HexColor.fromHex(
                                                                            "#E7981C")),
                                                                  )
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      langSave ==
                                                                              'en'
                                                                          ? '3 Days and 5 hrs to deliver'
                                                                          : 'باقى 3 ايام و 5 ساعات على التسليم',
                                                                      style: TextStyle(  fontFamily: 'Cairo-SemiBold',
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              HexColor.fromHex("#4DBDEF")),
                                                                    )
                                                                  ],
                                                                ),
                                                              )
                                                            ],
                                                          )),
                                                    )
                                                  : index == 1
                                                      ? Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(20, 0,
                                                                  10, 10),
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    AppLocalizations()
                                                                        .lbCancelPro,
                                                                    style: TextStyle(  fontFamily: 'Cairo-SemiBold',
                                                                        fontSize:
                                                                            12,
                                                                        color: HexColor.fromHex(
                                                                            "#EF4D4D")),
                                                                  )
                                                                ],
                                                              )),
                                                        )
                                                      : Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(20, 0,
                                                                  10, 10),
                                                          child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    'Bid Placed',
                                                                    style: TextStyle(  fontFamily: 'Cairo-SemiBold',
                                                                        fontSize:
                                                                            12,
                                                                        color: HexColor.fromHex(
                                                                            "#4DBDEF")),
                                                                  )
                                                                ],
                                                              )),
                                                        ),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    15, 0, 15, 10),
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/waz.png',
                                                      width: 38,
                                                    ),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5, 10, 5, 10),
                                                        child: Text(
                                                          AppLocalizations()
                                                              .lbMiniAff,
                                                          style: TextStyle(  fontFamily: 'Cairo-SemiBold',
                                                              fontSize: 12,
                                                              color: HexColor
                                                                  .fromHex(
                                                                      "#6E6E6E")),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              color: Colors.white)),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                      padding: EdgeInsets.all(0),
                    ),
                  )),
                ],
              ),
            )
          ],
          shrinkWrap: true,
        ),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      ),
    );
  }
}
