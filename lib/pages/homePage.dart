import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/CustomDropdownButton.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/Ministriesdetails.dart';
import 'package:wakel/pages/ProvideFeedback.dart';
import 'package:wakel/pages/accountBalanceTop.dart';
import 'package:wakel/pages/addCardB.dart';
import 'package:wakel/pages/addProject.dart';
import 'package:wakel/pages/awardedProject.dart';
import 'package:wakel/pages/bankTransfer.dart';
import 'package:wakel/pages/chatPage.dart';
import 'package:wakel/pages/createPayment.dart';
import 'package:wakel/pages/feedbackSuccess.dart';
import 'package:wakel/pages/freelanceProfile.dart';
import 'package:wakel/pages/notificationPage.dart';
import 'package:wakel/pages/orderConfirm.dart';
import 'package:wakel/pages/packageDetails.dart';
import 'package:wakel/pages/packageSuccess.dart';
import 'package:wakel/pages/packageTrcking.dart';
import 'package:wakel/pages/personelProfile.dart';
import 'package:wakel/pages/projectAwardcon.dart';
import 'package:wakel/pages/projectManagment.dart';
import 'package:wakel/pages/projectPage.dart';
import 'package:wakel/pages/projectPageDetails.dart';
import 'package:wakel/pages/servicesPage.dart';
import 'package:wakel/pages/socialPage.dart';

PageController controller;
int currentpage = 0;

class HomeScreen extends StatefulWidget {
  final String lang;

  HomeScreen(this.lang);

  @override
  HomeFragment createState() => new HomeFragment();
}

class HomeFragment extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _selectedDrawerIndex = 0;
  String text = 'Home';
  int _value = 1;
  String codeC;
  int _valueCity = 1;

  String codeCity;
  List<String> photo = [
    'assets/images/khho.png',
    'assets/images/book.png',
    'assets/images/grafic.png',
    'assets/images/prog.png',
    'assets/images/tar.png',
    'assets/images/jam.png',
  ];
  List<String> title = [
    AppLocalizations().lbkhho,
    AppLocalizations().lbBooks,
    AppLocalizations().lbGra,
    AppLocalizations().lbPros,
    AppLocalizations().lbTra,
    AppLocalizations().lbGh,
  ];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PageController pageController;

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
        setState(() {
          text = 'profile';
        });
        break;
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

    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
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
                                        child: Addproject()),
                                  ),
                                );
                              },
                            ),
          //  resizeToAvoidBottomPadding: false,

          //  extendBodyBehindAppBar: true,
          key: _scaffoldKey,
          floatingActionButtonLocation: widget.lang == 'ar'
              ? FloatingActionButtonLocation.startFloat
              : FloatingActionButtonLocation.endFloat,
          //  backgroundColor: HexColor.fromHex("#67523A").withOpacity(1),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: HexColor.fromHex("#4DBDEF").withOpacity(1),
            type: BottomNavigationBarType.fixed,
            currentIndex: 4,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: _onTap,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Center(
                    child: text == 'Home'
                        ? Image.asset('assets/images/hhh.png')
                        : Image.asset(
                            'assets/images/hhh.png',
                            color: Colors.white.withOpacity(0.55),
                          ),
                  ),
                  title: text == 'Home'
                      ? Text(
                          AppLocalizations().lbHome,
                          style: TextStyle(
                              fontFamily: 'Cairo-Bold',
                              color: Colors.white,
                              fontSize: 10),
                        )
                      : Text(
                          AppLocalizations().lbHome,
                          style: TextStyle(
                              fontFamily: 'Cairo-Regular',
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
                          style: TextStyle(
                              fontFamily: 'Cairo-Bold',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )
                      : Text(
                          AppLocalizations().lbSocial,
                          style: TextStyle(
                              fontFamily: 'Cairo-Regular',
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
                          style: TextStyle(
                              fontFamily: 'Cairo-Bold',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )
                      : Text(
                          AppLocalizations().lbChat,
                          style: TextStyle(
                              fontFamily: 'Cairo-Regular',
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
                          style: TextStyle(
                              fontFamily: 'Cairo-Bold',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )
                      : Text(
                          AppLocalizations().lbPro,
                          style: TextStyle(
                              fontFamily: 'Cairo-Regular',
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
                          style: TextStyle(
                              fontFamily: 'Cairo-Bold',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        )
                      : Text(
                          AppLocalizations().lbProfile,
                          style: TextStyle(
                              fontFamily: 'Cairo-Regular',
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
                                      color: HexColor.fromHex("#353E5A"),
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
                              style: TextStyle(
                                  fontFamily: 'Cairo-Black',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            )
                          : text == 'socail'
                              ? Text(
                                  AppLocalizations().lbSocLit,
                                  style: TextStyle(
                                      fontFamily: 'Cairo-Black',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black),
                                )
                              : Text(
                                  AppLocalizations().lbHomeLit,
                                  style: TextStyle(
                                      fontFamily: 'Cairo-Bold',
                                      fontSize: 20,
                                      color: Colors.black),
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
                  child: ProjectPage())
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
                              child: personelProfile(langSave))
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
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .height,
                                                      child: GridView.count(
                                                        crossAxisCount: 2,
                                                        shrinkWrap: false,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        mainAxisSpacing: 10.0,
                                                        crossAxisSpacing: 10.0,
                                                        children: List.generate(
                                                            photo.length,
                                                            (index) {
                                                          return GestureDetector(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Container(
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            10),
                                                                        child: Image
                                                                            .asset(
                                                                          photo[
                                                                              index],

                                                                          // fit: BoxFit.fill,
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            10),
                                                                        child:
                                                                            Text(
                                                                          title[
                                                                              index],
                                                                          style: TextStyle(
                                                                              fontFamily: 'Cairo-SemiBold',
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 10),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              20)),
                                                                      color: Colors
                                                                          .white)),
                                                            ),
                                                            onTap: () {
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
                                                                          miniDetails()),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }),
                                                      ),
                                                    ),
                                                    padding: EdgeInsets.all(10),
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
