import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/ProvideFeedback.dart';
import 'package:wakel/pages/addCardB.dart';
import 'package:wakel/pages/packageSuccess.dart';
import 'package:wakel/pages/paymentSuccess.dart';

class createPayment extends StatefulWidget {
  @override
  _createPayment createState() => new _createPayment();
}

class _createPayment extends State<createPayment> {
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
  void initState() {navigationPage();}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: 100,
          elevation: 0,
          centerTitle: true,
          leading:  RaisedButton(
            elevation: 0,
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 25),
                child: Icon(
                  Icons.arrow_back,
                  color: HexColor.fromHex("#4DBDEF"),
                )),
            onPressed: (){
              Navigator.of(context).pop(); // close the drawer

              print('ugcj');
            },),

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
                child: GestureDetector(child: Container(
                  height: 70,
                  color: HexColor.fromHex("#4DBDEF"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations().lbSha,
                        style: TextStyle(                                fontFamily: 'Cairo-Bold',

                          fontSize: 18,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                  onTap: (){
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => Directionality(
                          textDirection: langSave ==
                              'ar'
                              ? TextDirection
                              .rtl
                              : TextDirection
                              .ltr,
                          child:paymentSuccess()),
                      ),
                    );
                  },),
              ),
              Padding(
                child: ListView(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                    AppLocalizations().lbCurrentB,
                                  style: TextStyle(
                                      fontSize: 15,                                fontFamily: 'Cairo-SemiBold',

                                      color: HexColor.fromHex("#464646")),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '8271',
                                  style: TextStyle(                                fontFamily: 'Cairo-Regular',

                                      fontSize: 50,fontWeight: FontWeight.bold,
                                      color: HexColor.fromHex("#464646")),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                    AppLocalizations().lbSar,
                                  style: TextStyle(                                fontFamily: 'Cairo-SemiBold',

                                      fontSize: 20,
                                      color: HexColor.fromHex("#4DBDEF")),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 13, 20, 25),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                            'assets/images/doll.png',color: HexColor.fromHex("#4DBDEF"),),
                                      ),

                                    ),
                                    Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(0, 22, 0, 20),
                                        child: Row(

                                          children: [
                                            Text(
                                              AppLocalizations().lbPayA,
                                              style: TextStyle(                                fontFamily: 'Cairo-Bold',

                                                  color: HexColor.fromHex("#303030").withOpacity(0.41),
                                                  fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(40, 22, 10, 20),
                                        child: Container(
                                          child: Text(
                                            '- - - - - - -',
                                            style: TextStyle(
                                                color: HexColor.fromHex("#303030"),
                                                fontSize: 14),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    new Spacer(),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/images/cal.png',color: HexColor.fromHex("#4DBDEF"),),
                                    )
                                  ],
                                ),
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
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 10),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Text(
                                       AppLocalizations().lbPayMeth,
                                      style: TextStyle(                                fontFamily: 'Cairo-Bold',

                                          fontSize: 15,
                                          color: HexColor.fromHex("#464646")),
                                    )
                                  ],
                                )),
                          ),

                          GestureDetector(child: Padding(
                            padding: EdgeInsets.fromLTRB(40, 20, 30, 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child:  Padding(
                                padding:
                                EdgeInsets.fromLTRB(15, 30, 15, 30),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: HexColor.fromHex("#A5A5A5"),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      child: Text(
                                        AppLocalizations().lbAddNC,
                                        style: TextStyle(                                fontFamily: 'Cairo-SemiBold',

                                          fontSize: 13,
                                          color:
                                          HexColor.fromHex("#575757"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/card.png'),fit: BoxFit.fill),
                                borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>  Directionality(
                                    textDirection: langSave ==
                                        'ar'
                                        ? TextDirection
                                        .rtl
                                        : TextDirection
                                        .ltr,
                                    child:addCardB()),
                              ),
                            );
                          },),
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 13, 20, 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                            'assets/images/visa.png'),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white),
                                    ),
                                    Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(10, 0, 10, 20),
                                        child: Container(
                                          child: Text(
                                            '.... .... ....',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(10, 15, 10, 20),
                                        child: Container(
                                          child: Text(
                                            '1233',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    new Spacer(),
                                    Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(10, 15, 10, 20),
                                        child: Container(
                                          child: Image.asset(
                                              'assets/images/check.png'),
                                        ))
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  color: HexColor.fromHex("#252936")),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 13, 20, 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                            'assets/images/visa.png'),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white),
                                    ),
                                    Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(10, 0, 10, 20),
                                        child: Container(
                                          child: Text(
                                            '.... .... ....',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(10, 15, 10, 20),
                                        child: Container(
                                          child: Text(
                                            '1233',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),

                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  color: HexColor.fromHex("#252936")),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 13, 20, 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                            'assets/images/paypal.png'),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: Colors.white),
                                    ),
                                    Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(10, 20, 10, 20),
                                        child: Container(
                                          child: Text(
                                            'Mist_4227@yahoo.com',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),

                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  color: HexColor.fromHex("#252936")),
                            ),
                          )
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
