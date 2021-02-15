import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/chatDetails.dart';
import 'package:wakel/pages/orderConfirm.dart';

class PackageDetails extends StatefulWidget {
  final String lang;
  PackageDetails(this.lang);
  @override
  _PackageDetails createState() => new _PackageDetails();
}

class _PackageDetails extends State<PackageDetails> {
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
          toolbarHeight: 80,
          leadingWidth: 100,
          elevation: 0,
          centerTitle: true,
          leading: RaisedButton(
            elevation: 0,
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 45, 0, 25),
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
                      AppLocalizations().lbOrderPac,
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
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>  Directionality(
                          textDirection: langSave ==
                              'ar'
                              ? TextDirection
                              .rtl
                              : TextDirection
                              .ltr,
                          child:orderCon(langSave)),
                      ),
                    );
                  },
                ),
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
                            padding: EdgeInsets.fromLTRB(25, 0, 15, 0),
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

                                        style: TextStyle(fontFamily: 'Cairo-SemiBold',
                                            fontSize: 14,
                                            color: HexColor.fromHex("#787878")),
                                      ),
                                    )),
                                new Spacer(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 13, 0, 3),
                                        child: Row(
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 0),
                                                child: Text(
                                                  AppLocalizations().lbBe,
                                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                                      color: HexColor.fromHex(
                                                          "#858585"),
                                                      fontSize: 12),
                                                )),
                                          ],
                                        )),
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(2, 0, 2, 0),
                                        child: Text(
                                          AppLocalizations().lbdayTH,
                                          style: TextStyle(fontFamily: 'Cairo-Bold',
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
                            padding: EdgeInsets.fromLTRB(40, 0, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Container(width: MediaQuery.of(context).size.width,
                                child: Text(
                                  AppLocalizations().lbTRans,
                                  style: TextStyle(fontFamily: 'Cairo-Bold',
                                    fontSize: 18,
                                  ),
                                ),)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: widget.lang=='en'?
                                Text(
                                  'But I must explain to you how all this mistaken ideai of denouncing pleasure and praising pain was boyi and I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrBut I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyixplorer of the truth, the master-builder of human hrBut I must explain to you how all this mistaken ideaiof denouncing pleasure and praising pain was boyiand I will give you a complete account of the systerm, and expound the actual teachings of the great explorer of the truth, the master-builder of human hrppiness. No one rejects.',
                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 12,
                                      color: HexColor.fromHex("#858585")),
                                ):
                                Text(
                                  'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم والسلام، وذلك يعكس تناسب المبدأ والمنهج والحكم والموضوع وقد جعل الله السلام تحية المسلم، بحيث لا ينبغي أن يتكلم الإنسان المسلم مع آخر قبل أن يبدأ بكلمة السلام، حيث قال رسولنا الكريم صلى الله عليه وسلم «السلام قبل الكلام» وسبب ذلك أن السلام أمان ولا كلام إلا بعد الأمان وهو اسم من أسماء الله الحسنى ومما لا شك فيه أن الرسول صلى الله عليه وسلم جاء سلاماً ورحمةً للبشرية ولإنقاذها وإخراجها من الظلمات الى النور حتى يصل الناس جميعاً إلى أعلى مراتب الأخلاق الإنسانية في كل تعاملاتهم في الحياة',
                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 12,
                                      color: HexColor.fromHex("#858585")),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations().lbreq,
                                      style: TextStyle(fontFamily: 'Cairo-Bold',
                                          fontSize: 15,
                                          color: HexColor.fromHex("#464646")),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 1, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: HexColor.fromHex("#4DBDEF")),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 0, 15, 0),
                                      child: Text(
                                        AppLocalizations().lbOrigId,
                                        style: TextStyle(fontFamily: 'Cairo-Regular',
                                            fontSize: 12,
                                            color: HexColor.fromHex("#858585")),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 15, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: HexColor.fromHex("#4DBDEF")),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 0, 15, 0),
                                      child: Text(
                                        AppLocalizations().lbOrigId,
                                        style: TextStyle(fontFamily: 'Cairo-Regular',
                                            fontSize: 12,
                                            color: HexColor.fromHex("#858585")),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 15, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: HexColor.fromHex("#4DBDEF")),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 0, 15, 0),
                                      child: Text(
                                        AppLocalizations().lbOrigId,
                                        style: TextStyle(fontFamily: 'Cairo-Regular',
                                            fontSize: 12,
                                            color: HexColor.fromHex("#858585")),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 5),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations().lbPross,
                                      style: TextStyle(fontFamily: 'Cairo-Bold',
                                          fontSize: 15,
                                          color: HexColor.fromHex("#464646")),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 20, 0),
                            child: Row(
                              children: [
                                Image.asset('assets/images/imggirl.png'),
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
                                            style: TextStyle(fontFamily: 'Cairo-Regular',
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
                                GestureDetector(child:  Padding(
                                  child: Container(
                                    //   width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image.asset(
                                          'assets/images/chatmsg.png'),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        border: Border.all(
                                            color: HexColor.fromHex("#4DBDEF"),
                                            width: 2),
                                        color: Colors.white),
                                  ),
                                  padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
                                ),
                                onTap: (){
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          Directionality(
                                              textDirection: langSave ==
                                                  'ar'
                                                  ? TextDirection
                                                  .rtl
                                                  : TextDirection
                                                  .ltr,
                                              child:      chatDetails('assets/images/imggirl.png',AppLocalizations().lbAsma)),

                                    ),
                                  );
                                },)

                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 20, 20, 15),
                            child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Row(
                                  children: [
                                    Text(
                                      AppLocalizations().lbExpense,
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
                              children: [
                                Text(
                                  AppLocalizations().lbSerCost,
                                  style: TextStyle(fontFamily: 'Cairo-Regular',
                                      fontSize: 14,
                                      color: HexColor.fromHex("#757575")),
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(30, 3, 10, 3),
                                    child:
                                        Image.asset('assets/images/info.png')),
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
                                Padding(
                                    padding: EdgeInsets.fromLTRB(30, 3, 10, 3),
                                    child:
                                        Image.asset('assets/images/info.png')),
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
                                Padding(
                                    padding: EdgeInsets.fromLTRB(30, 3, 10, 3),
                                    child:
                                        Image.asset('assets/images/info.png')),
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
