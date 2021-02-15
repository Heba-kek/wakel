import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/servicesPage.dart';

class miniDetails extends StatefulWidget {
  @override
  _miniDetails createState() => new _miniDetails();
}

class _miniDetails extends State<miniDetails> {
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
          actions: [
          GestureDetector(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(35, 45, 35, 25),
                  child: Icon(
                    Icons.search,
                    color: HexColor.fromHex("#4DBDEF"),
                  )),
              onTap: () {
              //  Navigator.of(context).pop(); // close the drawer
              },
            ),

          ],
          title: Padding(padding: EdgeInsets.all(5),child: Column(
            children: [Image.asset('assets/images/zaka.png')],
          ),),
          backgroundColor:           Colors.white,
        
        ),
        body: Container(
          color: Colors.white,
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
                        padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              AppLocalizations().lbShowAll,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                  color: HexColor.fromHex("#5C5C5C"),
                                  fontSize: 16),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              border: Border.all(
                                  width: 1, color: HexColor.fromHex("#E1E1E1")),
                              color: HexColor.fromHex("#F6F6F6").withOpacity(0.55)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: Column(
                          children: [
                            GestureDetector(child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
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
                                    BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                                Text(AppLocalizations().lbZakat,
                                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12,
                                                        color: HexColor.fromHex("#4DBDEF")))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            child:Text(AppLocalizations().lbRejZakat,
                                                style: TextStyle(fontFamily: 'Cairo-Bold',
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Colors.black)),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 10),
                                          ),
                                          Padding(
                                            child:Text('3876 ' +AppLocalizations().lbProvider,
                                                style: TextStyle(fontFamily: 'Cairo-Regular',

                                                    fontSize: 12,
                                                    color: HexColor.fromHex("#858585"))),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                          )
                                        ],
                                      ),
                                    ),

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
                                        child:services()),
                                    ),
                                  );
                                },),
                            GestureDetector(child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
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
                                    BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                                Text(AppLocalizations().lbZakat,
                                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12,
                                                        color: HexColor.fromHex("#4DBDEF")))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            child:Text(AppLocalizations().lbRejZakat,
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 12,fontFamily: 'Cairo-Bold',
                                                    color: Colors.black)),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 10),
                                          ),
                                          Padding(
                                            child:Text('3876 '+AppLocalizations().lbProvider,
                                                style: TextStyle(fontFamily: 'Cairo-Regular',

                                                    fontSize: 12,
                                                    color: HexColor.fromHex("#858585"))),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                          )
                                        ],
                                      ),
                                    ),

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
                                      child:services()),
                                  ),
                                );
                              },),
                            GestureDetector(child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
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
                                    BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                                Text(AppLocalizations().lbZakat,
                                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12,
                                                        color: HexColor.fromHex("#4DBDEF")))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            child:Text(AppLocalizations().lbRejZakat,
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,fontFamily: 'Cairo-Bold',
                                                    fontSize: 12,
                                                    color: Colors.black)),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 10),
                                          ),
                                          Padding(
                                            child:Text('3876 ' + AppLocalizations().lbProvider,
                                                style: TextStyle(fontFamily: 'Cairo-Regular',

                                                    fontSize: 12,
                                                    color: HexColor.fromHex("#858585"))),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                          )
                                        ],
                                      ),
                                    ),

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
                                      child:services()),
                                  ),
                                );
                              },), GestureDetector(child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Container(
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
                                    BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding:
                                      EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                                                Text(AppLocalizations().lbZakat,
                                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12,
                                                        color: HexColor.fromHex("#4DBDEF")))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            child:Text(AppLocalizations().lbRejZakat,
                                                style: TextStyle(fontFamily: 'Cairo-Bold',
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Colors.black)),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 10),
                                          ),
                                          Padding(
                                            child:Text('3876 '+AppLocalizations().lbProvider,
                                                style: TextStyle(fontFamily: 'Cairo-Regular',

                                                    fontSize: 12,
                                                    color: HexColor.fromHex("#858585"))),
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                          )
                                        ],
                                      ),
                                    ),

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
                                      child:services()),
                                  ),
                                );
                              },),
                          ],
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
