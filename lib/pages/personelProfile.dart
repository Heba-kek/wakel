import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakel/Extension/LocalHelper.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/accountBalanceTop.dart';
import 'package:wakel/pages/createPayment.dart';
import 'package:wakel/pages/editAccount.dart';
import 'package:wakel/pages/faqPage.dart';
import 'package:wakel/pages/packageSuccess.dart';
import 'package:wakel/pages/splashActivity.dart';

class personelProfile extends StatefulWidget {
  final String lang;

  personelProfile(this.lang);

  @override
  _personelProfile createState() => new _personelProfile();
}

class _personelProfile extends State<personelProfile> {
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
    //  helper.onLocaleChanged = onLocaleChange;

    return new Container(
      color: HexColor.fromHex("#FCFCFC"),
      //  width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Padding(
            child: ListView(
              children: [
                Container(
                  //  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(35, 29, 35, 40),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(15, 15, 15, 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFFE71E20),
                                            const Color(0xFFEB5E1A),
                                          ],
                                        ),
                                        color: HexColor.fromHex("#4DBDEF")),
                                    child: Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      barrierColor: Color(0x97000000),
                                      builder: (BuildContext context) {
                                        return showDialogLang();
                                      });
                                },
                              ),
                              Center(
                                child: Container(
                                    width: 106,
                                    height: 106,

                                    // child: Image.asset('assets/images/girl.png',),

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        //   color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/girl.png'),
                                            fit: BoxFit.cover))),
                              ),
                              GestureDetector(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(35, 29, 35, 40),
                                  child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(15, 15, 15, 15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xFF13A8E3),
                                            const Color(0xFF2CDCF8),
                                          ],
                                        ),
                                        color: HexColor.fromHex("#4DBDEF")),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
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
                                              child: editAccount()),
                                    ),
                                  );
                                },
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Center(
                            child: Text(
                              AppLocalizations().lbStef,
                              style: TextStyle(
                                fontFamily: 'Cairo-Bold',
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'الوظيفة',
                            style: TextStyle(
                              fontFamily: 'Cairo-SemiBold',
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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

                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Text(
                                        AppLocalizations().lbProLit,
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Semibold',
                                            color: HexColor.fromHex("#858585"),
                                            fontSize: 11),
                                      ),
                                    ), Text(
                                      '3472',
                                      style: TextStyle(
                                          fontFamily: 'Cairo-Bold',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                              ),
                              Padding(
                                child: Column(
                                  children: [

                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Text(
                                        AppLocalizations().lbPaid,
                                        style: TextStyle(
                                            fontFamily: 'Cairo-SemiBold',
                                            color: HexColor.fromHex("#858585"),
                                            fontSize: 11),
                                      ),
                                    ), Text(
                                      '1827 ر.س',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Cairo-Bold',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(18, 10, 28, 10),
                              ),
                              Padding(
                                child: Column(
                                  children: [

                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Text(
                                        AppLocalizations().lbRev,
                                        style: TextStyle(
                                            fontFamily: 'Cairo-SemiBold',
                                            color: HexColor.fromHex("#858585"),
                                            fontSize: 11),
                                      ),
                                    ), Text(
                                      '535',
                                      style: TextStyle(
                                          fontFamily: 'Cairo-Bold',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
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
                        child: Text(
                          AppLocalizations().lbCurrentB,
                          style: TextStyle(
                              fontFamily: 'Cairo-SemiBold',
                              fontSize: 15,
                              color: HexColor.fromHex("#464646")),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      ),
                      Directionality(
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  child: GestureDetector(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 17, 0, 17),
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 0, 8, 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color:
                                                  HexColor.fromHex("#575757")),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 15, 10, 15),
                                            child: Image.asset(
                                              'assets/images/quas.png',
                                              width: 22,
                                              height: 22,
                                            ),
                                          )),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              Directionality(
                                                  textDirection:
                                                      langSave == 'ar'
                                                          ? TextDirection.rtl
                                                          : TextDirection.ltr,
                                                  child: faqPage()),
                                        ),
                                      );
                                    },
                                  ),
                                  padding: EdgeInsets.fromLTRB(18, 0, 28, 0),
                                ),
                                Padding(
                                  child: Column(
                                    children: [
                                      Text(
                                        '1827',
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Regular',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 3, 0, 0),
                                        child: Text(
                                          'ر.س',
                                          style: TextStyle(
                                              fontFamily: 'Cairo-SemiBold',
                                              fontSize: 20,
                                              color:
                                                  HexColor.fromHex("#4DBDEF")),
                                        ),
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.fromLTRB(18, 10, 28, 10),
                                ),
                                Padding(
                                  child: GestureDetector(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 17, 0, 17),
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 0, 8, 0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(
                                                colors: [
                                                  const Color(0xFF13A8E3),
                                                  const Color(0xFF2CDCF8),
                                                ],
                                              ),
                                              color:
                                                  HexColor.fromHex("#575757")),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 15, 10, 15),
                                            child: Image.asset(
                                              'assets/images/doll.png',
                                              color: Colors.white,
                                              width: 22,
                                              height: 24,
                                            ),
                                          )),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              Directionality(
                                                  textDirection:
                                                      langSave == 'ar'
                                                          ? TextDirection.rtl
                                                          : TextDirection.ltr,
                                                  child: createPayment()),
                                        ),
                                      );
                                    },
                                  ),
                                  padding: EdgeInsets.fromLTRB(18, 0, 28, 0),
                                )
                              ],
                            )),
                        textDirection: widget.lang == 'en'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                      ),
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
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '- \$85',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: HexColor.fromHex("#FF2C17")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Text(
                                        '08:54 AM',
                                        style: TextStyle(
                                            color: HexColor.fromHex("#6C7B8A"),
                                            fontSize: 11),
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(18, 10, 20, 10),
                              ),
                              Padding(
                                child: Container(
                                    width: 40,
                                    height: 40,

                                    // child: Image.asset('assets/images/girl.png',),

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        //   color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/proo.png'),
                                            fit: BoxFit.cover))),
                                padding: EdgeInsets.fromLTRB(0, 10, 28, 10),
                              ),
                              Padding(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ryan Eilla',
                                      style: TextStyle(
                                          fontFamily: 'Cairo-SemiBold',
                                          fontSize: 13,
                                          color: HexColor.fromHex("#140F26")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/images/file.png'),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Container(
                                              child: Text(
                                                AppLocalizations().lbTRans,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Cairo-SemiBold',
                                                    color: HexColor.fromHex(
                                                        "#4DBDEF"),
                                                    fontSize: 11),
                                              ),
                                              width: 100,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(1, 10, 28, 10),
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
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '+ \$20',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: HexColor.fromHex("#56AB2F")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Text(
                                        '08:54 AM',
                                        style: TextStyle(
                                            color: HexColor.fromHex("#6C7B8A"),
                                            fontSize: 11),
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(18, 10, 20, 10),
                              ),
                              Padding(
                                child: Container(
                                    width: 40,
                                    height: 40,

                                    // child: Image.asset('assets/images/girl.png',),

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        //   color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/prot.png'),
                                            fit: BoxFit.cover))),
                                padding: EdgeInsets.fromLTRB(0, 10, 28, 10),
                              ),
                              Padding(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Max Carson',
                                      style: TextStyle(
                                          fontFamily: 'Cairo-SemiBold',
                                          fontSize: 13,
                                          color: HexColor.fromHex("#140F26")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/images/file.png'),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Container(
                                              child: Text(
                                                AppLocalizations().lbTRans,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Cairo-SemiBold',
                                                    color: HexColor.fromHex(
                                                        "#4DBDEF"),
                                                    fontSize: 11),
                                              ),
                                              width: 100,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(1, 10, 28, 10),
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
                          padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '- \$85',
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: HexColor.fromHex("#FF2C17")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Text(
                                        '08:54 AM',
                                        style: TextStyle(
                                            color: HexColor.fromHex("#6C7B8A"),
                                            fontSize: 11),
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(18, 10, 20, 10),
                              ),
                              Padding(
                                child: Container(
                                    width: 40,
                                    height: 40,

                                    // child: Image.asset('assets/images/girl.png',),

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        //   color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/proth.png'),
                                            fit: BoxFit.cover))),
                                padding: EdgeInsets.fromLTRB(0, 10, 28, 10),
                              ),
                              Padding(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pull Eilla',
                                      style: TextStyle(
                                          fontFamily: 'Cairo-SemiBold',
                                          fontSize: 13,
                                          color: HexColor.fromHex("#140F26")),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                      child: Row(
                                        children: [
                                          Image.asset('assets/images/file.png'),
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(2, 0, 2, 0),
                                            child: Container(
                                              child: Text(
                                                AppLocalizations().lbTRans,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontFamily:
                                                        'Cairo-SemiBold',
                                                    color: HexColor.fromHex(
                                                        "#4DBDEF"),
                                                    fontSize: 11),
                                              ),
                                              width: 100,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.fromLTRB(1, 10, 28, 10),
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
    );
  }

  Widget showDialogLang() {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: Container(
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(22.0)),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'change',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.praimarydark),
                  ),
                ),
                GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('English'),
                    ),
                    onTap: () async {
                      var preferences = await SharedPreferences.getInstance();

                      AppLocalizations().locale == 'en';
                      helper.onLocaleChanged(new Locale("en"));
                      AppLocalizations.load(new Locale("en"));
                      preferences.setString('lang', 'en');

                      preferences.remove('sessionId');

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Directionality(
                                  textDirection: langSave == 'ar'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: Splash())),
                          ModalRoute.withName("/Home"));
                    }),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('العربية'),
                  ),
                  onTap: () async {
                    String lang = AppLocalizations().locale;
                    var preferences = await SharedPreferences.getInstance();

// Save a value

                    AppLocalizations().locale == 'ar';
                    helper.onLocaleChanged(new Locale("ar"));
                    AppLocalizations.load(new Locale("ar"));
                    preferences.setString('lang', 'ar');

                    preferences.remove('sessionId');

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Directionality(
                                textDirection: langSave == 'ar'
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                child: Splash())),
                        ModalRoute.withName("/Home"));
                  },
                ),
              ],
            )),
      ),
    );
  }
}
