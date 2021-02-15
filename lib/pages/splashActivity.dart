import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/langPage.dart';
import 'package:wakel/pages/loginImage.dart';

class Splash extends StatefulWidget {
  @override
  _Splash createState() => new _Splash();
}

class _Splash extends State<Splash> with SingleTickerProviderStateMixin {
  double _height;
  double _width;

  double percent = 0.0;
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
    Route route = MaterialPageRoute(
        builder: (context) => Directionality(
            textDirection:
                langSave == 'ar' ? TextDirection.rtl : TextDirection.ltr,
            child: langPage()));
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  void initState() {
    // navigationPage();

    startTime();
  }

  startTime() async {
    Timer timer;
    timer = Timer.periodic(Duration(milliseconds: 50), (_) {
      print('Percent Update');
      setState(() {
        percent += 1;
        if (percent >= 100) {
          timer.cancel();
          navigationPage();
          // percent=0;
        }
      });
    });
    // var _duration = new Duration(seconds: 4);

    //return new Timer(_duration, navigationPage);
  }

  @override
  Widget build(BuildContext contextt) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/images/logon.png'),

                        Padding(
                          child: Text(
                            'خدمات حكومية معتمدة',
                            style: TextStyle(
                                color: HexColor.fromHex("#787878"),
                                fontSize: 14),
                          ),
                          padding: EdgeInsets.fromLTRB(0, 1, 0, 15),
                        ),

/*
                Container(
                  child:CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                //  backgroundColor: Colors.blue,

                )
                  ,decoration: BoxDecoration(gradient:LinearGradient(
                    colors: [
                      const Color(0xFF13A8E3),
                      const Color(0xFF2CDCF8),

                    ],
                  ),borderRadius: BorderRadius.all(Radius.circular(30.0))),)
*/
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Align(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(70.0))),
                          height: 50,
                          width: 50,
                          child: LiquidCircularProgressIndicator(
                            value: percent / 100,
                            // Defaults to 0.5.
                            valueColor: AlwaysStoppedAnimation(
                                HexColor.fromHex("#2CDCF8")),
                            //     backgroundColor: Colors.red,

                            borderColor: Colors.white,
                            borderWidth: 0.0,
                            direction: Axis.vertical,
                            center: Text(
                              percent.toString() + "%",
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          )),
                      alignment: Alignment.bottomCenter,
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
