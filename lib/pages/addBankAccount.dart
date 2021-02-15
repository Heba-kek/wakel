import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/checkGra.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/withdrawSuccess.dart';

class addBankAccount extends StatefulWidget {
  @override
  _addBankAccount createState() => new _addBankAccount();
}

class _addBankAccount extends State<addBankAccount> {
  bool _valueMobile = false;

  final _cardNum = TextEditingController();
  final _cardName = TextEditingController();
  final _cvc = TextEditingController();
  final _expiry = TextEditingController();
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
        body: Container(
          color: Colors.white,
          //  width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
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
                          AppLocalizations().lbABankA,
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
                        pageBuilder: (_, __, ___) => Directionality(
                            textDirection: langSave == 'ar'
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                            child: withDrawSuccess()),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                child: ListView(
                  children: [
                    Container(
                      //  height:30,
                      //   height: MediaQuery.of(context).size.height,
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
                                          EdgeInsets.fromLTRB(35, 2, 35, 25),
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
                                  child: Column(
                                    children: [
                                      Text(
                                        AppLocalizations().lbABankA,
                                        style: TextStyle(fontFamily: 'Cairo-Black',fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(13, 30, 13, 0),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Container(
                                // color:Colors.red,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 9, 0),
                                              child: Image.asset(
                                                'assets/images/cardNu.png',
                                                color:
                                                    HexColor.fromHex("#4DBDEF"),
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations().lbAccNum,
                                              style: TextStyle(fontFamily: 'Cairo-Bold',
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 1, 5, 0),
                                        child: TextField(
                                          controller: _cardNum,
                                          // textAlign: TextAlign.right,
                                          //  controller: _title,
                                          cursorColor: Colors.transparent,
                                          //  maxLines: 10,

                                          // cursorColor: HexColor.fromHex("#1F598E"),
                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                              color:
                                                  HexColor.fromHex("#787878"),
                                              fontSize: 14),
                                          decoration: InputDecoration(
                                            //  filled: true,
                                            alignLabelWithHint: true,

                                            //  filled: true,

                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF")),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF")),
                                            ),
                                            fillColor: Colors.transparent,
                                            hintText: '7654 2341 3509 5419',
                                            hintStyle: TextStyle(fontFamily: 'Cairo-Regular',
                                              color:
                                                  HexColor.fromHex("#787878"),
                                              fontSize: 16,
                                            ),
                                            //can also add icon to the end of the textfiled
                                            //  suffixIcon: Icon(Icons.remove_red_eye),
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 9, 0),
                                              child: Image.asset(
                                                'assets/images/person.png',
                                                color:
                                                    HexColor.fromHex("#4DBDEF"),
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations().lbAccNam,
                                              style: TextStyle(
                                                fontSize: 16,fontFamily: 'Cairo-Bold',
                                              ),
                                            )
                                          ],
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 1, 5, 0),
                                        child: TextField(
                                          controller: _cardName,
                                          // textAlign: TextAlign.right,
                                          //  controller: _title,
                                          cursorColor: Colors.transparent,
                                          //  maxLines: 10,

                                          // cursorColor: HexColor.fromHex("#1F598E"),
                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                              color:
                                                  HexColor.fromHex("#787878"),
                                              fontSize: 14),
                                          decoration: InputDecoration(
                                            //  filled: true,
                                            alignLabelWithHint: true,

                                            //  filled: true,

                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF")),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF")),
                                            ),
                                            fillColor: Colors.transparent,
                                            hintText: 'Javesh Gallagher',
                                            hintStyle: TextStyle(fontFamily: 'Cairo-Regular',
                                              color:
                                                  HexColor.fromHex("#787878"),
                                              fontSize: 16,
                                            ),
                                            //can also add icon to the end of the textfiled
                                            //  suffixIcon: Icon(Icons.remove_red_eye),
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 9, 0),
                                              child: Image.asset(
                                                'assets/images/bankn.png',
                                                color:
                                                    HexColor.fromHex("#4DBDEF"),
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations().lbBankN,
                                              style: TextStyle(fontFamily: 'Cairo-Bold',
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 1, 5, 0),
                                        child: TextField(
                                          controller: _expiry,
                                          // textAlign: TextAlign.right,
                                          //  controller: _title,
                                          cursorColor: Colors.transparent,
                                          //  maxLines: 10,

                                          // cursorColor: HexColor.fromHex("#1F598E"),
                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                              color:
                                                  HexColor.fromHex("#787878"),
                                              fontSize: 14),
                                          decoration: InputDecoration(
                                            //  filled: true,
                                            alignLabelWithHint: true,

                                            //  filled: true,

                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF")),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF")),
                                            ),
                                            fillColor: Colors.transparent,
                                            hintText: 'Emirates NBD',
                                            hintStyle: TextStyle(fontFamily: 'Cairo-Regular',
                                              color:
                                                  HexColor.fromHex("#787878"),
                                              fontSize: 16,
                                            ),
                                            //can also add icon to the end of the textfiled
                                            //  suffixIcon: Icon(Icons.remove_red_eye),
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 30, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  3, 0, 9, 0),
                                              child: Image.asset(
                                                'assets/images/cvct.png',
                                              ),
                                            ),
                                            Text(
                                              AppLocalizations().lbIbn,
                                              style: TextStyle(fontFamily: 'Cairo-Bold',
                                                fontSize: 16,
                                              ),
                                            )
                                          ],
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 1, 5, 0),
                                        child: TextField(
                                          controller: _cvc,
                                          // textAlign: TextAlign.right,
                                          //  controller: _title,
                                          cursorColor: Colors.transparent,
                                          //  maxLines: 10,

                                          // cursorColor: HexColor.fromHex("#1F598E"),
                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                              color:
                                                  HexColor.fromHex("#787878"),
                                              fontSize: 14),
                                          decoration: InputDecoration(
                                            //  filled: true,
                                            alignLabelWithHint: true,

                                            //  filled: true,

                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF")),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: HexColor.fromHex(
                                                      "#DFDFDF")),
                                            ),
                                            fillColor: Colors.transparent,
                                            hintText: '5345 2445 799',
                                            hintStyle: TextStyle(fontFamily: 'Cairo-Regular',
                                              color:
                                                  HexColor.fromHex("#787878"),
                                              fontSize: 16,
                                            ),
                                            //can also add icon to the end of the textfiled
                                            //  suffixIcon: Icon(Icons.remove_red_eye),
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 30, 0, 10),
                                        child: Row(
                                          children: [
                                            MyCheckboxGr(
                                              uncheckedFillColor:
                                                  HexColor.fromHex("#C4C4C4"),
                                              checkedFillColor:
                                                  HexColor.fromHex("#C4C4C4"),
                                              value: _valueMobile,
                                              onChanged: (value) => setState(
                                                  () => _valueMobile = value),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    15, 0, 15, 0),
                                                child: Text(
                                                  AppLocalizations().lbSaveC,
                                                  style: TextStyle(fontFamily: 'Cairo-Bold',
                                                      fontSize: 14,
                                                      color: HexColor.fromHex(
                                                          "#575757")),
                                                ))
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
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
