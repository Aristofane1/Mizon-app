
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/mainScreen.dart';

class ChatBotController extends GetxController {
  final List<Widget>_items = [
    // const MessageLoader(),
    const BotText1(),
    const BotText2(),
    const BotText3(),
    const BotText4(),
    const BotText6(),
    // const BotText7(),
    // const BotText8(),
    // const BotText9(),
    // const BotText10(),
    // const BotText11(),
    // const BotText12(),
    // const BotText13(),
    // const BotText14(),
    // const BotText15(),
    // const BotText17(),
    // const BotText18()
  ];

  List<Widget> get items => _items;
  void addItem(Widget item) {
    print("add");
    _items.add(item);
    print(_items);
    update();
  }

  void removeItem() {
    _items.removeLast();
    print(_items);
    update();
  }
}