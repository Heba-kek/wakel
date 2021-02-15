import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/Ministriesdetails.dart';
import 'package:wakel/pages/homePage.dart';
import 'package:wakel/pages/homePageFree.dart';
import 'package:wakel/pages/login.dart';
import 'package:wakel/pages/notificationPage.dart';
import 'package:wakel/pages/otpPage.dart';
import 'package:wakel/pages/registerPage.dart';
import 'package:wakel/pages/signupFree.dart';

class chosseAcount extends StatefulWidget {
  final String page;

  chosseAcount(this.page);

  @override
  _chosseAcount createState() => new _chosseAcount();
}

class _chosseAcount extends State<chosseAcount> {
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
        appBar: PreferredSize(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: AppBar(
              toolbarHeight: 100,
              elevation: 0,
              centerTitle: true,
              leading: Directionality(
                textDirection: TextDirection.ltr,
                child: RaisedButton(
                  elevation: 0,
                  color: HexColor.fromHex("#FCFCFC"),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 45, 35, 25),
                      child: Icon(
                        Icons.arrow_back,
                        color: HexColor.fromHex("#4DBDEF"),
                      )),
                  onPressed: () {
                    Navigator.of(context).pop(); // close the drawer

                    print('ugcj');
                  },
                ),
              ),
              backgroundColor: HexColor.fromHex("#FCFCFC"),
            ),
          ),
          preferredSize: Size(10, 100),
        ),
        body: Container(
          color: HexColor.fromHex("#FCFCFC"),
          //  width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            child: ListView(
              children: [
                Container(
                  //  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        child: Text(
                          AppLocalizations().lbAccountType,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Cairo-Black',
                              fontSize: 18),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      ),
                      Padding(
                        child: Text(
                          AppLocalizations().lbAccountchosse,
                          style: TextStyle(
                              fontFamily: 'Cairo-SemiBold',
                              color: HexColor.fromHex("#9A9A9A"),
                              fontSize: 12),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Row(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,

                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 30, 0, 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(AppLocalizations().lbCus,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Cairo-Bold',
                                                          fontSize: 18))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              child: Container(
                                                child: Text(
                                                    AppLocalizations().lbCusDes,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontFamily:
                                                            'Cairo-Regular',
                                                        color: Colors.black
                                                            .withOpacity(
                                                                0.55))),
                                                width: 200,
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 30, 20, 30),
                                          child: Image.asset(
                                            'assets/images/freelan.png',
                                          ))
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
                              pageBuilder: (_, __, ___) => Directionality(
                                  textDirection: langSave == 'ar'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: login(langSave, '1')),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => Directionality(
                                  textDirection: langSave == 'ar'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: login(langSave, '2')),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 30, 0, 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      AppLocalizations()
                                                          .lbFreelan,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'Cairo-Bold',
                                                          fontSize: 18))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              child: Container(
                                                width: 200,
                                                child: Text(
                                                    AppLocalizations()
                                                        .lbFreeDes,
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        fontFamily:
                                                            'Cairo-Regular',
                                                        color: Colors.black
                                                            .withOpacity(
                                                                0.55))),
                                              ),
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 10, 0, 10),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 30, 20, 30),
                                          child: Image.asset(
                                              'assets/images/freelan.png'))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
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
