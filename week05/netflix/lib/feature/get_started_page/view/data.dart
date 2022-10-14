import 'package:flutter/material.dart';

class Item {
  String head;
  String description;
  String img;
  Color clr;
  Item(
      {required this.head,
        required this.description,
        required this.img,
        required this.clr});
}

class ListofItems {
  static List<Item> loadlist() {
    var l = <Item>[
      Item(
          img: 'assets/blank.png',
          clr: Colors.black,
          head: 'Unlimited \nentertainment, \none low price.',
          description: 'All of Netflix,starting at just \n \u{20B9}149'),
      Item(
          img: 'assets/download.png',
          clr: Colors.black,
          head: 'Download and\nwatch offline',
          description: 'Always have something to\nwatch offline.'),
      Item(
          img: 'assets/nocontract.png',
          clr: Colors.black,
          head: 'No annoying \ncontracts',
          description: 'Join today,cancel anytime'),
      Item(
          img: 'assets/anydevice.png',
          clr: Colors.black,
          head: 'Watch\n everywhere',
          description: 'Stream on your phone,\n tablet,laptop,TV  and more.')
    ];
    return l;
  }
}
