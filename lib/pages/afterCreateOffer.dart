import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/addOffer.dart';
import 'package:wakel/pages/afterAwardingFree.dart';
import 'package:wakel/pages/chatDetails.dart';
import 'package:wakel/pages/orderConfirm.dart';

class afterCreateOffer extends StatefulWidget {
  @override
  _afterCreateOffer createState() => new _afterCreateOffer();
}

class _afterCreateOffer extends State<afterCreateOffer> {
  List<String> photo = [
    'assets/images/imggirl.png',
    'assets/images/imggirl.png',
    'assets/images/imggirl.png',
  ];
  List<String> text = [
    AppLocalizations().lbMan,
    AppLocalizations().lbSelectBid,
    AppLocalizations().lbMan,
  ];
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
        appBar: AppBar(
          toolbarHeight: 100,
          leadingWidth: 100,
          elevation: 0,
          centerTitle: true,
          leading: RaisedButton(
            elevation: 0,
            color: Colors.white,
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
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          //  width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Padding(
                child: ListView(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/waz.png',
                                  width: 50,
                                  height: 50,
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(1, 13, 1, 3),
                                    child: Container(
                                      width: 200,
                                      child: Text(
                                        AppLocalizations().lbMiniAff,

                                        // overflow: TextOverflow.ellipsis,

                                        style: TextStyle(    fontFamily: 'Cairo-SemiBold',
                                            fontSize: 14,
                                            color: HexColor.fromHex("#787878")),
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Container(
                                    width: 1,
                                    height: 23,
                                    color: HexColor.fromHex("#CFCFCF"),
                                  ),
                                ),
                                new Spacer(),
                                Padding(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 3),
                                          child: Row(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                                  child: Text(
                                                    AppLocalizations().lbBe,
                                                    style: TextStyle(    fontFamily: 'Cairo-Regular',
                                                        color: HexColor.fromHex(
                                                            "#858585"),
                                                        fontSize: 12),
                                                  )),
                                            ],
                                          )),
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(13, 0, 5, 0),
                                          child: Text(
                                            AppLocalizations().lbdayTH,
                                            style: TextStyle(    fontFamily: 'Cairo-Bold',
                                                color: HexColor.fromHex(
                                                  "#4DBDEF",
                                                ),
                                                fontSize: 12),
                                          ))
                                    ],
                                  ),
                                  padding: EdgeInsets.all(5),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Container(
                                  child: Text(
                                    AppLocalizations().lbTRans,
                                    style: TextStyle(    fontFamily: 'Cairo-Bold',
                                      fontSize: 18,
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  langSave == 'en'
                                      ? 'But I must explain to you how all this mistaken ideai of denouncing pleasure and praising pain was boyi and I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrBut I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyixplorer of the truth, the master-builder of human hrBut I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyiand I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrppiness. No one rejects.'
                                      : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم والسلام، وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد جعل الله السلام تحية المسلم، بحيث لا ينبغي أن يتكلم الإنسان وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد تعاملاتهم في الحياة',
                                  style: TextStyle(    fontFamily: 'Cairo-Regular',
                                      fontSize: 12,
                                      color: HexColor.fromHex("#858585")),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 20, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations().lbCreateBy,
                                      style: TextStyle(    fontFamily: 'Cairo-Bold',
                                          fontSize: 15,
                                          color: HexColor.fromHex("#464646")),
                                    ),
                                    new Spacer(),
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 20, 0),
                            child: Row(
                              children: [
                                Image.asset(photo[0]),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(4, 3, 4, 3),
                                          child: Text(
                                            AppLocalizations().lbAsma,
                                            style: TextStyle(    fontFamily: 'Cairo-Regular',
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        StarRating(
                                          rating: rating,
                                          onRatingChanged: (rating) => setState(
                                              () => this.rating = rating),
                                        )
                                      ],
                                    )),
                                new Spacer(),
                                GestureDetector(
                                  child: Padding(
                                    child: Container(
                                      //   width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: EdgeInsets.all(18),
                                        child: Image.asset(
                                            'assets/images/msg.png'),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          border: Border.all(
                                              color:
                                                  HexColor.fromHex("#4DBDEF"),
                                              width: 2),
                                          color: Colors.white),
                                    ),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            Directionality(
                                                textDirection:
                                                    langSave ==
                                                            'ar'
                                                        ? TextDirection.rtl
                                                        : TextDirection.ltr,
                                                child: chatDetails(photo[0],
                                                    AppLocalizations().lbAsma)),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 15, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations().lbLatBid,
                                      style: TextStyle(    fontFamily: 'Cairo-Bold',
                                          fontSize: 15,
                                          color: HexColor.fromHex("#464646")),
                                    ),
                                    new Spacer(),
                                  ],
                                )),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            //  scrollDirection: Axis.vertical,
                            itemCount: photo.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                    child: GestureDetector(
                                      child: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            index == 0
                                                ? Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 10),
                                                    child: Container(
                                                        width: 320,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: 300,
                                                              height: 2,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    new LinearGradient(
                                                                  colors: [
                                                                    const Color(
                                                                        0xFF73AF00),
                                                                    const Color(
                                                                        0xFFFFFFFF),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          20,
                                                                          0),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                      photo[
                                                                          index]),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              3,
                                                                              10,
                                                                              3),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                4,
                                                                                3,
                                                                                4,
                                                                                3),
                                                                            child:
                                                                                Text(
                                                                              AppLocalizations().lbAsma,
                                                                              style: TextStyle(    fontFamily: 'Cairo-Regular',
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          StarRating(
                                                                            rating:
                                                                                rating,
                                                                            onRatingChanged: (rating) =>
                                                                                setState(() => this.rating = rating),
                                                                          )
                                                                        ],
                                                                      )),
                                                                  new Spacer(),
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              3,
                                                                              0,
                                                                              3),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Padding(
                                                                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '51.00 ',
                                                                                    style: TextStyle(    fontFamily: 'Cairo-Black',fontWeight: FontWeight.bold, color: HexColor.fromHex("#4DBDEF")),
                                                                                  )),
                                                                              Padding(
                                                                                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                                                                  child: Text(
                                                                                    AppLocalizations().lbSar,
                                                                                    style: TextStyle(    fontFamily: 'Cairo-Bold',color: HexColor.fromHex("#4DBDEF")),
                                                                                  ))
                                                                            ],
                                                                          )),
                                                                      Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              2,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            AppLocalizations().lbThDay,
                                                                            style: TextStyle(    fontFamily: 'Cairo-Regular',
                                                                                color: HexColor.fromHex(
                                                                                  "#4DBDEF",
                                                                                ),
                                                                                fontSize: 12),
                                                                          ))
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          20,
                                                                          5),
                                                              child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  child: Text(
                                                                    langSave ==
                                                                            'en'
                                                                        ? 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam eratvoluptua. At vero eos'
                                                                        : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم الإنسان',
                                                                    style: TextStyle(    fontFamily: 'Cairo-Regular',
                                                                        fontSize:
                                                                            12,
                                                                        color: HexColor.fromHex(
                                                                            "#858585")),
                                                                  )),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          10),
                                                              child:
                                                                  GestureDetector(
                                                                child:
                                                                    Container(
                                                                  //   width: MediaQuery.of(context).size.width,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            86,
                                                                            20,
                                                                            86,
                                                                            20),
                                                                    child: Text(
                                                                      AppLocalizations()
                                                                          .lbEditO,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(    fontFamily: 'Cairo-Bold',
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          borderRadius: BorderRadius.all(Radius.circular(
                                                                              15)),
                                                                          gradient:
                                                                              new LinearGradient(
                                                                            colors: [
                                                                              const Color(0xFFB9DC4B),
                                                                              const Color(0xFF43A325),
                                                                            ],
                                                                          ),
                                                                          color:
                                                                              Colors.white),
                                                                ),
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(
                                                                    PageRouteBuilder(
                                                                      pageBuilder: (_, __, ___) => Directionality(
                                                                          textDirection: langSave == 'ar'
                                                                              ? TextDirection.rtl
                                                                              : TextDirection.ltr,
                                                                          child: afterAwardingFree(langSave)),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: HexColor
                                                                        .fromHex(
                                                                            "#7D7D7D")
                                                                    .withOpacity(
                                                                        0.15),
                                                                spreadRadius: 0,
                                                                blurRadius: 2,

                                                                //  offset: Offset(0, 40),

                                                                // changes position of shadow
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                            color:
                                                                Colors.white)),
                                                  )
                                                : Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 10, 0, 10),
                                                    child: Container(
                                                        width: 320,
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          20,
                                                                          0),
                                                              child: Row(
                                                                children: [
                                                                  Image.asset(
                                                                      photo[
                                                                          index]),
                                                                  Padding(
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              3,
                                                                              10,
                                                                              3),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsets.fromLTRB(
                                                                                4,
                                                                                3,
                                                                                4,
                                                                                3),
                                                                            child:
                                                                                Text(
                                                                              AppLocalizations().lbAsma,
                                                                              style: TextStyle(
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          StarRating(
                                                                            rating:
                                                                                rating,
                                                                            onRatingChanged: (rating) =>
                                                                                setState(() => this.rating = rating),
                                                                          )
                                                                        ],
                                                                      )),
                                                                  new Spacer(),
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              3,
                                                                              0,
                                                                              3),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Padding(
                                                                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                                                  child: Text(
                                                                                    '51.00 ',
                                                                                    style: TextStyle(fontWeight: FontWeight.bold, color: HexColor.fromHex("#4DBDEF")),
                                                                                  )),
                                                                              Padding(
                                                                                  padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                                                                  child: Text(
                                                                                    AppLocalizations().lbSar,
                                                                                    style: TextStyle(color: HexColor.fromHex("#4DBDEF")),
                                                                                  ))
                                                                            ],
                                                                          )),
                                                                      Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              2,
                                                                              0,
                                                                              2,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            AppLocalizations().lbThDay,
                                                                            style: TextStyle(
                                                                                color: HexColor.fromHex(
                                                                                  "#4DBDEF",
                                                                                ),
                                                                                fontSize: 12),
                                                                          ))
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          20,
                                                                          10,
                                                                          20,
                                                                          5),
                                                              child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  child: Text(
                                                                    langSave ==
                                                                            'en'
                                                                        ? 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam eratvoluptua. At vero eos'
                                                                        : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم الإنسان',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: HexColor.fromHex(
                                                                            "#858585")),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                        decoration: BoxDecoration(
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: HexColor
                                                                        .fromHex(
                                                                            "#7D7D7D")
                                                                    .withOpacity(
                                                                        0.15),
                                                                spreadRadius: 0,
                                                                blurRadius: 2,
                                                                //  offset: Offset(0, 3), // changes position of shadow
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                            color:
                                                                Colors.white)),
                                                  )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        /*  Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (_, __, ___) => PackageDetails(),
                                          ),
                                        );*/
                                      },
                                    )),
                              ],
                            ),
                            padding: EdgeInsets.all(0),
                          )
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
        ));
  }
}
