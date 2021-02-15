/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakel/Extension/ColorExtension.dart';
import 'package:wakel/Extension/mycheckBox.dart';
import 'package:wakel/lang/localss.dart';
import 'package:wakel/pages/chosseAcount.dart';
import 'package:wakel/pages/homePage.dart';
import 'package:wakel/pages/login.dart';
import 'package:wakel/pages/otpPage.dart';
import 'package:wakel/pages/registerPage.dart';
import 'package:wakel/pages/signupFree.dart';

List<String> photo = [
  'assets/images/profile.png',
  'assets/images/profile.png',
  'assets/images/profile.png',
];

class loginImage extends StatefulWidget {
  final String lang;
  final String free;

  loginImage(this.lang,this.free);

  @override
  _loginImage createState() => new _loginImage();
}

class _loginImage extends State<loginImage> {
  final _pass = TextEditingController();
  int _current = 0;
  bool _valueMobile = false;
  ScrollController _controller;

  final List<Widget> imageSliders = photo
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, width: 2000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Text(
                            'No. ${photo.indexOf(item)} image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        //you can do anything here
      });
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
    navigationPage();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          //  width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            child: ListView(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        child: Text(
                          AppLocalizations().lbWelcom,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
                      ),
                      Padding(
                        child: Text(
                          AppLocalizations().lbWelmsg,
                          style: TextStyle(
                              color: HexColor.fromHex("#9A9A9A"),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 0),
                          child: CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 150,
                                aspectRatio: 16 / 9,
                                // viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                //  aspectRatio: 2.0,
                                enlargeCenterPage: true,
                                scrollPhysics: PageScrollPhysics(),
                                //enlargeCenterPage: true,
                                viewportFraction: 0.3,
                                //initialPage: 0,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                // enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                                scrollDirection: Axis.horizontal,
                              ),
                              itemCount: photo.length,
                              itemBuilder: (ctx, int index) {
                                return Transform.scale(
                                  scale: index == _current ? 1.5 : 0.5,
                                  child: index == _current
                                      ? Container(
                                          //   height: 100,
                                          // width: 300,
                                          child: Center(
                                            child: Image.asset(
                                              photo[index],
                                            ),
                                          ),
                                        )
                                      : Stack(
                                          children: [
                                            Container(
                                              //   height: 100,
                                              // width: 300,
                                              child: Center(
                                                child: Image.asset(
                                                  photo[index],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Center(
                                                  child: Image.asset(
                                                photo[index],
                                                color: Color(0x39000000),
                                              )),
                                            )
                                          ],
                                        ),
                                );
                              })),
                      Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                child: Icon(
                                  Icons.lock,
                                  color: HexColor.fromHex("#4DBDEF"),
                                ),
                              ),
                              Text(
                                AppLocalizations().lbPass,
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          )),
                      widget.lang == 'en'
                          ? Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                              child: TextField(
                                controller: _pass,
                                // textAlign: TextAlign.right,
                                //  controller: _title,
                                cursorColor: Colors.transparent,
                                //  maxLines: 10,
                                obscureText: true,

                                // cursorColor: HexColor.fromHex("#1F598E"),
                                style: TextStyle(
                                    color: HexColor.fromHex("#BCBCBC"),
                                    fontSize: 25),
                                decoration: InputDecoration(
                                  //  filled: true,
                                  alignLabelWithHint: true,

                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              Directionality(
                                                  textDirection:
                                                      langSave == 'ar'
                                                          ? TextDirection.rtl
                                                          : TextDirection.ltr,
                                                  child: otpPage(widget.free)),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      child: Container(
                                          child: Icon(
                                            Icons.arrow_forward_sharp,
                                            color: Colors.white,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(70.0)),
                                              gradient: new LinearGradient(
                                                colors: [
                                                  const Color(0xFF2CDCF8),
                                                  const Color(0xFF13A8E3),
                                                ],
                                              ))),
                                      padding: EdgeInsets.all(5),
                                    ),
                                  ),
                                  //  filled: true,

                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor.fromHex("#DFDFDF")),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor.fromHex("#DFDFDF")),
                                  ),
                                  fillColor: Colors.transparent,
                                  hintText: AppLocalizations().lbPass,
                                  hintStyle: TextStyle(
                                    color: HexColor.fromHex("#BCBCBC"),
                                    fontSize: 16,
                                  ),
                                  //can also add icon to the end of the textfiled
                                  //  suffixIcon: Icon(Icons.remove_red_eye),
                                ),
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                              child: TextField(
                                controller: _pass,
                                // textAlign: TextAlign.right,
                                //  controller: _title,
                                cursorColor: Colors.transparent,
                                //  maxLines: 10,
                                obscureText: true,

                                // cursorColor: HexColor.fromHex("#1F598E"),
                                style: TextStyle(
                                    color: HexColor.fromHex("#BCBCBC"),
                                    fontSize: 25),
                                decoration: InputDecoration(
                                  //  filled: true,
                                  alignLabelWithHint: true,

                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              Directionality(
                                                  textDirection:
                                                      langSave == 'ar'
                                                          ? TextDirection.rtl
                                                          : TextDirection.ltr,
                                                  child: otpPage(widget.free)),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      child: Container(
                                          child: Image.asset(
                                            'assets/images/back.png',
                                            width: 7,
                                            height: 8,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(70.0)),
                                              gradient: new LinearGradient(
                                                colors: [
                                                  const Color(0xFF13A8E3),
                                                  const Color(0xFF2CDCF8),
                                                ],
                                              ))),
                                      padding: EdgeInsets.all(4),
                                    ),
                                  ),
                                  //  filled: true,

                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor.fromHex("#DFDFDF")),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: HexColor.fromHex("#DFDFDF")),
                                  ),
                                  fillColor: Colors.transparent,
                                  hintText: AppLocalizations().lbPass,
                                  hintStyle: TextStyle(
                                    color: HexColor.fromHex("#BCBCBC"),
                                    fontSize: 16,
                                  ),
                                  //can also add icon to the end of the textfiled
                                  //  suffixIcon: Icon(Icons.remove_red_eye),
                                ),
                              ),
                            ),
                      Padding(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: MyCheckbox(
                                uncheckedFillColor: HexColor.fromHex("#C4C4C4"),
                                checkedFillColor: HexColor.fromHex("#C4C4C4"),
                                value: _valueMobile,
                                onChanged: (value) =>
                                    setState(() => _valueMobile = value),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  AppLocalizations().lbSaveA,
                                  style: TextStyle(
                                      color: HexColor.fromHex("#1F598E"),
                                      fontSize: 14),
                                )),
                            new Spacer(),
                            Image.asset('assets/images/question.png'),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(
                                  AppLocalizations().lbForget,
                                  style: TextStyle(
                                      color: HexColor.fromHex("#1F598E"),
                                      fontSize: 13),
                                )),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                      ),
                      Padding(
                        child: Text(AppLocalizations().lbOr),
                        padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
                      ),
                      Padding(
                        child: Text(
                          AppLocalizations().lbLogVia,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                      ),
                      Padding(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child:
                                    Image.asset('assets/images/facebook.png')),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Image.asset('assets/images/google.png')),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Image.asset('assets/images/twi.png')),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Image.asset('assets/images/insta.png')),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      ),
                      Padding(
                        child: Text(AppLocalizations().lbNewU),
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      ),
                      GestureDetector(
                        onTap: () {
                          if(widget.free=='1') {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    Directionality(
                                        textDirection: langSave == 'ar'
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                        child: registerPage()),
                              ),
                            );
                          }else{
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    Directionality(
                                        textDirection: langSave == 'ar'
                                            ? TextDirection.rtl
                                            : TextDirection.ltr,
                                        child: registerPageFree()),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          child: Text(
                            AppLocalizations().lbCreateA,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: HexColor.fromHex("#4DBDEF")),
                          ),
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                        ),
                      ),
                      GestureDetector(
                        child: Padding(
                          child: Text(
                            AppLocalizations().lbSkip,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: HexColor.fromHex("#B7B7B7")),
                          ),
                          padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
                        ),
                        onTap: () {
                         */
/* Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => Directionality(
                                  textDirection: langSave == 'ar'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: login(widget.lang)),
                            ),
                          );*//*

                        },
                      ),
                      Padding(
                        child: Container(
                          child: Divider(
                            color: HexColor.fromHex("#B7B7B7"),
                            height: 1,
                          ),
                          width: 50,
                        ),
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
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
*/
