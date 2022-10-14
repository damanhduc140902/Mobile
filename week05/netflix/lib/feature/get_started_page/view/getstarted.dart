import 'package:flutter/material.dart';
import 'package:netflix_clone/feature/tabbar/view/app_tabbar_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Getstarted extends StatefulWidget {
  const Getstarted({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GetstartedState createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  final controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Image(
                          fit: BoxFit.cover,
                          height: h,
                          width: w,
                          image: const AssetImage('assets/images/blank.png')),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(.9),
                                  Colors.black.withOpacity(.83),
                                  const Color.fromARGB(0, 14, 3, 3),
                                  Colors.black,
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                      ),
                      SafeArea(
                        child: Row(
                          children: <Widget>[
                            Image(
                              width: w / 8,
                              image: const AssetImage('assets/images/netflixlogo1.png'),
                            ),
                            SizedBox(
                              width: w / 2.2,
                            ),
                            Text(
                              'PRIVACY  ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              ' SIGN IN',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          height: 600,
                          child: PageView(
                            controller: controller,
                            children: const <Widget>[
                              Image(
                                image: AssetImage('assets/images/img1.png'),
                              ),
                              Image(
                                image: AssetImage('assets/images/img2.png'),
                              ),
                              Image(
                                image: AssetImage('assets/images/img3.png'),
                              ),
                              Image(
                                image: AssetImage('assets/images/img4.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: h / 1.25,
                        left: w / 2.7,
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 4,
                          effect: const ScaleEffect(
                              dotColor: Colors.grey,
                              activeDotColor: Colors.white),
                        ),
                      ),
                      Positioned(
                        top: h / 1.15,
                        left: w / 30,
                        child: Container(
                          width: w / 1.08,
                          height: h * 0.07,
                          color: const Color.fromARGB(255, 229, 9, 20),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>  AppTabBar()));
                            },
                            child: Center(
                              child: Text(
                                'GET STARTED',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                    ]))
              ]),
        ),
      ),
    );
  }
}