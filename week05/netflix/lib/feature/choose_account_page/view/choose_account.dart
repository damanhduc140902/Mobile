import 'package:flutter/material.dart';

class Chooseaccount extends StatefulWidget {
  @override
  _ChooseaccountState createState() => _ChooseaccountState();
}
class _ChooseaccountState extends State<Chooseaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 500.0,
              child: Row(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(bottom: 400.0,left: 170.0),
                    child: Image.asset("assets/images/logo.png")
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 400.0,left:130.0,),
                  child: Icon(Icons.edit,color: Colors.white,size:20.0,),
                ),
              ],
            ),
            ),

          ),
        ],
      ),
    );
  }
}