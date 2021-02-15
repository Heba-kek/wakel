import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/CustomDropdownButton.dart';
import 'package:wakel/Extension/LocalHelper.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/chosseAcount.dart';
import 'package:wakel/pages/loginImage.dart';

class langPage extends StatefulWidget {
  @override
  _langPage createState() => new _langPage();
}

class _langPage extends State<langPage> with SingleTickerProviderStateMixin {
  double _height;
  double _width;
  int _valueCity = 1;

  String codeCity='ar';
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

  }
  @override
  void initState() {
     navigationPage();

    //startTime();
  }



  onLocaleChange(Locale locale) {
    _specificLocalizationDelegate = new SpecificLocalizationDelegate(locale);
  }

  @override
  Widget build(BuildContext contextt) {
    helper.onLocaleChanged = onLocaleChange;

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
                       // Image.asset('assets/images/wakel.png'),
                        Padding(
                          child: Text(
                           AppLocalizations().lbSelectL,
                            style: TextStyle(color: Colors.black, ),
                          ),
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                        ),
                        Padding(   padding: EdgeInsets.fromLTRB(40, 10, 40, 15),child:
                        Container(
                           // width: 225,
                            child: Padding(
                              child:
                              DropdownButtonHideUnderline(
                                child:

                                CustomDropdownButton(
                                  hint:Text(AppLocalizations().lbSelectL),
                                    value: _valueCity,
                                    items: [
                                      DropdownMenuItem(
                                        child:
                                        Row(
                                          children: [
                                           // Image.asset('assets/images/sud.png'),
                                            Padding(
                                              child: Text('العربية',
                                                  style: TextStyle(
                                                    color: HexColor.fromHex("#303030"),
                                                    fontSize: 15,
                                                  )),
                                              padding: EdgeInsets.all(5),
                                            )
                                          ],
                                        ),
                                        value:
                                        1,
                                      ),
                                      DropdownMenuItem(
                                        child:
                                        Row(
                                          children: [
                                           // Image.asset('assets/images/sud.png'),

                                            Padding(
                                              child: Text('English',
                                                  style: TextStyle(
                                                    color: HexColor.fromHex("#303030"),
                                                    fontSize: 15,
                                                  )),
                                              padding: EdgeInsets.all(5),
                                            )
                                          ],
                                        ),
                                        value:
                                        2,
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(
                                              () {
                                            _valueCity =
                                                value;
                                            if (value ==
                                                1) {
                                              codeCity = 'ar';
                                            } else {
                                              codeCity = 'en';
                                            }
                                          });
                                    })



                              ),
                              padding: EdgeInsets
                                  .fromLTRB(
                                  10,
                                  0,
                                  10,
                                  0),
                            ),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    //  offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius:
                                BorderRadius.all(Radius.circular(
                                    10)),
                                color: Colors
                                    .white)),
                        ),

                        GestureDetector(child: Padding(   padding: EdgeInsets.fromLTRB(70, 30, 70, 15),child:
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              child:
                              Text(AppLocalizations().lbSave,textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 17,color: Colors.white),),
                              padding: EdgeInsets
                                  .fromLTRB(
                                  0,
                                  20,
                                  0,
                                  20),
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  //  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF13A8E3),
                                  const Color(0xFF2CDCF8),
                                ],
                              ),
                              borderRadius:
                              BorderRadius.all(Radius.circular(
                                  30)),
                            )),
                        ),
                        onTap: () async {
print(codeCity);
if( codeCity==null){
   codeCity='ar';

}
if(codeCity=='en'){
  var preferences = await SharedPreferences.getInstance();

  AppLocalizations().locale == 'en';
  helper.onLocaleChanged(new Locale("en"));
  AppLocalizations.load(new Locale("en"));
  preferences.setString('lang', 'en');

  preferences.remove('sessionId');




  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) =>Directionality(
              textDirection:
              langSave == 'ar' ? TextDirection.rtl : TextDirection.ltr,
              child: chosseAcount('1'))
      ),
      ModalRoute.withName("/Home")
  );
}
else{
  var preferences = await SharedPreferences.getInstance();

  AppLocalizations().locale == 'ar';
  helper.onLocaleChanged(new Locale("ar"));
  AppLocalizations.load(new Locale("ar"));
  preferences.setString('lang', 'ar');



  preferences.remove('sessionId');




  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) =>Directionality(
              textDirection:
              langSave == 'ar' ? TextDirection.rtl : TextDirection.ltr,
              child: chosseAcount('1'))
      ),
      ModalRoute.withName("/Home")
  );
}
                        },)

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

                ],
              )),
        ],
      ),
    );
  }
}
