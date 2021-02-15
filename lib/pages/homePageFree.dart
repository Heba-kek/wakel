import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/CustomDropdownButton.dart';
import 'package:wakel/Extension/startRating.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/Ministriesdetails.dart';
import 'package:wakel/pages/ProvideFeedback.dart';
import 'package:wakel/pages/accountBalanceTop.dart';
import 'package:wakel/pages/addCardB.dart';
import 'package:wakel/pages/addPackage.dart';
import 'package:wakel/pages/addProject.dart';
import 'package:wakel/pages/awardedProject.dart';
import 'package:wakel/pages/bankTransfer.dart';
import 'package:wakel/pages/chatPage.dart';
import 'package:wakel/pages/createPayment.dart';
import 'package:wakel/pages/faqPage.dart';
import 'package:wakel/pages/feedbackSuccess.dart';
import 'package:wakel/pages/freelanceProfile.dart';
import 'package:wakel/pages/notificationPage.dart';
import 'package:wakel/pages/orderConfirm.dart';
import 'package:wakel/pages/packageDetails.dart';
import 'package:wakel/pages/packageSuccess.dart';
import 'package:wakel/pages/packageTrcking.dart';
import 'package:wakel/pages/personelProfile.dart';
import 'package:wakel/pages/profileHomeFree.dart';
import 'package:wakel/pages/profileNine.dart';
import 'package:wakel/pages/projectAwardcon.dart';
import 'package:wakel/pages/projectManagment.dart';
import 'package:wakel/pages/projectPage.dart';
import 'package:wakel/pages/projectPageDetails.dart';
import 'package:wakel/pages/projectPageFree.dart';
import 'package:wakel/pages/projectPageFreeHome.dart';
import 'package:wakel/pages/servicesPage.dart';
import 'package:wakel/pages/settingPage.dart';
import 'package:wakel/pages/socialPage.dart';
import 'package:wakel/pages/withDrawCash.dart';
import 'package:wakel/pages/withDrawals.dart';

PageController controller;
int currentpage = 0;

class HomeScreenfree extends StatefulWidget {
  final String lang;

  HomeScreenfree(this.lang);

  @override
  _HomeScreenfree createState() => new _HomeScreenfree();
}

