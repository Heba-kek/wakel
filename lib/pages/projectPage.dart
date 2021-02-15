import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/projectPageDetails.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPage createState() => new _ProjectPage();
}

class _ProjectPage extends State<ProjectPage> {
  List<String> photo = [
    'assets/images/imggirl.png',
    'assets/images/imggirl.png',
    'assets/images/imggirl.png',
  ];
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
    return new Container(
      //  width: MediaQuery.of(context).size.width,
      color: HexColor.fromHex("#FCFCFC"),

      height: MediaQuery.of(context).size.height,
      child: Padding(
        child: ListView(
          children: [
            Container(
              // height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                      child: Padding(
                    padding: EdgeInsets.all(0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      //  scrollDirection: Axis.vertical,
                      itemCount: photo.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) => Column(
                        children: [
                         GestureDetector(child:  Padding(
                             padding: EdgeInsets.all(0),
                             child: Container(
                               child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Padding(
                                     padding:
                                     EdgeInsets.fromLTRB(0, 0, 0, 10),
                                     child: Container(
                                         width: MediaQuery.of(context)
                                             .size
                                             .width /
                                             1.1,
                                         child: Column(
                                           children: [
                                             Padding(
                                               padding: EdgeInsets.fromLTRB(
                                                   20, 10, 20, 5),
                                               child: Row(
                                                 children: [
                                                   Image.asset(photo[index]),
                                                   Padding(
                                                       padding:
                                                       EdgeInsets.all(10),
                                                       child: Text(
                                                         AppLocalizations().lbAsma,
                                                         style: TextStyle(fontFamily: 'Cairo-Regular',
                                                             fontSize: 12,
                                                             fontWeight:
                                                             FontWeight
                                                                 .bold),
                                                       )),
                                                   new Spacer(),
                                                   Padding(
                                                       padding:
                                                       EdgeInsets.fromLTRB(
                                                           2, 0, 2, 0),
                                                       child: Text(
                                                         '51.00 ',
                                                         style: TextStyle(fontFamily: 'Cairo-Black',
                                                             fontWeight:
                                                             FontWeight
                                                                 .bold,
                                                             color: HexColor
                                                                 .fromHex(
                                                                 "#4DBDEF")),
                                                       )),
                                                   Padding(
                                                       padding:
                                                       EdgeInsets.fromLTRB(
                                                           2, 0, 2, 0),
                                                       child: Text(
                                                         AppLocalizations().lbSar,
                                                         style: TextStyle(fontFamily: 'Cairo-Bold',
                                                             color: HexColor
                                                                 .fromHex(
                                                                 "#4DBDEF")),
                                                       ))
                                                 ],
                                               ),
                                             ),

                                             Padding(
                                               padding: EdgeInsets.fromLTRB(
                                                   20, 0, 20, 0),
                                               child: Padding(
                                                   padding: EdgeInsets.all(0),
                                                   child: Container(
                                                     width: MediaQuery.of(context).size.width,
                                                     child: Text(
                                                       AppLocalizations().lbTRans,
                                                       style: TextStyle(fontFamily: 'Cairo-Bold',
                                                         fontSize: 16,
                                                         fontWeight:
                                                         FontWeight.bold,
                                                       ),
                                                     ),)),
                                             ),
                                             index == 0
                                                 ? Padding(
                                               padding:
                                               EdgeInsets.fromLTRB(
                                                   20, 5, 20, 5),
                                               child: Padding(
                                                   padding:
                                                   EdgeInsets.all(0),
                                                   child: Row(
                                                     children: [
                                                       Text(
                                                         AppLocalizations().lbOnPro,
                                                         style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                             fontSize:
                                                             12,
                                                             color: HexColor
                                                                 .fromHex(
                                                                 "#E7981C")),
                                                       )
                                                     ],
                                                   )),
                                             )
                                                 : index == 1
                                                 ? Padding(
                                               padding: EdgeInsets.fromLTRB(20, 5, 20, 5),

                                               child: Padding(
                                                   padding:
                                                   EdgeInsets
                                                       .all(0),
                                                   child: Row(
                                                     children: [
                                                       Text(
                                                         AppLocalizations().lbCancelPro,
                                                         style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                             fontSize:
                                                             12,
                                                             color: HexColor.fromHex(
                                                                 "#EF4D4D")),
                                                       )
                                                     ],
                                                   )),
                                             )
                                                 : Padding(
                                               padding: EdgeInsets
                                                   .fromLTRB(20, 5,
                                                   20, 5),
                                               child: Padding(
                                                   padding:
                                                   EdgeInsets
                                                       .all(0),
                                                   child: Row(
                                                     children: [
                                                       Text(
                                                         AppLocalizations().lbComp,
                                                         style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                             fontSize:
                                                             12,
                                                             color: HexColor.fromHex(
                                                                 "#43A325")),
                                                       )
                                                     ],
                                                   )),
                                             ),
                                             Padding(
                                               padding: EdgeInsets.fromLTRB(
                                                   15, 0, 15, 10),
                                               child: Row(
                                                 children: [
                                                   Image.asset(
                                                     'assets/images/waz.png',
                                                     width: 38,
                                                   ),
                                                   Padding(
                                                       padding:
                                                       EdgeInsets.fromLTRB(
                                                           5, 10, 5, 10),
                                                       child: Text(
                                                         AppLocalizations().lbMiniAff,
                                                         style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                                             fontSize: 12,
                                                             color: HexColor
                                                                 .fromHex(
                                                                 "#6E6E6E")),
                                                       )),
                                                 ],
                                               ),
                                             ),
                                           ],
                                         ),
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius.all(
                                                 Radius.circular(20)),
                                             color: Colors.white)),
                                   )
                                 ],
                               ),
                             )),onTap: (){
                           Navigator.of(
                               context)
                               .push(
                             PageRouteBuilder(
                               pageBuilder: (_, __, ___) => Directionality(
                                   textDirection: langSave ==
                                       'ar'
                                       ? TextDirection
                                       .rtl
                                       : TextDirection
                                       .ltr,
                                   child:
                                   projectPageDetails()),
                             ),
                           );
                         },),
                        ],
                      ),
                      padding: EdgeInsets.all(0),
                    ),
                  )),
                ],
              ),
            )
          ],
          shrinkWrap: true,
        ),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      ),
    );
  }
}
