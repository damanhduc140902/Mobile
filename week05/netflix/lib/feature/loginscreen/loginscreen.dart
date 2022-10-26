import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:netflix_clone/feature/tabbar/view/app_tabbar_view.dart';

final List<String> imagePaths = [
  'assets/images/img1.png',
  'assets/images/img2.png',
  'assets/images/img3.png',
  'assets/images/img4.png'
];
final Uri netflixPrivacyUrl = Uri.parse(
    'https://help.netflix.com/legal/privacy?netflixsource=android&fromApp=true');
final Uri googlePrivacyUrl = Uri.parse('https://policies.google.com/privacy');
final Uri googleTermsUrl = Uri.parse('https://policies.google.com/terms');
final Uri helpCenterUrl =
    Uri.parse('https://help.netflix.com/en?fromApp=true&netflixsource=android');
final Uri requestsUrl = Uri.parse(
    'https://help.netflix.com/en/titlerequest?netflixsource=android&fromApp=true');
final Uri errorsUrl = Uri.parse(
    'https://help.netflix.com/en/troubleshooting?fromApp=true&netflixsource=android');
final Uri netflixTermsUrl = Uri.parse(
    'https://help.netflix.com/legal/termsofuse?netflixsource=android&fromApp=true');
final Uri netflixChatUrl = Uri.parse(
    'https://help.netflix.com/en/interface/chat?mobile=true&netflixsource=android');

const Color darkRed = Color.fromARGB(255, 216, 31, 38);
const Color milkyWhite = Color.fromARGB(255, 255, 254, 247);
const Color darkGrey = Color.fromARGB(255, 73, 73, 73);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  final emailController = TextEditingController();
  bool submitted = false;
  bool validated = false;

  String validation(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    } else if (value.length < 5 || value.length > 50) {
      return 'Email should be between 5 and 50 characters';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    } else {
      return 'Validated';
    }
  }

  Future<void> launchPrivacyUrl() async {
    if (!await launchUrl(netflixPrivacyUrl)) {
      throw 'Could not launch $netflixPrivacyUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Image(
            image: AssetImage('assets/images/netflixlogo.png'),
          ),
          actions: <Widget>[
            TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.black)),
                onPressed: launchPrivacyUrl,
                child: const Text(
                  'PRIVACY',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HelpScreen())));
                },
                child: const Text(
                  'HELP',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        ),
        body: SingleChildScrollView(
            reverse: true,
            child: Column(children: <Widget>[
              const ImageCarousel(),
              Stack(
                children: <Widget>[
                  Padding(
                      padding: submitted && !validated
                          ? const EdgeInsets.fromLTRB(10, 75, 0, 15)
                          : const EdgeInsets.all(0),
                      child: submitted && !validated
                          ? Text(
                              validation(emailController.text),
                              style: const TextStyle(color: Colors.orange),
                            )
                          : null),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: submitted && !validated
                                ? [
                                    const BoxShadow(
                                        color: Colors.orange,
                                        offset: Offset(0, 3))
                                  ]
                                : null,
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        height: 60,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextFormField(
                      onChanged: (_) => setState(() {
                        if (validation(emailController.text) == 'Validated') {
                          validated = true;
                        } else {
                          validated = false;
                        }
                      }),
                      controller: emailController,
                      style: const TextStyle(fontSize: 20),
                      cursorColor: Colors.black,
                      cursorWidth: 1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Container(
                      decoration: BoxDecoration(
                          color: darkRed,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(darkRed)),
                          onPressed: () {
                            if (validated) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen(
                                            email: emailController.text,
                                          )));
                            }
                            setState(() {
                              submitted = true;
                            });
                          },
                          child: const Center(
                            child: Text(
                              'Start A Free Plan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          )))),
              Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                          text: 'Learn more about our ',
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showModalBottomSheet<void>(
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15))),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 270,
                                            child: Stack(children: <Widget>[
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          340, 0, 0, 10),
                                                  child: IconButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      icon: const Icon(
                                                          Icons.close))),
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    15, 50, 0, 0),
                                                child: Text(
                                                    'How does a free plan work?',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      15, 90, 0, 0),
                                                  child: Text(
                                                    'Join Netflix to watch a selection of films and TV programmes - absolutely free!',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    50, 150, 0, 0),
                                                child: Text(
                                                  'Available only on Android phones running version 8.0 of the app or above.',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    50, 210, 0, 0),
                                                child: Text(
                                                  'Includes a limited selection of films and TV programmes',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    15, 150, 0, 0),
                                                child: Icon(
                                                  Icons.phone_android_sharp,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              const Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      15, 210, 0, 0),
                                                  child: Icon(
                                                    Icons.lock_sharp,
                                                    color: Colors.red,
                                                  ))
                                            ]),
                                          );
                                        });
                                  },
                                text: 'free plan',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                )),
                            const TextSpan(
                                text: '.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ))
            ])));
  }
}