class _HomeScreenfree extends State<HomeScreenfree>
    with SingleTickerProviderStateMixin {
  int _selectedDrawerIndex = 0;
  String text = 'Home';
  int _value = 1;
  String codeC;
  int _valueCity = 1;
  double rating = 3.5;
  String codeCity;
  String codeCIn;
  int _valueCityIn = 1;

  String codeCityIn;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget currentPage;

  var one;
  PageController pageController;

  List<Widget> pages;
  var drawerOptions = <Widget>[];

  _onTap(int index) async {
    switch (index) {
      case 0:
        setState(() {
          text = 'Home';
        });
        //  initState();

        break;
      case 1:
        setState(() {
          text = 'socail';
        });

        break;
      case 2:
        setState(() {
          text = 'chat';
        });
        //  initState();
        break;
      case 3:
        setState(() {
          text = 'project';
        });

        //   initState();
        break;
      case 4:
        setState(() {
          text = 'profile';
        });
        //  initState();
        break;
      default:
    }
  }

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
    super.initState();
    navigationPage();
    pages = new List<Widget>();

    pages = [one];
    currentPage = one;
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  void dispose() {
    super.dispose();
  }

  var hide = true;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: Scaffold(
          floatingActionButtonLocation: widget.lang == 'ar'
              ? FloatingActionButtonLocation.startFloat
              : FloatingActionButtonLocation.endFloat,
          floatingActionButton: text == 'project'
              ? Visibility(
                  visible: false,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF43A325),
                              const Color(0xFFB9DC4B),
                            ],
                          ),
                          color: HexColor.fromHex("#F6F6F6")),
                      child: Padding(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                      )),
                )
              : text == 'chat'
                  ? Visibility(
                      visible: false,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF43A325),
                                  const Color(0xFFB9DC4B),
                                ],
                              ),
                              color: HexColor.fromHex("#F6F6F6")),
                          child: Padding(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(10),
                          )),
                    )
                  : text == 'socail'
                      ? Visibility(
                          visible: false,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xFF43A325),
                                      const Color(0xFFB9DC4B),
                                    ],
                                  ),
                                  color: HexColor.fromHex("#F6F6F6")),
                              child: Padding(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.all(10),
                              )),
                        )
                      : text == 'profile'
                          ? Visibility(
                              visible: false,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      gradient: LinearGradient(
                                        colors: [
                                          const Color(0xFF43A325),
                                          const Color(0xFFB9DC4B),
                                        ],
                                      ),
                                      color: HexColor.fromHex("#F6F6F6")),
                                  child: Padding(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(10),
                                  )),
                            )
                          : GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    gradient: LinearGradient(
                                      colors: [
                                        const Color(0xFF43A325),
                                        const Color(0xFFB9DC4B),
                                      ],
                                    ),
                                    color: HexColor.fromHex("#F6F6F6")),
                                child: Padding(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => Directionality(
                                        textDirection: langSave == 'ar'
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                        child: addPAckage()),
                                  ),
                                );
                              },
                            ),
          //  resizeToAvoidBottomPadding: false,

          //  extendBodyBehindAppBar: true,
          key: _scaffoldKey,

          //  backgroundColor: HexColor.fromHex("#67523A").withOpacity(1),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: HexColor.fromHex("#4DBDEF").withOpacity(1),
            type: BottomNavigationBarType.fixed,
            currentIndex: 0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: _onTap,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Center(
                    child: text == 'Home'
                        ? Image.asset('assets/images/home.png')
                        : Image.asset(
                            'assets/images/home.png',
                            color: Colors.white.withOpacity(0.55),
                          ),
                  ),
                  title: text == 'Home'
                      ? Text(
                          AppLocalizations().lbHome,
                          style: TextStyle(
                              fontFamily: 'Cairo-Bold',
                              color: Colors.white, fontSize: 10),
                        )
                      : Text(
                          AppLocalizations().lbHome,
                          style: TextStyle(                              fontFamily: 'Cairo-Regular',

                              color: Colors.white.withOpacity(0.55),
                              fontSize: 10),
                        )),
              BottomNavigationBarItem(
                  icon: text == 'socail'
                      ? Image.asset(
                          'assets/images/scoc.png',
                        )
                      : Image.asset(
                          'assets/images/scoc.png',
                          color: Colors.white.withOpacity(0.55),
                        ),
                  title: text == 'socail'
                      ? Text(
                          AppLocalizations().lbSocial,
                          style: TextStyle(                              fontFamily: 'Cairo-Bold',

                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )
                      : Text(
                          AppLocalizations().lbSocial,
                          style: TextStyle(                              fontFamily: 'Cairo-Regular',

                              color: Colors.white.withOpacity(0.55),
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )),
              BottomNavigationBarItem(
                  icon: text == 'chat'
                      ? Image.asset(
                          'assets/images/chat.png',
                        )
                      : Image.asset(
                          'assets/images/chat.png',
                          color: Colors.white.withOpacity(0.55),
                        ),
                  title: text == 'chat'
                      ? Text(
                          AppLocalizations().lbChat,
                          style: TextStyle(                              fontFamily: 'Cairo-Bold',

                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )
                      : Text(
                          AppLocalizations().lbChat,
                          style: TextStyle(                              fontFamily: 'Cairo-Regular',

                              color: Colors.white.withOpacity(0.55),
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )),
              BottomNavigationBarItem(
                  icon: text == 'project'
                      ? Image.asset(
                          'assets/images/project.png',
                        )
                      : Image.asset(
                          'assets/images/project.png',
                          color: Colors.white.withOpacity(0.55),
                        ),
                  title: text == 'project'
                      ? Text(
                          AppLocalizations().lbPro,
                          style: TextStyle(                              fontFamily: 'Cairo-bold',

                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )
                      : Text(
                          AppLocalizations().lbPro,
                          style: TextStyle(                              fontFamily: 'Cairo-Regular',

                              color: Colors.white.withOpacity(0.55),
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )),
              BottomNavigationBarItem(
                  icon: text == 'profile'
                      ? Image.asset(
                          'assets/images/pro.png',
                        )
                      : Image.asset(
                          'assets/images/pro.png',
                          color: Colors.white.withOpacity(0.55),
                        ),
                  title: text == 'profile'
                      ? Text(
                          AppLocalizations().lbProfile,
                          style: TextStyle(                              fontFamily: 'Cairo-Bold',

                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )
                      : Text(
                          AppLocalizations().lbProfile,
                          style: TextStyle(                              fontFamily: 'Cairo-Regular',

                              color: Colors.white.withOpacity(0.55),
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )),
            ],
            //    onTap: _onTap,
          ),
          appBar: text != 'profile'
              ? AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  toolbarHeight: 115,
                  leading: text == 'profile'
                      ? Container()
                      : GestureDetector(
                          child: Padding(
                            padding: widget.lang == 'ar'
                                ? EdgeInsets.fromLTRB(0, 0, 30, 0)
                                : EdgeInsets.fromLTRB(30, 0, 0, 0),
                            child: Container(
                              child: Image.asset('assets/images/noti.png'),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => Directionality(
                                    textDirection: langSave == 'ar'
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                                    child: notificationPAge()),
                              ),
                            );
                          },
                        ),
                  elevation: 0,

                  //  centerTitle: true,  automaticallyImplyLeading: false,
                  actions: <Widget>[
                    text == 'project'
                        ? Visibility(
                            visible: false,
                            child: GestureDetector(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                  child: Icon(
                                    Icons.search,
                                    color: HexColor.fromHex("#353E5A"),
                                  ),
                                ),
                              ),
                              onTap: () {},
                            ),
                          )
                        : text == 'socail'
                            ? GestureDetector(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(35, 37, 35, 37),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: HexColor.fromHex("#4DBDEF")),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: () {},
                              )
                            : GestureDetector(
                                child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(35, 15, 35, 25),
                                    child: Icon(
                                      Icons.search,
                                      color: HexColor.fromHex("#4DBDEF"),
                                    )),
                                onTap: () {
                                  Navigator.of(context)
                                      .pop(); // close the drawer
                                },
                              ),
                  ],
                  title: text == 'project'
                      ? Text(
                          AppLocalizations().lbProLit,
                          style: TextStyle(
                              fontFamily: 'Cairo-Black',

                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        )
                      : text == 'chat'
                          ? Text(
                              AppLocalizations().lbChatLit,
                              style: TextStyle(fontFamily: 'Cairo-Black',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            )
                          : text == 'socail'
                              ? Text(
                                  AppLocalizations().lbSocLit,
                                  style: TextStyle(
                                      fontFamily: 'Cairo-Black', fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                )
                              : Text(
                                  AppLocalizations().lbLAtPro,
                                  style: TextStyle(
                                      fontFamily: 'Cairo-Black',     fontSize: 20, color: Colors.black),
                                ),
                  // backgroundColor: HexColor.fromHex("#3C7DBA").withOpacity(1),
                  backgroundColor: HexColor.fromHex("#FCFCFC"),
                )
              : PreferredSize(
                  child: Container(),
                  preferredSize: Size(0.0, 0.0),
                ),

          body: text == 'project'
              ? Directionality(
                  textDirection:
                      langSave == 'ar' ? TextDirection.rtl : TextDirection.ltr,
                  child: ProjectPageHomeFree())
              : text == 'chat'
                  ? Directionality(
                      textDirection: langSave == 'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: chatPage())
                  : text == 'socail'
                      ? Directionality(
                          textDirection: langSave == 'ar'
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: socailPage())
                      : text == 'profile'
                          ? Directionality(
                              textDirection: langSave == 'ar'
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                              child: FreeProfileHome())
                          : Container(
                              color: HexColor.fromHex("#FCFCFC"),
                              //  width: MediaQuery.of(context).size.width,
                              //  height: MediaQuery.of(context).size.height,
                              child: Padding(
                                child: ListView(
                                  children: [
                                    Container(
                                      //  height: MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          Container(
                                              //  height: MediaQuery.of(context).size.height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              30, 0, 30, 0),
                                                      child: Container(
                                                          // width: 225,
                                                          child: Padding(
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child:
                                                                  CustomDropdownButton(
                                                                      value:
                                                                          _valueCityIn,
                                                                      hint: Text(
                                                                          AppLocalizations()
                                                                              .lbAllIn),
                                                                      items: [
                                                                        DropdownMenuItem(
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Padding(
                                                                                child: Text(AppLocalizations().lbAllIn,
                                                                                    style: TextStyle(
                                                                                      fontFamily: 'Cairo-Regular',
                                                                                      color: HexColor.fromHex("#303030").withOpacity(0.41),
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
                                                                              Padding(
                                                                                child: Text(AppLocalizations().lbAllIn,
                                                                                    style: TextStyle(fontFamily: 'Cairo-Regular',
                                                                                      color: HexColor.fromHex("#303030").withOpacity(0.41),
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
                                                                      onChanged:
                                                                          (value) {
                                                                        setState(
                                                                            () {
                                                                          _valueCityIn =
                                                                              value;
                                                                          if (value ==
                                                                              1) {
                                                                            codeCityIn =
                                                                                AppLocalizations().lbAllIn;
                                                                          } else {
                                                                            codeCityIn =
                                                                                AppLocalizations().lbAllIn;
                                                                          }
                                                                        });
                                                                      }),
                                                            ),
                                                            padding: EdgeInsets
                                                                .fromLTRB(10, 0,
                                                                    20, 0),
                                                          ),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              10)),
                                                              color: Colors
                                                                  .white))),
                                                  Padding(
                                                    child: Container(
                                                      child: ListView.builder(
                                                        shrinkWrap: true,
                                                        //  scrollDirection: Axis.vertical,
                                                        itemCount: 4,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (BuildContext
                                                                        context,
                                                                    int index) =>
                                                                Column(
                                                          children: [
                                                            Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    GestureDetector(
                                                                  child:
                                                                      Container(
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsets.fromLTRB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              10),
                                                                          child: Container(
                                                                              width: 330,
                                                                              child: Column(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Image.asset(
                                                                                          'assets/images/imggirl.png',
                                                                                          width: 50,
                                                                                          height: 50,
                                                                                        ),
                                                                                        Padding(
                                                                                            padding: EdgeInsets.fromLTRB(1, 13, 1, 3),
                                                                                            child: Container(
                                                                                                width: 130,
                                                                                                child: Column(
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      AppLocalizations().lbAsma,

                                                                                                      // overflow: TextOverflow.ellipsis,

                                                                                                      style: TextStyle(fontFamily: 'Cairo-Regular',fontSize: 14, color: HexColor.fromHex("#787878")),
                                                                                                    ),
                                                                                                    StarRating(
                                                                                                      rating: 4.0,
                                                                                                      onRatingChanged: (rating) => setState(() => this.rating = rating),
                                                                                                    )
                                                                                                  ],
                                                                                                ))),
                                                                                        new Spacer(),
                                                                                        Column(
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                                padding: EdgeInsets.fromLTRB(5, 10, 5, 3),
                                                                                                child: Row(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                                                                                        child: Text(
                                                                                                          AppLocalizations().lbBe,
                                                                                                          style: TextStyle(fontFamily: 'Cairo-Regular',color: HexColor.fromHex("#858585"), fontSize: 12),
                                                                                                        )),
                                                                                                  ],
                                                                                                )),
                                                                                            Padding(
                                                                                                padding: EdgeInsets.fromLTRB(13, 0, 5, 0),
                                                                                                child: Text(
                                                                                                  AppLocalizations().lbdayTH,
                                                                                                  style: TextStyle(
                                                                                                      fontFamily: 'Cairo-Bold',
                                                                                                      color: HexColor.fromHex(
                                                                                                        "#4DBDEF",
                                                                                                      ),
                                                                                                      fontSize: 12),
                                                                                                ))
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.fromLTRB(22, 10, 22, 0),
                                                                                    child: Padding(
                                                                                        padding: EdgeInsets.all(0),
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width,
                                                                                          child: Text(
                                                                                            AppLocalizations().lbTRans,
                                                                                            style: TextStyle(
                                                                                              fontFamily: 'Cairo-Bold',
                                                                                              fontSize: 18,
                                                                                            ),
                                                                                          ),
                                                                                        )),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.fromLTRB(22, 1, 22, 15),
                                                                                    child: Padding(
                                                                                        padding: EdgeInsets.all(0),
                                                                                        child: Text(
                                                                                          langSave == 'en' ? 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam eratvoluptua. At vero eos' : 'الإسلام والسلام يجتمعان في توفير السكينة والطمأنينة ولا غرابة في أن كلمة الاسلام تجمع نفس حروف السلم ينبغي أن يتكلم الإنسان',
                                                                                          style: TextStyle(fontFamily: 'Cairo-Regular',fontSize: 12, color: HexColor.fromHex("#858585")),
                                                                                        )),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              decoration: BoxDecoration(boxShadow: [
                                                                                BoxShadow(
                                                                                  color: HexColor.fromHex("#7D7D7D").withOpacity(0.15),
                                                                                  spreadRadius: 0,
                                                                                  blurRadius: 2,
                                                                                  //  offset: Offset(0, 3), // changes position of shadow
                                                                                ),
                                                                              ], borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white)),
                                                                        )
                                                                      ],
                                                                    ),
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
                                                                            child: projectPageFree()),
                                                                      ),
                                                                    );
                                                                  },
                                                                )),
                                                          ],
                                                        ),
                                                        padding:
                                                            EdgeInsets.all(0),
                                                      ),
                                                    ),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 0, 0, 10),
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                  shrinkWrap: true,
                                ),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              ),
                            ),
        ),
        onWillPop: () {
          SystemNavigator.pop();
        });
  }
}
