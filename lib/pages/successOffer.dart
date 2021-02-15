import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/afterCreateOffer.dart';
import 'package:wakel/pages/homePage.dart';
import 'package:wakel/pages/homePageFree.dart';
import 'package:wakel/pages/packageTrcking.dart';

class offerSuccess extends StatefulWidget {
  @override
  _offerSuccess createState() => new _offerSuccess();
}

class _offerSuccess extends State<offerSuccess> {
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
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
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
                    color: HexColor.fromHex("#4DBDEF"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations().lbBackHome,
                          style: TextStyle(    fontFamily: 'Cairo-Bold',
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
                            child: HomeScreenfree(langSave)),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset('assets/images/truegreen.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          AppLocalizations().lbOffCre,
                          style: TextStyle(    fontFamily: 'Cairo-Black',
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text(
                          AppLocalizations().lbOffCreMsg,
                          textAlign: TextAlign.center,
                          style: TextStyle(    fontFamily: 'Cairo-Regular',
                              fontSize: 14, color: HexColor.fromHex("#787878")),
                        ),
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                          child: Text(
                            AppLocalizations().lbViewP,
                            textAlign: TextAlign.center,
                            style: TextStyle(    fontFamily: 'Cairo-Bold',
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: HexColor.fromHex("#4DBDEF")),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => Directionality(
                                  textDirection: langSave == 'ar'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: afterCreateOffer()),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 70),
              )
            ],
          ),
        ));
  }
}
