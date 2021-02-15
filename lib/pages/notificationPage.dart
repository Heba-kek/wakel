import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';

class notificationPAge extends StatefulWidget {
  @override
  _notificationPAge createState() => new _notificationPAge();
}

class _notificationPAge extends State<notificationPAge> {
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
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          leadingWidth: 100,
          leading: RaisedButton(
            elevation: 0,
            color: HexColor.fromHex("#FCFCFC"),
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 45, 0, 25),
                child: Icon(
                  Icons.arrow_back,
                  color: HexColor.fromHex("#4DBDEF"),
                )),
            onPressed: () {
              Navigator.of(context).pop(); // close the drawer

              print('ugcj');
            },
          ),
          title: Text(
            AppLocalizations().lbNoti,
            style: TextStyle(color: Colors.black,fontFamily: 'Cairo-Bold',),
          ),
          backgroundColor: HexColor.fromHex("#FCFCFC"),
          elevation: 0,
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
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/images/imggirl.png'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Jessica Alba ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Bold',
                                            color: HexColor.fromHex("4DBDEF"),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        AppLocalizations().lbSendMsg,style: TextStyle(fontFamily: 'Cairo-SemiBold',),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  HexColor.fromHex("#EEEEEE")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Text(
                                          'But I must explain to you how all this mistaken ideai \n of denouncing pleasure and praising pain was boyi \n and I will give you a complete account of the syster \n m, and expound the actual teachings of the great \n xplorer of the truth, the master-builder of human hr \n ppiness. No one rejects.',
                                          style: TextStyle(fontFamily: 'Cairo-Regular',

                                              fontSize: 10,
                                              color:
                                                  HexColor.fromHex("#858585")),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/images/imggirl.png'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Jessica Alba ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Bold',
                                            color: HexColor.fromHex("4DBDEF"),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        AppLocalizations().lbAccept,style: TextStyle(fontFamily: 'Cairo-SemiBold',),
                                      )
                                    ],
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Text(
                                          AppLocalizations().lbAccMsg,
                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                            color: HexColor.fromHex("#858585"),
                                            fontSize: 12,
                                          ),
                                        ),
                                        width: 250,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/images/imggirl.png'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Jessica Alba ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Bold',
                                            color: HexColor.fromHex("4DBDEF"),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        AppLocalizations().lbSendMsg,style: TextStyle(fontFamily: 'Cairo-SemiBold',),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                              HexColor.fromHex("#EEEEEE")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Text(
                                          'But I must explain to you how all this mistaken ideai \n of denouncing pleasure and praising pain was boyi \n and I will give you a complete account of the syster \n m, and expound the actual teachings of the great \n xplorer of the truth, the master-builder of human hr \n ppiness. No one rejects.',
                                          style: TextStyle(fontFamily: 'Cairo-Regular',

                                              fontSize: 10,
                                              color:
                                              HexColor.fromHex("#858585")),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/images/imggirl.png'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Jessica Alba ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Bold',
                                            color: HexColor.fromHex("4DBDEF"),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        AppLocalizations().lbAccept,style: TextStyle(fontFamily: 'Cairo-SemiBold',),
                                      )
                                    ],
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Text(
                                          AppLocalizations().lbAccMsg,
                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                            color: HexColor.fromHex("#858585"),
                                            fontSize: 12,
                                          ),
                                        ),
                                        width: 250,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/images/imggirl.png'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Jessica Alba ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Bold',
                                            color: HexColor.fromHex("4DBDEF"),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        AppLocalizations().lbSendMsg,style: TextStyle(fontFamily: 'Cairo-SemiBold',),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                              HexColor.fromHex("#EEEEEE")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Text(
                                          'But I must explain to you how all this mistaken ideai \n of denouncing pleasure and praising pain was boyi \n and I will give you a complete account of the syster \n m, and expound the actual teachings of the great \n xplorer of the truth, the master-builder of human hr \n ppiness. No one rejects.',
                                          style: TextStyle(fontFamily: 'Cairo-Regular',

                                              fontSize: 10,
                                              color:
                                              HexColor.fromHex("#858585")),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/images/imggirl.png'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Jessica Alba ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Bold',
                                            color: HexColor.fromHex("4DBDEF"),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        AppLocalizations().lbAccept,style: TextStyle(fontFamily: 'Cairo-SemiBold',),
                                      )
                                    ],
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Text(
                                          AppLocalizations().lbAccMsg,
                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                            color: HexColor.fromHex("#858585"),
                                            fontSize: 12,
                                          ),
                                        ),
                                        width: 250,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/images/imggirl.png'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Jessica Alba ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Bold',
                                            color: HexColor.fromHex("4DBDEF"),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        AppLocalizations().lbSendMsg,style: TextStyle(fontFamily: 'Cairo-SemiBold',),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                              HexColor.fromHex("#EEEEEE")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Text(
                                          'But I must explain to you how all this mistaken ideai \n of denouncing pleasure and praising pain was boyi \n and I will give you a complete account of the syster \n m, and expound the actual teachings of the great \n xplorer of the truth, the master-builder of human hr \n ppiness. No one rejects.',
                                          style: TextStyle(fontFamily: 'Cairo-Regular',

                                              fontSize: 10,
                                              color:
                                              HexColor.fromHex("#858585")),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/images/imggirl.png'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Jessica Alba ',
                                        style: TextStyle(
                                            fontFamily: 'Cairo-Bold',
                                            color: HexColor.fromHex("4DBDEF"),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        AppLocalizations().lbAccept,style: TextStyle(fontFamily: 'Cairo-SemiBold',),
                                      )
                                    ],
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Container(
                                        child: Text(
                                          AppLocalizations().lbAccMsg,
                                          style: TextStyle(fontFamily: 'Cairo-Regular',
                                            color: HexColor.fromHex("#858585"),
                                            fontSize: 12,
                                          ),
                                        ),
                                        width: 250,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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
