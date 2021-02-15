import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/chatDetails.dart';

class chatPage extends StatefulWidget {
  @override
  _chatPage createState() => new _chatPage();
}

class _chatPage extends State<chatPage> {
  List<String> photo = [
    'assets/images/chati.png',
    'assets/images/chatb.png',
    'assets/images/chatg.png',
  ];
  List<String> name = ['Molly Clark', 'Julian Dasilva', 'Mike Lyne'];
  List<String> time = ['Now', '3 min ago', '1 day ago'];
  List<String> des = [
    'I must tell you my interview ..',
    'Hi Julian! See you after work?',
    'I must tell you my interview ..'
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
              // height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 1,
                              //  offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              child: Text(
                                AppLocalizations().lbSearchChat,
                                style: TextStyle(  fontFamily: 'Cairo-Regular',
                                    fontSize: 14,
                                    color: HexColor.fromHex("#5C5C5C")),
                              ),
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            ),
                          ],
                        )),
                  ),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      //  scrollDirection: Axis.vertical,
                      itemCount: photo.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(0),
                              child: GestureDetector(
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                                                      /* Container(width: 10,height: 10,
                                                      decoration: BoxDecoration(color:HexColor.fromHex("#84C857"),
                                                      borderRadius: BorderRadius.circular(90)),),*/
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            //    crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              10),
                                                                  child: Text(
                                                                    name[index],
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,  fontFamily: 'Cairo-Bold',
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  )),
                                                              Container(
                                                                child:
                                                                    VerticalDivider(
                                                                  width: 3,
                                                                  color: HexColor
                                                                      .fromHex(
                                                                          "#D4D4D4"),
                                                                ),
                                                                height: 20,
                                                              ),
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                                  child:
                                                                      Container(
                                                                    child: Text(
                                                                      AppLocalizations()
                                                                          .lbTRans,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          1,
                                                                      style: TextStyle(  fontFamily: 'Cairo-SemiBold',
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              HexColor.fromHex("#4DBDEF")),
                                                                    ),
                                                                    width: 140,
                                                                  )),
                                                            ],
                                                          ),
                                                          Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              child: Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      des[index],
                                                                      style: TextStyle(  fontFamily: 'Cairo-Regular',
                                                                          fontSize:
                                                                              12,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                    // new Spacer(),
                                                                    Text(
                                                                      time[
                                                                          index],
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12,  fontFamily: 'Cairo-Regular',
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                  ],
                                                                ),
                                                                width: 260,
                                                              )),
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          Directionality(
                                              textDirection: langSave == 'ar'
                                                  ? TextDirection.rtl
                                                  : TextDirection.ltr,
                                              child: chatDetails(
                                                  photo[index], name[index])),
                                    ),
                                  );
                                },
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              height: 1,
                              color: HexColor.fromHex("#CFCFCF"),
                            ),
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
          shrinkWrap: true,
        ),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      ),
    );
  }
}