// ignore: must_be_immutable
class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => ImageCarouselState();
}

class ImageCarouselState extends State<ImageCarousel> {
  var activePage = 0;

  final List<Widget> images = imagePaths
      .map((item) => Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(item), fit: BoxFit.fitWidth)),
          ))
      .toList();

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.grey,
            shape: BoxShape.circle),
      );
    });
  }

  void onPageChange(int index, CarouselPageChangedReason reason) {
    setState(() {
      activePage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
            items: images,
            options: CarouselOptions(
                height: 530,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: onPageChange,
                scrollDirection: Axis.horizontal)),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage))
      ],
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  bool visible = true;
  bool passFocused = false;
  bool emailFocused = false;
  bool learnt = false;
  final FocusNode passNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  void handlePassFocusChange() {
    if (passNode.hasFocus != passFocused) {
      setState(() {
        passFocused = passNode.hasFocus;
      });
    }
  }

  void handleAccountFocusChange() {
    if (emailNode.hasFocus != emailFocused) {
      setState(() {
        emailFocused = emailNode.hasFocus;
      });
    }
  }

  Future<void> launchGooglePrivacyUrl() async {
    if (!await launchUrl(googlePrivacyUrl)) {
      throw 'Could not launch $googlePrivacyUrl';
    }
  }

  Future<void> launchGoogleTermsUrl() async {
    if (!await launchUrl(googleTermsUrl)) {
      throw 'Could not launch $googleTermsUrl';
    }
  }

  @override
  void initState() {
    super.initState();
    passNode.addListener(handlePassFocusChange);
    emailNode.addListener(handleAccountFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    passNode.removeListener(handlePassFocusChange);
    emailNode.removeListener(handleAccountFocusChange);
    passNode.dispose();
    emailNode.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: const Image(
            image: AssetImage('assets/images/netflixbanner.png'),
            height: 60,
          ),
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: emailFocused
                                  ? Colors.grey.withOpacity(0.5)
                                  : Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5)))),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 210, 30, 0),
                    child: TextFormField(
                        controller: emailController,
                        focusNode: emailNode,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                        cursorColor: Colors.white,
                        cursorWidth: 2,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color:
                                    emailFocused ? Colors.white : Colors.grey),
                            border: InputBorder.none,
                            labelText: 'Email or phone number',
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0))),
                  )
                ],
              ),
              Stack(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              color: passFocused
                                  ? Colors.grey.withOpacity(0.5)
                                  : Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5)))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                      child: TextFormField(
                        controller: passController,
                        focusNode: passNode,
                        obscureText: visible,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                        cursorColor: Colors.white,
                        cursorWidth: 2,
                        decoration: InputDecoration(
                            suffix: Text.rich(TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    setState(() {
                                      visible = !visible;
                                    });
                                  },
                                text: visible ? 'SHOW' : 'HIDE',
                                style: const TextStyle(color: Colors.grey))),
                            labelStyle: TextStyle(
                                color:
                                    passFocused ? Colors.white : Colors.grey),
                            border: InputBorder.none,
                            labelText: 'Password',
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0)),
                      ))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            emailController.clear();
                            passController.clear();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppTabBar()));
                          },
                          child: Center(
                            child: Text(
                              'Sign In',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )))),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HelpScreen()));
                  },
                  child: const Text(
                    'Need help?',
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'New to Netflix? Sign up now.',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'Sign-in is protected by Google reCAPTCHA to ensure you\'re not a bot.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text.rich(TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          learnt = true;
                        });
                      },
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                    text: learnt ? '' : 'Learn more.')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: learnt
                    ? Text.rich(
                        TextSpan(
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                            text:
                                'The information collected by Google reCAPTCHA is subject to the Google \n',
                            children: <TextSpan>[
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launchGooglePrivacyUrl();
                                    },
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  text: 'Privacy Policy'),
                              const TextSpan(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  text: ' and '),
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launchGoogleTermsUrl();
                                    },
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  text: 'Terms of Service'),
                              const TextSpan(
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  text:
                                      ', and is used for providing, maintaining and improving the reCAPTCHA service and for general security purposes (it is not used for personalised advertising by Google).')
                            ]),
                        textAlign: TextAlign.center,
                      )
                    : null,
              )
            ],
          ),
        ));
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.email});

  final String email;

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final FocusNode emailNode = FocusNode();
  final FocusNode passNode = FocusNode();
  bool emailFocused = false;
  bool passFocused = true;
  bool specialOffers = false;
  bool over18 = false;

  @override
  void initState() {
    super.initState();
    emailNode.addListener(handleEmailFocusChange);
    passNode.addListener(handlePassFocusChange);
    emailController.value = TextEditingValue(
        text: widget.email,
        selection: TextSelection.fromPosition(
            TextPosition(offset: widget.email.length)));
  }

  @override
  void dispose() {
    super.dispose();
    emailNode.removeListener(handleEmailFocusChange);
    passNode.removeListener(handlePassFocusChange);
    emailNode.dispose();
    passNode.dispose();
    emailController.dispose();
    passController.dispose();
  }

  void handleEmailFocusChange() {
    if (emailNode.hasFocus != emailFocused) {
      setState(() {
        emailFocused = emailNode.hasFocus;
      });
    }
  }

  void handlePassFocusChange() {
    if (passNode.hasFocus != passFocused) {
      setState(() {
        passFocused = passNode.hasFocus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Image(
            image: AssetImage('assets/images/netflixlogo.png'),
          ),
          actions: <Widget>[
            TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HelpScreen()));
                },
                child: const Text(
                  'HELP',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()));
                },
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 150, 0, 10),
              child: Center(
                child: Text(
                  'Enter a password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: Center(
                child: Text(
                  'Create a free account to start watching.',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            color: emailFocused
                                ? Colors.white
                                : Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5)))),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                  child: TextFormField(
                      focusNode: emailNode,
                      controller: emailController,
                      style: TextStyle(
                          fontSize: 20,
                          color: emailFocused
                              ? Colors.black
                              : Colors.white.withOpacity(0.8)),
                      cursorColor: Colors.grey,
                      cursorWidth: 2,
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          labelText: 'Email',
                          contentPadding: EdgeInsets.symmetric(vertical: 0))),
                )
              ],
            ),
            Stack(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            color: passFocused
                                ? Colors.white
                                : Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5)))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: TextFormField(
                      autofocus: true,
                      focusNode: passNode,
                      controller: passController,
                      obscureText: true,
                      style: TextStyle(
                          fontSize: 20,
                          color: passFocused
                              ? Colors.black
                              : Colors.white.withOpacity(0.8)),
                      cursorColor: Colors.grey,
                      cursorWidth: 2,
                      decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          labelText: 'Password',
                          contentPadding: EdgeInsets.symmetric(vertical: 0)),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ListTile(
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.only(left: 10),
                leading: Checkbox(
                    checkColor: Colors.black,
                    fillColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return Colors.white;
                    }),
                    value: specialOffers,
                    onChanged: (bool? value) {
                      setState(() {
                        specialOffers = value!;
                      });
                    }),
                title: const Text(
                  'Please do not email me Netflix special offers.',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Divider(
                thickness: 1.5,
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              child: Text.rich(TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                  text: 'By clicking below, you agree to our ',
                  children: <TextSpan>[
                    TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2),
                        text: 'Terms of Use'),
                    const TextSpan(
                        text: ', ',
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2),
                        text: 'Privacy Statement'),
                    const TextSpan(
                        text: ', and that you are over 18.',
                        style: TextStyle(color: Colors.white, fontSize: 17))
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListTile(
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.only(left: 10),
                leading: Checkbox(
                    checkColor: Colors.black,
                    fillColor: MaterialStateProperty.resolveWith(
                        (Set<MaterialState> states) {
                      return Colors.white;
                    }),
                    value: over18,
                    onChanged: (bool? value) {
                      setState(() {
                        over18 = value!;
                      });
                    }),
                title: const Text.rich(TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: '(required)',
                          style: TextStyle(color: Colors.orange, fontSize: 17))
                    ],
                    text: 'I agree that I am over 18 ',
                    style: TextStyle(color: Colors.white, fontSize: 17))),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Container(
                    decoration: BoxDecoration(
                        color: darkRed, borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(darkRed)),
                        onPressed: null,
                        child: const Center(
                          child: Text(
                            'CONTINUE',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ))))
          ]),
        ));
  }
}

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => HelpScreenState();
}

