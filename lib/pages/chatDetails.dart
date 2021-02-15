import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/freelanceProfile.dart';

class chatDetails extends StatefulWidget {
  final String photo;
  final String name;

  chatDetails(this.photo, this.name);

  @override
  _chatDetails createState() => new _chatDetails();
}

class _chatDetails extends State<chatDetails> {
  bool status = false;
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
          //  leadingWidth: 100,
          // centerTitle: true,
          leading: RaisedButton(
            elevation: 0,
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 25),
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
            GestureDetector(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(35, 25, 35, 25),
                  child: Icon(
                    Icons.menu_outlined,
                    color: HexColor.fromHex("#4DBDEF"),
                  )),
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierColor: Color(0x97000000),
                    builder: (context) {
                      return AlertDialog(
                        actionsPadding: EdgeInsets.zero,
                        insetPadding: EdgeInsets.fromLTRB(10, 20, 10, 350),
                        backgroundColor: Colors.transparent,
                        content: new Container(
                          width: 260.0,
                          alignment: Alignment.topCenter,
                          height: 100.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(22.0)),
                          ),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              // dialog top
                              Row(
                                children: [
                                  PopupMenuItem(
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/mute.png',
                                          width: 13,
                                          height: 13,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: Text(
                                            AppLocalizations().lbMute,
                                            style: TextStyle(
                                                fontFamily: 'Cairo-Regular',
                                                color:
                                                    HexColor.fromHex("#575757"),
                                                fontSize: 12),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 30,
                                    child: CustomSwitch(
                                      //  activeColor:  HexColor.fromHex("#FF6262"),
                                      value: status,

                                      onChanged: (value) {
                                        print("VALUE : $value");
                                        setState(() {
                                          status = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/stop.png',
                                      width: 13,
                                      height: 13,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Text(
                                        AppLocalizations().lbRepo,
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Regular',
                                            color: HexColor.fromHex("#FF6262"),
                                            fontSize: 12),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                // close the drawer
              },
            ),
          ],
          title: Padding(
            padding: EdgeInsets.all(0),
            child: Row(
              children: [
                Image.asset(widget.photo),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontFamily: 'Cairo-black',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.normal),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: HexColor.fromHex("#84C857")),
                              ),
                              Padding(
                                child: Text(
                                  AppLocalizations().lbOn,
                                  style: TextStyle(
                                      fontFamily: 'Cairo-Bold',
                                      color: HexColor.fromHex("#787878"),
                                      fontSize: 11),
                                ),
                                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                              )
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
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
                      //    color: HexColor.fromHex("#4DBDEF"),
                      child: Row(
                        children: [
                          Padding(
                            child: Text(
                              AppLocalizations().lbTypeS,
                              style: TextStyle(
                                  fontFamily: 'Cairo-Regular',
                                  fontSize: 11,
                                  color: HexColor.fromHex("#63697B")),
                            ),
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          ),
                          new Spacer(),
                          Padding(
                            child: Container(
                                child: Padding(
                              child: Image.asset('assets/images/attach.png'),
                              padding: EdgeInsets.all(2),
                            )),
                            padding: EdgeInsets.fromLTRB(1, 20, 1, 20),
                          ),
                          Padding(
                            child: Container(
                                child: Padding(
                              child: Icon(
                                Icons.mic_none,
                                color: HexColor.fromHex("#BFC4D3"),
                              ),
                              padding: EdgeInsets.all(2),
                            )),
                            padding: EdgeInsets.fromLTRB(1, 20, 1, 20),
                          ),
                          Padding(
                            child: Container(
                                child: Padding(
                              child: Image.asset(
                                'assets/images/send.png',
                                width: 23,
                              ),
                              padding: EdgeInsets.all(0),
                            )),
                            padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          )
                        ],
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                    onTap: () {
                      /* Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => orderCon(),
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
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(35, 26, 35, 26),
                                    child: Row(
                                      children: [
                                        Text(
                                          AppLocalizations().lbTRans,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Cairo-Regular',
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                      ],
                                    )),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)),
                                    border: Border.all(
                                        width: 1,
                                        color: HexColor.fromHex("#E1E1E1")),
                                    color: HexColor.fromHex("#4DBDEF")),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 6, 10, 26),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    //   width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(5, 15, 5, 15),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/images/absher.png',
                                            width: 26,
                                            height: 26,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Text(
                                              'Absher',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'Cairo-Bold',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: HexColor.fromHex("#73AF00")),
                                  ),
                                  Padding(
                                    child: Container(
                                      //   width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 15, 5, 15),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/adel.png',
                                              width: 26,
                                              height: 26,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 0),
                                              child: Text(
                                                'Ministry of Law',
                                                style: TextStyle(
                                                    fontFamily: 'Cairo-Bold',
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: HexColor.fromHex("#73AF00")),
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(35, 0, 35, 2),
                                child: Container(
                                  child: Row(children: [
                                    GestureDetector(
                                      child: Image.asset(
                                          'assets/images/imggirl.png'),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                Directionality(
                                                    textDirection:
                                                        langSave == 'ar'
                                                            ? TextDirection.rtl
                                                            : TextDirection.ltr,
                                                    child: freelanceProfile()),
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Stack(children: [
                                              Image.asset(
                                                'assets/images/revmsg.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.5,
                                              ),
                                              Padding(
                                                child: Container(
                                                  child: Text(
                                                    'Hi Cassie! Would you be available for a coffee next week? 😁',
                                                    maxLines: 1000,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Cairo-Regular',
                                                        color: HexColor.fromHex(
                                                            "#63697B"),
                                                        fontSize: 12),
                                                  ),
                                                  width: 200,
                                                ),
                                                padding: EdgeInsets.fromLTRB(
                                                    25, 10, 25, 10),
                                              )
                                            ])),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                              child: Text(
                                                '08:02',
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontFamily: 'Cairo-Regular',
                                                    color: HexColor.fromHex(
                                                        "#63697B")),
                                              ),
                                            )
                                          ],
                                        ))
                                  ]),
                                )),
                            Padding(
                                padding: EdgeInsets.fromLTRB(25, 0, 25, 2),
                                child: Container(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        //   Image.asset('assets/images/imggirl.png'),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                    child: Stack(children: [
                                                  Image.asset(
                                                    'assets/images/sendmsg.png',
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                  ),
                                                  Padding(
                                                    child: Container(
                                                      child: Text(
                                                        'Hi Ashley! Yes with pleasure! Do you prefer when?',
                                                        maxLines: 1000,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Cairo-Regular',
                                                            color: Colors.white,
                                                            fontSize: 12),
                                                      ),
                                                      width: 200,
                                                    ),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            25, 10, 25, 10),
                                                  )
                                                ])),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '08:02',
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            fontFamily:
                                                                'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#63697B")),
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  5, 0, 5, 0),
                                                          child: Image.asset(
                                                            widget.photo,
                                                            width: 12,
                                                            height: 12,
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ))
                                      ]),
                                )),
                            Padding(
                                padding: EdgeInsets.fromLTRB(35, 0, 35, 6),
                                child: Container(
                                  child: Row(children: [
                                    Image.asset('assets/images/imggirl.png'),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Stack(children: [
                                              Image.asset(
                                                'assets/images/revmsg.png',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.5,
                                              ),
                                              Padding(
                                                child: Container(
                                                  child: Text(
                                                    'Hmm ... Tuesday night, around 19 hours is good for you?',
                                                    maxLines: 1000,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Cairo-Regular',
                                                        color: HexColor.fromHex(
                                                            "#63697B"),
                                                        fontSize: 12),
                                                  ),
                                                  width: 200,
                                                ),
                                                padding: EdgeInsets.fromLTRB(
                                                    25, 10, 25, 10),
                                              )
                                            ])),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                              child: Text(
                                                '08:05',
                                                style: TextStyle(
                                                    fontFamily: 'Cairo-Regular',
                                                    fontSize: 9,
                                                    color: HexColor.fromHex(
                                                        "#63697B")),
                                              ),
                                            )
                                          ],
                                        ))
                                  ]),
                                )),
                            Padding(
                                padding: EdgeInsets.fromLTRB(25, 0, 25, 2),
                                child: Container(
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        //   Image.asset('assets/images/imggirl.png'),
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 10, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Image.asset(
                                                  'assets/images/dog.png',
                                                  height: 206,
                                                  width: 220,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        '08:08',
                                                        style: TextStyle(
                                                            fontSize: 9,
                                                            fontFamily:
                                                                'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#63697B")),
                                                      ),
                                                      Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  5, 0, 5, 0),
                                                          child: Image.asset(
                                                            widget.photo,
                                                            width: 12,
                                                            height: 12,
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ))
                                      ]),
                                )),
                          ],
                        ),
                      )
                    ],
                    shrinkWrap: true,
                  ),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
                ),
              ],
            )));
  }
}
