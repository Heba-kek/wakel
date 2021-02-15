import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/bankTransfer.dart';
import 'package:wakel/pages/packageSuccess.dart';

class orderCon extends StatefulWidget {
  final String lang;
  orderCon(this.lang);
  @override
  _orderCon createState() => new _orderCon();
}

class _orderCon extends State<orderCon> {
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
  void initState() {navigationPage();}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leadingWidth: 100,
             toolbarHeight: 100,
          elevation: 0,
          centerTitle: true,
          leading:  RaisedButton(
            elevation: 0,
            color: Colors.white,
            child:widget.lang=='en'?

            Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 25),
                child: Icon(
                  Icons.arrow_back,
                  color: HexColor.fromHex("#4DBDEF"),
                )):
            Padding(
                padding: EdgeInsets.fromLTRB(40, 45, 0, 25),
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
                        AppLocalizations().lbConPay,
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
                        child: packageSuccess()),
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
                            padding: EdgeInsets.fromLTRB(40, 0, 20, 15),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations().lbPackExp,
                                      style: TextStyle(fontFamily: 'Cairo-Regular',
                                          fontSize: 15,
                                          color: HexColor.fromHex("#464646")),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 20, 0),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations().lbSerCost,
                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 14,
                                      color: HexColor.fromHex("#757575")),
                                ),
                                new Spacer(),
                                Padding(
                                  child: Text(
                                    '51.00',
                                    style: TextStyle(fontFamily: 'Cairo-Black',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                ),
                                Padding(
                                  child: Text(
                                    AppLocalizations().lbSar,
                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 15,
                                      color: HexColor.fromHex("#C2C2C2"),
                                    ),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 0),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations().lbAppFee,
                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 14,
                                      color: HexColor.fromHex("#757575")),
                                ),
                                new Spacer(),
                                Padding(
                                  child: Text(
                                    '20.00',
                                    style: TextStyle(fontFamily: 'Cairo-Black',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                ),
                                Padding(
                                  child: Text(
                                    AppLocalizations().lbSar,
                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 15,
                                      color: HexColor.fromHex("#C2C2C2"),
                                    ),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 0),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations().lbVat,
                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 14,
                                      color: HexColor.fromHex("#757575")),
                                ),
                                new Spacer(),
                                Padding(
                                  child: Text(
                                    '9.00',
                                    style: TextStyle(fontFamily: 'Cairo-Black',
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                ),
                                Padding(
                                  child: Text(
                                    AppLocalizations().lbSar,
                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 15,
                                      color: HexColor.fromHex("#C2C2C2"),
                                    ),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: Container(
                              height: 1,
                              color: HexColor.fromHex("#F9FBFC"),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 20, 10),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations().lbTotal,
                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 14,
                                      color: HexColor.fromHex("#757575")),
                                ),
                                new Spacer(),
                                Padding(
                                  child: Text(
                                    '80.00',
                                    style: TextStyle(fontFamily: 'Cairo-Black',
                                        fontSize: 22,
                                        color: HexColor.fromHex("#4DBDEF"),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                ),
                                Padding(
                                  child: Text(
                                    AppLocalizations().lbSar,
                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 15,
                                      color: HexColor.fromHex("#4DBDEF"),
                                    ),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: Container(
                              height: 1,
                              color: HexColor.fromHex("#F9FBFC"),
                              width: MediaQuery.of(context).size.width,
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
                                      style: TextStyle(fontFamily: 'Cairo-Bold',
                                          fontSize: 15,
                                          color: HexColor.fromHex("#464646")),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 20, 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/card.png'))),
                                  child: Padding(
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
                                            AppLocalizations().lbAddCard,
                                            style: TextStyle(fontFamily: 'Cairo-Bold',
                                              fontSize: 13,
                                              color:
                                                  HexColor.fromHex("#575757"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              GestureDetector(child:   Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/card.png'))),
                                child: Padding(
                                  padding:
                                  EdgeInsets.fromLTRB(15, 30, 15, 30),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/dollar.png',
                                        color: HexColor.fromHex("#A5A5A5"),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: Text(
                                          AppLocalizations().lbBankTra,
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
                                            fontSize: 13,
                                            color:
                                            HexColor.fromHex("#575757"),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
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
                                            child:bankTra()),
                                      ),
                                    );
                                  }),
                              ],
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
