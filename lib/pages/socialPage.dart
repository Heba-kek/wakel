import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/CustomDropdownButton.dart';
import 'package:wakel/lang/localss.dart';

class socailPage extends StatefulWidget {
  @override
  _socailPage createState() => new _socailPage();
}

class _socailPage extends State<socailPage> {
  List<String> photo = [
    'assets/images/imggirl.png',
    'assets/images/imggirl.png',
    'assets/images/imggirl.png',
  ];
  int _value = 1;
  String codeC;
  int _valueCity = 1;
  String codeCity;
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
      // height: MediaQuery.of(context).size.height,
      child: Padding(
        child: ListView(
          children: [
            Container(
              //color:Colors.red,
              //  height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                                width: 300,
                                child: Padding(
                                  child: DropdownButtonHideUnderline(
                                    child: CustomDropdownButton(
                                        value: _valueCity,
                                        hint: Text('الهيئة الحكومية'),
                                        items: [
                                          DropdownMenuItem(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  child: Text('الهيئة الحكومية',
                                                      style: TextStyle(fontFamily: 'Cairo-Regular',
                                                        color: HexColor.fromHex(
                                                            "#303030"),
                                                        fontSize: 15,
                                                      )),
                                                  padding: EdgeInsets.all(5),
                                                )
                                              ],
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  child: Text('الهيئة الحكومية',
                                                      style: TextStyle(fontFamily: 'Cairo-Regular',
                                                        color: HexColor.fromHex(
                                                            "#303030"),
                                                        fontSize: 15,
                                                      )),
                                                  padding: EdgeInsets.all(5),
                                                )
                                              ],
                                            ),
                                            value: 2,
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _valueCity = value;
                                            if (value == 1) {
                                              codeCity =
                                                  AppLocalizations().lbDammam;
                                            } else {
                                              codeCity =
                                                  AppLocalizations().lbJadah;
                                            }
                                          });
                                        }),
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white)))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 9,
                              //  offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              child: Text(
                                AppLocalizations().lbStartT,
                                style: TextStyle(fontFamily: 'Cairo-Regular',
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
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                      color: HexColor.fromHex("#4DBDEF")),
                                  child: Padding(
                                    child: Image.asset('assets/images/tru.png'),
                                    padding: EdgeInsets.all(12),
                                  )),
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            )
                          ],
                        )),
                  ),
                  Container(
                      child: Padding(
                    padding: EdgeInsets.all(0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      //  scrollDirection: Axis.vertical,
                      itemCount: photo.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 10),
                                        child: Image.asset(
                                          photo[index],

                                          // fit: BoxFit.fill,
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 10, 0),
                                        child: Text(
                                          'Maria Khaled Eldahy',
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                              color:
                                                  HexColor.fromHex("#313450"),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                ),
                                Padding(
                                  child: Divider(
                                    height: 1,
                                    color: HexColor.fromHex("#CBCBCB"),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                                ),
                                Padding(
                                  child: Text(
                                    langSave == 'en'
                                        ? 'Short description for the info about the notification & ation & things Short description for the info about thie notification & things Short description for the infowinfo about the notification & things.'
                                        : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم في أن كلمة الاسلام تجمع نفس',
                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                        color: HexColor.fromHex("#757575"),
                                        fontSize: 11),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  child: Row(
                                    //    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                              'assets/images/sud.png')),
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            child: VerticalDivider(
                                              width: 3,
                                              color:
                                                  HexColor.fromHex("#D4D4D4"),
                                            ),
                                            height: 20,
                                          )),
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/images/waz.png',
                                            width: 30,
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 0),
                                          child: Text(
                                            langSave == 'en'
                                                ? 'Ministry of health'
                                                : 'وزارة الصحة',
                                            style: TextStyle(fontFamily: 'Cairo-Regular',
                                                fontSize: 12,
                                                color: HexColor.fromHex(
                                                    "#858585")),
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  child: Row(
                                    //    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/images/like.png',
                                            color: HexColor.fromHex("#7A8FA6"),
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 5, 10),
                                          child: Text(
                                            '360',
                                            style: TextStyle(fontFamily: 'Cairo-Bold',
                                              color:
                                                  HexColor.fromHex("#7A8FA6"),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/images/dislike.png',
                                            color: HexColor.fromHex("#7A8FA6"),
                                            // size: 20,
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 5, 10),
                                          child: Text(
                                            '360',
                                            style: TextStyle(fontFamily: 'Cairo-Bold',
                                              color:
                                                  HexColor.fromHex("#7A8FA6"),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.chat_bubble,
                                            color: HexColor.fromHex("#7A8FA6"),
                                            size: 20,
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 5, 10),
                                          child: Text(
                                            '360',
                                            style: TextStyle(fontFamily: 'Cairo-Bold',
                                              color:
                                                  HexColor.fromHex("#7A8FA6"),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                      new Spacer(),
                                      Icon(
                                        Icons.share,
                                        color: HexColor.fromHex("#7A8FA6"),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 9,
                                            //  offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            child: Text(
                                              AppLocalizations().lbTypeS,
                                              style: TextStyle(fontFamily: 'Cairo-Regular',
                                                  fontSize: 11,
                                                  color: HexColor.fromHex(
                                                      "#63697B")),
                                            ),
                                            padding: EdgeInsets.fromLTRB(
                                                10, 20, 10, 20),
                                          ),
                                          new Spacer(),
                                          Padding(
                                            child: Image.asset(
                                              'assets/images/sendicon.png',
                                              color:
                                                  HexColor.fromHex("#4DBDEF"),
                                            ),
                                            padding: EdgeInsets.fromLTRB(
                                                10, 20, 10, 20),
                                          )
                                        ],
                                      )),
                                  padding: EdgeInsets.all(15),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                border: Border.all(
                                    width: 1,
                                    color: HexColor.fromHex("#ECECEC")),
                                color: Colors.white)),
                      ),
                      padding: EdgeInsets.all(0),
                    ),
                  )),
                ],
              ),
            )
          ],
          shrinkWrap: false,
        ),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      ),
    );
  }
}