class HelpScreenState extends State<HelpScreen> {
  Future<void> launchPrivacyUrl() async {
    if (!await launchUrl(netflixPrivacyUrl)) {
      throw 'Could not launch $netflixPrivacyUrl';
    }
  }

  Future<void> launchHelpCenterUrl() async {
    if (!await launchUrl(helpCenterUrl)) {
      throw 'Could not launch $helpCenterUrl';
    }
  }

  Future<void> launchRequestsUrl() async {
    if (!await launchUrl(requestsUrl)) {
      throw 'Could not launch $requestsUrl';
    }
  }

  Future<void> launchErrorsUrl() async {
    if (!await launchUrl(errorsUrl)) {
      throw 'Could not launch $errorsUrl';
    }
  }

  Future<void> launchNetflixTermsUrl() async {
    if (!await launchUrl(netflixTermsUrl)) {
      throw 'Could not launch $netflixTermsUrl';
    }
  }

  Future<void> launchNetflixChatUrl() async {
    if (!await launchUrl(netflixChatUrl)) {
      throw 'Could not launch $netflixChatUrl';
    }
  }

  Future<void> chatPopup() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: darkGrey,
            title: const Text(
              'Connect with a live support agent.',
              style:
                  TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
            ),
            actions: <Widget>[
              TextButton(
                  style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.white),
                  )),
              TextButton(
                  style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () {
                    launchNetflixChatUrl();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'CHAT NOW',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: milkyWhite,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: milkyWhite,
        leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: const Image(
          image: AssetImage('assets/images/netflixbanner.png'),
          height: 60,
        ),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                child: Text(
                  'Find Help Online',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
            child: ListTile(
              onTap: launchHelpCenterUrl,
              horizontalTitleGap: 0,
              shape: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 0.5),
                  top: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 0.5)),
              iconColor: Colors.blueAccent,
              textColor: Colors.blueAccent,
              leading: const Icon(Icons.login_sharp),
              title: const Text(
                'Help Centre',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ListTile(
              onTap: launchRequestsUrl,
              horizontalTitleGap: 0,
              shape: Border(
                bottom:
                    BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
              ),
              iconColor: Colors.blueAccent,
              textColor: Colors.blueAccent,
              leading: const Icon(Icons.print_sharp),
              title:
                  const Text('Request a title', style: TextStyle(fontSize: 15)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ListTile(
              onTap: launchErrorsUrl,
              horizontalTitleGap: 0,
              shape: Border(
                bottom:
                    BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
              ),
              iconColor: Colors.blueAccent,
              textColor: Colors.blueAccent,
              leading: const Icon(Icons.auto_fix_high_sharp),
              title: const Text('Fix a connection problem',
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: ListTile(
                onTap: launchPrivacyUrl,
                horizontalTitleGap: 0,
                shape: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 0.5),
                ),
                iconColor: Colors.blueAccent,
                textColor: Colors.blueAccent,
                leading: const Icon(Icons.privacy_tip_sharp),
                title: const Text('Privacy', style: TextStyle(fontSize: 15)),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ListTile(
              onTap: launchNetflixTermsUrl,
              horizontalTitleGap: 0,
              shape: Border(
                bottom:
                    BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.5),
              ),
              iconColor: Colors.blueAccent,
              textColor: Colors.blueAccent,
              leading: const Icon(Icons.receipt_long_sharp),
              title: const Text('Terms Of Use', style: TextStyle(fontSize: 15)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Center(
              child: Text(
                'Contact',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Center(
              child: Text(
                'Netflix Customer Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Center(
              child: Text(
                'We\'ll connect the call for free using your internet connection.',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: ElevatedButton.icon(
              onPressed: chatPopup,
              icon: const Icon(Icons.message_sharp),
              label: const Text(
                'CHAT',
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(120, 50),
                  backgroundColor: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: ElevatedButton.icon(
              onPressed: null,
              icon: const Icon(Icons.phone),
              label: const Text('CALL', style: TextStyle(fontSize: 17)),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(120, 50),
                  backgroundColor: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}