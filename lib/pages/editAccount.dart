import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/CustomDropdownButton.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/homePage.dart';
import 'package:wakel/pages/loginImage.dart';
import 'package:wakel/pages/otpPage.dart';

class editAccount extends StatefulWidget {
  @override
  _editAccount createState() => new _editAccount();
}

class _editAccount extends State<editAccount> {
  final _pass = TextEditingController();
  final _passC = TextEditingController();

  final _name = TextEditingController();
  final _num = TextEditingController();
  final _email = TextEditingController();
  int _value = 1;
  String codeC;

  int _valueCoun = 1;
  String codeCoun;

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
    return new Scaffold(
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          centerTitle: true,
          title: Column(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 5),
                  child: Text(
                    AppLocalizations().lbEdit,
                    style: TextStyle(fontFamily: 'Cairo-Black',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Text(
                  AppLocalizations().lbMsgReg,
                  style: TextStyle(fontFamily: 'Cairo-SemiBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: HexColor.fromHex("#9A9A9A")),
                ),
              )
            ],
          ),
          leading: RaisedButton(
            elevation: 0,
            color: HexColor.fromHex("#FCFCFC"),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 35, 35, 25),
                child: Icon(
                  Icons.arrow_back,
                  color: HexColor.fromHex("#4DBDEF"),
                )),
            onPressed: () {
              Navigator.of(context).pop(); // close the drawer
            },
          ),
          backgroundColor: HexColor.fromHex("#FCFCFC"),
        ),
        body: Container(
          color: HexColor.fromHex("#FCFCFC"),
          //  width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            child: ListView(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Container(
                          child: Padding(
                            child: Column(
                              children: [
                                Image.asset('assets/images/addimg.png'),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                                  child: Text(
                                    AppLocalizations().lbUploadI,
                                    style: TextStyle(
                                        color: HexColor.fromHex("#888888"),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                          ),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 9,
                                  //  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                child: Image.asset("assets/images/person.png"),
                              ),
                              Text(
                                AppLocalizations().lbUser,
                                style: TextStyle(fontFamily: 'Cairo-bold',
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                        child: TextField(
                          controller: _name,
                          // textAlign: TextAlign.right,
                          //  controller: _title,
                          cursorColor: Colors.transparent,
                          //  maxLines: 10,

                          // cursorColor: HexColor.fromHex("#1F598E"),
                          style: TextStyle(fontFamily: 'Cairo-Regular',
                              color: HexColor.fromHex("#BCBCBC"), fontSize: 14),
                          decoration: InputDecoration(
                            //  filled: true,
                            alignLabelWithHint: true,

                            //  filled: true,

                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex("#DFDFDF")),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex("#DFDFDF")),
                            ),
                            fillColor: Colors.transparent,
                            hintText: 'خالد سعيد عبد المنعم',
                            hintStyle: TextStyle(fontFamily: 'Cairo-Regular',
                              color: HexColor.fromHex("#787878"),
                              fontSize: 16,
                            ),
                            //can also add icon to the end of the textfiled
                            //  suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(3, 0, 6, 0),
                                child: Image.asset('assets/images/mob.png'),
                              ),
                              Text(
                                AppLocalizations().lbMobNu,
                                style: TextStyle(fontFamily: 'Cairo-Bold',
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Row(
                          children: [
                            Padding(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 110,
                                      child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 5, 0),
                                          child: CustomDropdownButton(
                                              value: _value,
                                              hint: Text('+966'),
                                              items: [
                                                DropdownMenuItem(
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                          'assets/images/sud.png'),
                                                      Padding(
                                                        child: Text("966",
                                                            style: TextStyle(fontFamily: 'Cairo-Regular',
                                                              color: HexColor
                                                                  .fromHex(
                                                                      "#787878"),
                                                              fontSize: 15,
                                                            )),
                                                        padding:
                                                            EdgeInsets.all(5),
                                                      )
                                                    ],
                                                  ),
                                                  value: 1,
                                                ),
                                                DropdownMenuItem(
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                          'assets/images/sud.png'),
                                                      Padding(
                                                        child: Text("971",
                                                            style: TextStyle(fontFamily: 'Cairo-Regular',
                                                              color: HexColor
                                                                  .fromHex(
                                                                      "#787878"),
                                                              fontSize: 15,
                                                            )),
                                                        padding:
                                                            EdgeInsets.all(5),
                                                      )
                                                    ],
                                                  ),
                                                  value: 2,
                                                ),
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  _value = value;
                                                  if (value == 1) {
                                                    codeC = '963';
                                                  } else {
                                                    codeC = '966';
                                                  }
                                                });
                                              })),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(0, 16, 0, 0)),
                            Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
                            Container(
                                width: MediaQuery.of(context).size.width / 1.8,
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: TextField(
                                  controller: _num,
                                  cursorColor: HexColor.fromHex("#787878"),
                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                      color: HexColor.fromHex("#787878")),
                                  decoration: InputDecoration(
                                    //  filled: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: HexColor.fromHex("#D7D7D7")),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: HexColor.fromHex("#D7D7D7")),
                                    ),
                                    fillColor: Colors.transparent,
                                    hintText: '98763552626 ',
                                    hintStyle: TextStyle(fontFamily: 'Cairo-Regular',
                                        color: HexColor.fromHex("#787878"),
                                        fontSize: 14),
                                    //can also add icon to the end of the textfiled
                                    //  suffixIcon: Icon(Icons.remove_red_eye),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                child: Icon(
                                  Icons.mail,
                                  color: HexColor.fromHex("#4DBDEF"),
                                ),
                              ),
                              Text(
                                AppLocalizations().lbEmail,
                                style: TextStyle(fontFamily: 'Cairo-Bold',
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                        child: TextField(
                          controller: _email,
                          // textAlign: TextAlign.right,
                          //  controller: _title,
                          cursorColor: Colors.transparent,
                          //  maxLines: 10,

                          // cursorColor: HexColor.fromHex("#1F598E"),
                          style: TextStyle(fontFamily: 'Cairo-Regular',
                              color: HexColor.fromHex("#BCBCBC"), fontSize: 14),
                          decoration: InputDecoration(
                            //  filled: true,
                            alignLabelWithHint: true,

                            //  filled: true,

                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex("#DFDFDF")),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex("#DFDFDF")),
                            ),
                            fillColor: Colors.transparent,
                            hintText: 'Mist.ahanoun765@gmail.com',
                            hintStyle: TextStyle(fontFamily: 'Cairo-Regular',
                              color: HexColor.fromHex("#787878"),
                              fontSize: 16,
                            ),
                            //can also add icon to the end of the textfiled
                            //  suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 0, 3, 0),
                                          child: Image.asset(
                                              'assets/images/baby.png'),
                                        ),
                                        Text(
                                          AppLocalizations().lbAge,
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          3.7,
                                      child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 1, 1, 0),
                                          child: CustomDropdownButton(
                                            //   isExpanded: true,
                                            value: _valueCoun,
                                            hint:
                                                Text(AppLocalizations().lbDay,style: TextStyle(fontFamily: 'Cairo-Bold',),),
                                            items: [
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      child: Text('1',
                                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#787878"),
                                                            fontSize: 15,
                                                          )),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                    )
                                                  ],
                                                ),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      child: Text('2',
                                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#787878"),
                                                            fontSize: 15,
                                                          )),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                    )
                                                  ],
                                                ),
                                                value: 2,
                                              ),
                                            ],

                                            onChanged: (value) {
                                              setState(() {
                                                _valueCoun = value;
                                                if (value == 1) {
                                                  codeCoun = '1';
                                                } else {
                                                  codeCoun = '2';
                                                }
                                              });
                                            },
                                          )),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 1, 1, 0),
                                          child: CustomDropdownButton(
                                            //   isExpanded: true,
                                            value: _valueCoun,
                                            hint: Text(AppLocalizations().lbMo,style: TextStyle(fontFamily: 'Cairo-Bold',),),
                                            items: [
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      child: Text('3',
                                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#787878"),
                                                            fontSize: 15,
                                                          )),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                    )
                                                  ],
                                                ),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      child: Text('4',
                                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#787878"),
                                                            fontSize: 15,
                                                          )),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                    )
                                                  ],
                                                ),
                                                value: 2,
                                              ),
                                            ],

                                            onChanged: (value) {
                                              setState(() {
                                                _valueCoun = value;
                                                if (value == 1) {
                                                  codeCoun = '3';
                                                } else {
                                                  codeCoun = '4';
                                                }
                                              });
                                            },
                                          )),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 1, 1, 0),
                                          child: CustomDropdownButton(
                                            //   isExpanded: true,
                                            value: _valueCoun,
                                            hint: Text(AppLocalizations().lbY,style: TextStyle(fontFamily: 'Cairo-Bold',),),
                                            items: [
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      child: Text('1990',
                                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#787878"),
                                                            fontSize: 15,
                                                          )),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                    )
                                                  ],
                                                ),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      child: Text('1992',
                                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#787878"),
                                                            fontSize: 15,
                                                          )),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                    )
                                                  ],
                                                ),
                                                value: 2,
                                              ),
                                            ],

                                            onChanged: (value) {
                                              setState(() {
                                                _valueCoun = value;
                                                if (value == 1) {
                                                  codeCoun = '1991';
                                                } else {
                                                  codeCoun = '1992';
                                                }
                                              });
                                            },
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 0, 3, 0),
                                          child: Image.asset(
                                              'assets/images/gender.png'),
                                        ),
                                        Text(
                                          AppLocalizations().gend,
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.15,
                                      child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 1, 1, 0),
                                          child: CustomDropdownButton(
                                            //   isExpanded: true,
                                            value: _valueCoun,
                                            hint:
                                                Text(AppLocalizations().lbDay),
                                            items: [
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      child: Text(
                                                          AppLocalizations()
                                                              .lbMale,
                                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#787878"),
                                                            fontSize: 15,
                                                          )),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                    )
                                                  ],
                                                ),
                                                value: 1,
                                              ),
                                              DropdownMenuItem(
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      child: Text(
                                                          AppLocalizations()
                                                              .lbFemale,
                                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                                            color: HexColor
                                                                .fromHex(
                                                                    "#787878"),
                                                            fontSize: 15,
                                                          )),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                    )
                                                  ],
                                                ),
                                                value: 2,
                                              ),
                                            ],

                                            onChanged: (value) {
                                              setState(() {
                                                _valueCoun = value;
                                                if (value == 1) {
                                                  codeCoun =
                                                      AppLocalizations().lbMale;
                                                } else {
                                                  codeCoun = AppLocalizations()
                                                      .lbFemale;
                                                }
                                              });
                                            },
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(26, 20, 26, 0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                child: Icon(
                                  Icons.lock,
                                  color: HexColor.fromHex("#4DBDEF"),
                                ),
                              ),
                              Text(
                                AppLocalizations().lbPass,
                                style: TextStyle(fontFamily: 'Cairo-Bold',
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(35, 0, 30, 10),
                        child: TextField(
                          controller: _pass,
                          // textAlign: TextAlign.right,
                          //  controller: _title,
                          cursorColor: Colors.transparent,
                          //  maxLines: 10,
                          obscureText: true,

                          // cursorColor: HexColor.fromHex("#1F598E"),
                          style: TextStyle(fontFamily: 'Cairo-Regular',
                              color: HexColor.fromHex("#BCBCBC"), fontSize: 25),
                          decoration: InputDecoration(
                            //  filled: true,
                            alignLabelWithHint: true,

                            //  filled: true,

                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex("#DFDFDF")),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex("#DFDFDF")),
                            ),
                            fillColor: Colors.transparent,
                            hintText: AppLocalizations().lbPass,
                            hintStyle: TextStyle(fontFamily: 'Cairo-Regular',
                              color: HexColor.fromHex("#787878"),
                              fontSize: 16,
                            ),
                            //can also add icon to the end of the textfiled
                            //  suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(26, 20, 26, 0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                child: Icon(
                                  Icons.lock,
                                  color: HexColor.fromHex("#4DBDEF"),
                                ),
                              ),
                              Text(
                                AppLocalizations().lbConPass,
                                style: TextStyle(fontFamily: 'Cairo-Bold',
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(35, 0, 30, 10),
                        child: TextField(
                          controller: _passC,
                          // textAlign: TextAlign.right,
                          //  controller: _title,
                          cursorColor: Colors.transparent,
                          //  maxLines: 10,
                          obscureText: true,

                          // cursorColor: HexColor.fromHex("#1F598E"),
                          style: TextStyle(fontFamily: 'Cairo-Regular',
                              color: HexColor.fromHex("#BCBCBC"), fontSize: 25),
                          decoration: InputDecoration(
                            //  filled: true,
                            alignLabelWithHint: true,

                            //  filled: true,

                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex("#DFDFDF")),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex("#DFDFDF")),
                            ),
                            fillColor: Colors.transparent,
                            hintText: AppLocalizations().lbConPass,
                            hintStyle: TextStyle(fontFamily: 'Cairo-Regular',
                              color: HexColor.fromHex("#787878"),
                              fontSize: 16,
                            ),
                            //can also add icon to the end of the textfiled
                            //  suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(60, 70, 60, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Text(
                                AppLocalizations().lbEditD,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontFamily: 'Cairo-Bold',
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF13A8E3),
                                    const Color(0xFF2CDCF8),
                                  ],
                                ),
                                color: HexColor.fromHex("#F6F6F6")),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => Directionality(
                                  textDirection: langSave == 'ar'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: HomeScreen(langSave)),
                            ),
                          );
                        },
                      ),
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
