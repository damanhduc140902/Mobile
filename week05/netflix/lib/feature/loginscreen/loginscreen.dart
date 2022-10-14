import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imagePaths = [
  'assets/images/img1.png',
  'assets/images/img2.png',
  'assets/images/img3.png',
  'assets/images/img4.png'
];

const Color darkRed = Color.fromARGB(255, 216, 31, 38);


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
            const TextButton(
                onPressed: null,
                child: Text(
                  'PRIVACY',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            const TextButton(
                onPressed: null,
                child: Text(
                  'HELP',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            TextButton(
                onPressed: () {
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
        body: Column(children: <Widget>[
          ImageCarousel(),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20),
                    cursorColor: Colors.black,
                    cursorWidth: 1,
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                        labelText: 'Email',
                        contentPadding: EdgeInsets.symmetric(vertical: 0)),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                  decoration: BoxDecoration(
                      color: darkRed, borderRadius: BorderRadius.circular(4)),
                  child: const TextButton(
                      onPressed: null,
                      child: Center(
                        child: Text(
                          'Start A Free Plan',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      )))),
          const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Center(
                child: Text.rich(
                  TextSpan(
                      text: 'Learn more about our ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'free plan.',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                            ))
                      ]),
                ),
              ))
        ]));
  }
}

// ignore: must_be_immutable
class ImageCarousel extends StatefulWidget {
  ImageCarousel({super.key});

  var activePage = 0;

  final List<Widget> images = imagePaths
      .map((item) => Container(
            margin: const EdgeInsets.all(10),
            child: Image.file(File(item), fit: BoxFit.cover),
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

  @override
  State<ImageCarousel> createState() => ImageCarouselState();
}

class ImageCarouselState extends State<ImageCarousel> {
  void onPageChange(int index, CarouselPageChangedReason reason) {
    setState(() {
      widget.activePage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselSlider(
            items: widget.images,
            options: CarouselOptions(
                height: 550,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: onPageChange,
                scrollDirection: Axis.horizontal)),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                widget.indicators(widget.images.length, widget.activePage))
      ],
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
      body: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 200, 10, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    cursorColor: Colors.white,
                    cursorWidth: 2,
                    decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        labelText: 'Email or phone number',
                        contentPadding: EdgeInsets.symmetric(vertical: 0)),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(children: <Widget>[
                      TextFormField(
                        obscureText: true,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                        cursorColor: Colors.white,
                        cursorWidth: 2,
                        decoration: const InputDecoration(
                            labelStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                            labelText: 'Password',
                            contentPadding: EdgeInsets.symmetric(vertical: 0)),
                      ),
                    ])),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4)),
                  child: const TextButton(
                      onPressed: null,
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      )))),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextButton(
              onPressed: null,
              child: Text(
                'Need help?',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'New to Netflix? Sign up now.',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(
              'Sign-in is protected by Google reCAPTCHA to ensure you\'re not a bot.',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
