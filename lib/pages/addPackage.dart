import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/CustomDropdownButton.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/homePageFree.dart';
import 'package:wakel/pages/packageSuccess.dart';
import 'package:wakel/pages/projectPageFree.dart';

class addPAckage extends StatefulWidget {
  @override
  _addPAckage createState() => new _addPAckage();
}

class _addPAckage extends State<addPAckage> {
  int _valueI = 1;
  String codeCI;
  int _valueS = 1;
  String codeS;
  final _sub = TextEditingController();
  final _details = TextEditingController();
  final _dead = TextEditingController();
  final _req = TextEditingController();
  final _price = TextEditingController();

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
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: Colors.white,
          //  width: MediaQuery.of(context).size.width,
          //  height: MediaQuery.of(context).size.height,
          child: Padding(
            child: ListView(
              children: [
                Container(
                  //  height:30,
                  // height: MediaQuery.of(context).size.height,
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
                                  padding: EdgeInsets.fromLTRB(35, 2, 35, 25),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: HexColor.fromHex("#4DBDEF"),
                                  )),
                              onTap: () {
                                Navigator.of(context).pop(); // close the drawer
                              },
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    AppLocalizations().lbNewP,
                                    style: TextStyle(fontSize: 20    ,fontFamily: 'Cairo-black',),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      AppLocalizations().lbFillNew,
                                      style: TextStyle(
                                          fontFamily: 'Cairo-SemiBold',
                                          fontSize: 12,
                                          color: HexColor.fromHex("#9A9A9A")),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 10, 3, 0),
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
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 0, 9, 0),
                                          child: Image.asset(
                                            'assets/images/inst.png',
                                            color: HexColor.fromHex("#4DBDEF"),
                                          ),
                                        ),
                                        Text(
                                          'التصنيف الرئيسي',
                                          style: TextStyle(
                                            fontFamily: 'Cairo-Bold',
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 1, 5, 0),
                                    child: CustomDropdownButton(
                                        value: _valueI,
                                        items: [
                                          DropdownMenuItem(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  child: Text('التصميم',
                                                      style: TextStyle(    fontFamily: 'Cairo-Regular',
                                                        color: HexColor.fromHex(
                                                            "#787878"),
                                                        fontSize: 15,
                                                      )),
                                                  padding: EdgeInsets.fromLTRB(
                                                      5, 5, 25, 5),
                                                )
                                              ],
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  child: Text('التصميم',
                                                      style: TextStyle(    fontFamily: 'Cairo-Regular',
                                                        color: HexColor.fromHex(
                                                            "#787878"),
                                                        fontSize: 15,
                                                      )),
                                                  padding: EdgeInsets.fromLTRB(
                                                      5, 5, 25, 5),
                                                )
                                              ],
                                            ),
                                            value: 2,
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _valueI = value;
                                            if (value == 1) {
                                              codeCI = 'التصميم';
                                            } else {
                                              codeCI = 'التصميم';
                                            }
                                          });
                                        }))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 10, 3, 0),
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
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 0, 9, 0),
                                          child: Image.asset(
                                            'assets/images/inst.png',
                                            color: HexColor.fromHex("#4DBDEF"),
                                          ),
                                        ),
                                        Text(
                                          'التصنيف الفرعي',
                                          style: TextStyle(    fontFamily: 'Cairo-Bold',
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 1, 5, 0),
                                    child: CustomDropdownButton(
                                        value: _valueS,
                                        items: [
                                          DropdownMenuItem(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  child: Text('تصميم شعار',
                                                      style: TextStyle(    fontFamily: 'Cairo-Regular',
                                                        color: HexColor.fromHex(
                                                            "#787878"),
                                                        fontSize: 15,
                                                      )),
                                                  padding: EdgeInsets.fromLTRB(
                                                      5, 5, 25, 5),
                                                )
                                              ],
                                            ),
                                            value: 1,
                                          ),
                                          DropdownMenuItem(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  child: Text('تصميم شعار',
                                                      style: TextStyle(    fontFamily: 'Cairo-Regular',
                                                        color: HexColor.fromHex(
                                                            "#787878"),
                                                        fontSize: 15,
                                                      )),
                                                  padding: EdgeInsets.fromLTRB(
                                                      5, 5, 25, 5),
                                                )
                                              ],
                                            ),
                                            value: 2,
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _valueS = value;
                                            if (value == 1) {
                                              codeS = 'تصميم شعار';
                                            } else {
                                              codeS = 'تصميم شعار';
                                            }
                                          });
                                        }))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 10, 3, 0),
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
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 0, 9, 0),
                                          child: Image.asset(
                                            'assets/images/menu.png',
                                            color: HexColor.fromHex("#4DBDEF"),
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations().lbSub,
                                          style: TextStyle(    fontFamily: 'Cairo-Bold',
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 1, 5, 0),
                                    child: TextField(
                                      controller: _sub,
                                      // textAlign: TextAlign.right,
                                      //  controller: _title,
                                      cursorColor: Colors.transparent,
                                      //  maxLines: 10,

                                      // cursorColor: HexColor.fromHex("#1F598E"),
                                      style: TextStyle(    fontFamily: 'Cairo-Regular',
                                          color: HexColor.fromHex("#787878"),
                                          fontSize: 14),
                                      decoration: InputDecoration(
                                        //  filled: true,
                                        alignLabelWithHint: true,

                                        //  filled: true,

                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        fillColor: Colors.transparent,
                                        hintText: AppLocalizations().lbProSub,
                                        hintStyle: TextStyle(    fontFamily: 'Cairo-Regular',
                                          color: HexColor.fromHex("#787878"),
                                          fontSize: 16,
                                        ),
                                        //can also add icon to the end of the textfiled
                                        //  suffixIcon: Icon(Icons.remove_red_eye),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 10, 3, 0),
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
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 0, 9, 0),
                                          child: Image.asset(
                                            'assets/images/menu.png',
                                            color: HexColor.fromHex("#4DBDEF"),
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations().lbDes,
                                          style: TextStyle(    fontFamily: 'Cairo-Bold',
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 1, 5, 0),
                                    child: TextField(
                                      controller: _details,
                                      // textAlign: TextAlign.right,
                                      //  controller: _title,
                                      cursorColor: Colors.transparent,
                                      maxLines: 10,

                                      // cursorColor: HexColor.fromHex("#1F598E"),
                                      style: TextStyle(    fontFamily: 'Cairo-Regular',
                                          color: HexColor.fromHex("#858585"),
                                          fontSize: 14),
                                      decoration: InputDecoration(
                                        filled: true,
                                        //  alignLabelWithHint: true,

                                        //  filled: true,

                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        fillColor: Colors.transparent,
                                        hintText: langSave == 'en'
                                            ? 'But I must explain to you how all this mistakiof denouncing pleasure and praising pain wand I will give you a complete account of thm, and expound the actual teachings of thexplorer of the truth, the master-builder of huppiness. No one rejects.'
                                            : 'والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم والسلام، وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد جعل الله السلام تحية المسلم، بحيث لا ينبغي أن يتكلم الإنسان المسلم مع آخر قبل أن يبدأ بكلمة السلام',
                                        hintStyle: TextStyle(    fontFamily: 'Cairo-Regular',
                                          color: HexColor.fromHex("#858585"),
                                          fontSize: 16,
                                        ),
                                        //can also add icon to the end of the textfiled
                                        //  suffixIcon: Icon(Icons.remove_red_eye),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 10, 3, 0),
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
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 0, 9, 0),
                                          child: Image.asset(
                                            'assets/images/menu.png',
                                            color: HexColor.fromHex("#4DBDEF"),
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations().lbreq,
                                          style: TextStyle(    fontFamily: 'Cairo-Bold',
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 1, 5, 0),
                                    child: TextField(
                                      controller: _req,
                                      // textAlign: TextAlign.right,
                                      //  controller: _title,
                                      cursorColor: Colors.transparent,
                                      maxLines: 3,

                                      // cursorColor: HexColor.fromHex("#1F598E"),
                                      style: TextStyle(    fontFamily: 'Cairo-Regular',
                                          color: HexColor.fromHex("#858585"),
                                          fontSize: 14),
                                      decoration: InputDecoration(
                                        filled: true,
                                        //  alignLabelWithHint: true,

                                        //  filled: true,

                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        fillColor: Colors.transparent,
                                        hintText: langSave == 'en'
                                            ? '1st requirement for the current project'
                                            : 'والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع',
                                        hintStyle: TextStyle(    fontFamily: 'Cairo-Regular',
                                          color: HexColor.fromHex("#858585"),
                                          fontSize: 16,
                                        ),
                                        //can also add icon to the end of the textfiled
                                        //  suffixIcon: Icon(Icons.remove_red_eye),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 10, 3, 0),
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
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 0, 9, 0),
                                          child: Image.asset(
                                            'assets/images/price.png',
                                            color: HexColor.fromHex("#4DBDEF"),
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations().lbDesP,
                                          style: TextStyle(    fontFamily: 'Cairo-Bold',
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 1, 5, 0),
                                    child: TextField(
                                      controller: _price,
                                      // textAlign: TextAlign.right,
                                      //  controller: _title,
                                      cursorColor: Colors.transparent,
                                      //  maxLines: 10,

                                      // cursorColor: HexColor.fromHex("#1F598E"),
                                      style: TextStyle(
                                          color: HexColor.fromHex("#787878"),    fontFamily: 'Cairo-Regular',
                                          fontSize: 14),
                                      decoration: InputDecoration(
                                        //  filled: true,
                                        alignLabelWithHint: true,

                                        //  filled: true,

                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        fillColor: Colors.transparent,
                                        hintText: '15',
                                        hintStyle: TextStyle(    fontFamily: 'Cairo-Regular',
                                          color: HexColor.fromHex("#787878"),
                                          fontSize: 16,
                                        ),
                                        //can also add icon to the end of the textfiled
                                        //  suffixIcon: Icon(Icons.remove_red_eye),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(3, 10, 3, 0),
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
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(3, 0, 9, 0),
                                          child: Image.asset(
                                            'assets/images/timer.png',
                                            color: HexColor.fromHex("#4DBDEF"),
                                          ),
                                        ),
                                        Text(
                                          AppLocalizations().lbDead,
                                          style: TextStyle(    fontFamily: 'Cairo-Bold',
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 1, 5, 0),
                                    child: TextField(
                                      controller: _dead,
                                      // textAlign: TextAlign.right,
                                      //  controller: _title,
                                      cursorColor: Colors.transparent,
                                      //  maxLines: 10,

                                      // cursorColor: HexColor.fromHex("#1F598E"),
                                      style: TextStyle(    fontFamily: 'Cairo-Regular',
                                          color: HexColor.fromHex("#787878"),
                                          fontSize: 14),
                                      decoration: InputDecoration(
                                        //  filled: true,
                                        alignLabelWithHint: true,

                                        //  filled: true,

                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  HexColor.fromHex("#DFDFDF")),
                                        ),
                                        fillColor: Colors.transparent,
                                        hintText: langSave == 'en'
                                            ? '5 days'
                                            : '5 أيام',
                                        hintStyle: TextStyle(    fontFamily: 'Cairo-Regular',
                                          color: HexColor.fromHex("#787878"),
                                          fontSize: 16,
                                        ),
                                        //can also add icon to the end of the textfiled
                                        //  suffixIcon: Icon(Icons.remove_red_eye),
                                      ),
                                    ))
                              ],
                            ),
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
                                AppLocalizations().lbCreatePa,
                                textAlign: TextAlign.center,
                                style: TextStyle(    fontFamily: 'Cairo-Bold',
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
                                  child: HomeScreenfree(langSave)),
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
