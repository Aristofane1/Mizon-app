import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mizon/controllers/chatBotController.dart';
import 'package:mizon/screens/background.dart';
import 'package:mizon/screens/home2Screen.dart';

import 'customDrawer.dart';
import 'messageLoader.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    ChatBotController chatbotController = Get.put(ChatBotController());
    return Scaffold(
      drawer: const CustomDrawer(),
      onEndDrawerChanged: (isOpened) {
        setState(() {
          _isDrawerOpen = isOpened;
        });
      },
      appBar: AppBar(
        backgroundColor: const Color(0xff3D3D56),
        leading: Builder(builder: (context) {
          return InkWell(
            child: Center(
              child: Image.asset(
                "assets/images/fi-sr-grid.png",
                height: 25,
                width: 25,
              ),
            ),
            onTap: () {
              // setState(() {
              //   _isDrawerOpen = !_isDrawerOpen;
              // });
              !_isDrawerOpen
                  ? Scaffold.of(context).openDrawer()
                  : Scaffold.of(context).closeDrawer();
            },
          );
        }),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/car.png",
              height: 25,
              width: 25,
            ),
            const SizedBox(
              width: 8,
            ),
            Text("Transport",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
        centerTitle: true,
      ),
      body: Background(
        content: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Column(
              children: [
                // Row(
                //   children: [
                //     IconButton(
                //         onPressed: null,
                //         icon: Image.asset("assets/images/fi-sr-grid.png", height: 25,width: 25,)),
                //         const Spacer(),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Image.asset("assets/images/car.png", height: 25,width: 25,),
                //         const SizedBox(width: 8,),
                //         Text("Transport",
                //             textAlign: TextAlign.center,
                //             style: GoogleFonts.montserrat(
                //               fontSize: 20,
                //               fontWeight: FontWeight.w600,
                //             )),
                //       ],
                //     ),const Spacer()
                //   ],
                // ),
                Expanded(
                    child: GetBuilder<ChatBotController>(
                        builder: (newController) => SingleChildScrollView(
                              reverse: true,
                              child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: newController.items.length,
                                  itemBuilder: (context, index) =>
                                      newController.items[index]),
                            ))),
                ListTile(
                    leading: const Card(
                      child: Icon(Icons.keyboard_arrow_up),
                    ),
                    trailing: const Icon(Icons.add_circle_outlined),
                    // expandedAlignment: Alignment.topCenter,
                    title: const Text(
                      "Cliquez pour lancer une requete",
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24))),
                        builder: (context) => SingleChildScrollView(
                              // controller: scrollController,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 12, left: 14, right: 14),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 6,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                    ),
                                    ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: botRequest.length,
                                        itemBuilder: (context, index) =>
                                            BotRequestMessage(
                                              message: botRequest[index][0],
                                              tap: botRequest[index][1],
                                            )),
                                  ],
                                ),
                              ),
                            ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BotRequestMessage extends StatelessWidget {
  final String message;
  final void Function() tap;
  const BotRequestMessage({Key? key, required this.message, required this.tap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            softWrap: true,
          ),
          Image.asset(
            "assets/images/load-button.png",
            height: 25,
            width: 25,
          )
        ],
      ),
    );
  }
}

class BotText18 extends StatelessWidget {
  const BotText18({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotMessage(
      message: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Voici tes statistiques  de transport avec Mizon"),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/bi_car-front-fill.svg",
                height: 15,
                width: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "2  trajets en Covoiturage",
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff25253F),
                      border: Border.all(color: Colors.white, width: 0.5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/ecolo.png"),
                      const FittedBox(
                          child: Text(
                        "28,6 Kg\nde CO2 évités",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff25253F),
                      border: Border.all(color: Colors.white, width: 0.5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/parcouru.png"),
                      const FittedBox(
                          child: Text(
                        "350km\nParcouru",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xff25253F),
                      border: Border.all(color: Colors.white, width: 0.5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/gains.png"),
                      const FittedBox(
                          child: Text(
                        "3500 FCFA\néconomisé",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BotText17 extends StatelessWidget {
  const BotText17({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotMessage(
      message: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Nous avons trouvé 33 propositions de trajets pour vous"),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/bi_car-front-fill.svg",
                height: 15,
                width: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "2  trajets en Covoiturage",
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home2Screen()));
            },
            child: Container(
              // height: 30,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff25253F),
                  border: Border.all(color: Colors.white, width: 0.5)),
              child: const FittedBox(
                  child: Text(
                "Voir les propositions sur le tabeau de bord\npour faire un choix ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class BotText15 extends StatelessWidget {
  const BotText15({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotMessage(
      message: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "Cool 👍. veux tu partager ton trajet  ou  tu es à la recherche d’un moyen de déplacement ?"),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      Get.find<ChatBotController>()
                          .addItem(const MessageLoader());
                      Future.delayed(const Duration(seconds: 2), () {
                        Get.find<ChatBotController>().removeItem();
                        // chatbotController
                        //   .removeItem('MessageLoader');
                        Get.find<ChatBotController>()
                            .addItem(const BotText17());
                      });
                    },
                    child: Container(
                      // height: 30,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff6D6D88),
                          border: Border.all(color: Colors.white, width: 0.5)),
                      child: FittedBox(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                                text: "Je suis  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10),
                                children: [
                                  TextSpan(
                                      text: "Passager ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Color(0xff00AFCD))),
                                  TextSpan(
                                      text:
                                          "et je veux un\nmoyen de  déplacement",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10))
                                ])),
                      ),
                    ),
                  )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    // height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff25253F),
                        border: Border.all(color: Colors.white, width: 0.5)),
                    child: FittedBox(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: "Je suis",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10),
                              children: [
                                TextSpan(
                                    text: " Conducteur ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Color(0xff4B5185))),
                                TextSpan(
                                    text: "et je  veux\npartager mon trajet  ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10))
                              ])),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class BotText14 extends StatefulWidget {
  const BotText14({
    Key? key,
  }) : super(key: key);

  @override
  State<BotText14> createState() => _BotText14State();
}

class _BotText14State extends State<BotText14> {
  int selectedHours = 0;
  int selectedMin = 0;
  late final FixedExtentScrollController _fixedControllerHours =
      FixedExtentScrollController();
  late final FixedExtentScrollController _fixedControllerMin =
      FixedExtentScrollController();
  @override
  void initState() {
    super.initState();
    _fixedControllerHours.jumpToItem(DateTime.now().hour);
    _fixedControllerMin.jumpToItem(DateTime.now().minute);
  }

  @override
  Widget build(BuildContext context) {
    return BotMessage(
      message: Column(
        children: [
          const Text(
            "Quelle heure de Départ ?",
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("$selectedHours h : $selectedMin min"),
                          Image.asset(
                            "assets/images/fi-sr-time-oclock.png",
                            height: 20,
                            width: 20,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: const Color(0xff5A6279),
                                    // border: Border.all(color: Colors.white, width: 0.5),
                                    borderRadius: BorderRadius.circular(12)),
                                child: ListWheelScrollView.useDelegate(
                                    controller: _fixedControllerHours,
                                    itemExtent: 50,
                                    diameterRatio: 0.5,
                                    perspective: 0.001,
                                    // offAxisFraction: 0.4,s
                                    overAndUnderCenterOpacity: 0.5,
                                    physics: const FixedExtentScrollPhysics(),
                                    onSelectedItemChanged: (value) {
                                      setState(() {
                                        selectedHours =
                                            int.parse("$value".padLeft(2, '0'));
                                      });
                                      print(selectedHours);
                                    },
                                    childDelegate:
                                        ListWheelChildBuilderDelegate(
                                      childCount: 24,
                                      builder: (context, index) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (selectedHours == index)
                                            const Divider(
                                              color: Colors.white,
                                            ),
                                          Center(
                                              child: Text(
                                            "$index".padLeft(2, '0'),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                          if (selectedHours == index)
                                            const Divider(
                                              color: Colors.white,
                                            ),
                                        ],
                                      ),
                                    ))),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: const Color(0xff5A6279),
                                    // border: Border.all(color: Colors.white, width: 0.5),
                                    borderRadius: BorderRadius.circular(12)),
                                child: ListWheelScrollView.useDelegate(
                                    controller: _fixedControllerMin,
                                    itemExtent: 50,
                                    diameterRatio: 0.5,
                                    perspective: 0.001,
                                    // offAxisFraction: 0.4,
                                    overAndUnderCenterOpacity: 0.5,
                                    physics: const FixedExtentScrollPhysics(),
                                    onSelectedItemChanged: (value) {
                                      setState(() {
                                        selectedMin =
                                            int.parse("$value".padLeft(2, '0'));
                                      });
                                      print(selectedMin);
                                    },
                                    childDelegate:
                                        ListWheelChildBuilderDelegate(
                                      childCount: 60,
                                      builder: (context, index) => Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (selectedMin == index)
                                              const Divider(
                                                color: Colors.white,
                                              ),
                                            Center(
                                                child: Text(
                                              "$index".padLeft(2, '0'),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            if (selectedMin == index)
                                              const Divider(
                                                color: Colors.white,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {
                  Get.find<ChatBotController>().addItem(const MessageLoader());
                  Future.delayed(const Duration(seconds: 2), () {
                    Get.find<ChatBotController>().removeItem();
                    // chatbotController
                    //   .removeItem('MessageLoader');
                    Get.find<ChatBotController>().addItem(const BotText15());
                  });
                },
                child: const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BotText13 extends StatefulWidget {
  const BotText13({
    Key? key,
  }) : super(key: key);

  @override
  State<BotText13> createState() => _BotText13State();
}

class _BotText13State extends State<BotText13> {
  int selectedDay = 0;
  int selectedMonth = 0;
  late final FixedExtentScrollController _fixedControllerMonth =
      FixedExtentScrollController();
  late final FixedExtentScrollController _fixedControllerDay =
      FixedExtentScrollController();
  @override
  void initState() {
    super.initState();
    _fixedControllerMonth.jumpToItem(DateTime.now().month);
    _fixedControllerDay.jumpToItem(DateTime.now().day);
  }

  @override
  Widget build(BuildContext context) {
    return BotMessage(
      message: Column(
        children: [
          const Text("Quand est ce que tu prends départ ?"),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "$selectedDay ${months[selectedMonth]} ${DateTime.now().year}"),
                          Image.asset(
                            "assets/images/fi-sr-calendar.png",
                            height: 20,
                            width: 20,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: const Color(0xff5A6279),
                                    // border: Border.all(color: Colors.white, width: 0.5),
                                    borderRadius: BorderRadius.circular(12)),
                                child: ListWheelScrollView.useDelegate(
                                    controller: _fixedControllerMonth,
                                    itemExtent: 50,
                                    diameterRatio: 0.5,
                                    perspective: 0.001,
                                    // offAxisFraction: 0.4,s
                                    overAndUnderCenterOpacity: 0.5,
                                    physics: const FixedExtentScrollPhysics(),
                                    onSelectedItemChanged: (value) {
                                      setState(() {
                                        selectedMonth = value;
                                      });
                                      print(selectedMonth);
                                    },
                                    childDelegate:
                                        ListWheelChildBuilderDelegate(
                                      childCount: months.length,
                                      builder: (context, index) => Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (selectedMonth == index)
                                              const Divider(
                                                color: Colors.white,
                                              ),
                                            Center(
                                                child: Text(
                                              "${months[index].capitalize}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            if (selectedMonth == index)
                                              const Divider(
                                                color: Colors.white,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ))),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: const Color(0xff5A6279),
                                    // border: Border.all(color: Colors.white, width: 0.5),
                                    borderRadius: BorderRadius.circular(12)),
                                child: ListWheelScrollView.useDelegate(
                                    controller: _fixedControllerDay,
                                    itemExtent: 50,
                                    diameterRatio: 0.5,
                                    perspective: 0.001,
                                    // offAxisFraction: 0.4,
                                    overAndUnderCenterOpacity: 0.5,
                                    physics: const FixedExtentScrollPhysics(),
                                    onSelectedItemChanged: (value) {
                                      setState(() {
                                        selectedDay = int.parse(
                                            "${value + 1}".padLeft(2, '0'));
                                      });
                                      print(selectedDay);
                                    },
                                    childDelegate:
                                        ListWheelChildBuilderDelegate(
                                      childCount: daysInMonth(selectedMonth),
                                      builder: (context, index) => Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (selectedDay == index + 1)
                                              const Divider(
                                                color: Colors.white,
                                              ),
                                            Center(
                                                child: Text(
                                              "${index + 1}".padLeft(2, '0'),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            if (selectedDay == index + 1)
                                              const Divider(
                                                color: Colors.white,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ))),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {
                  Get.find<ChatBotController>().addItem(const MessageLoader());
                  Future.delayed(const Duration(seconds: 2), () {
                    Get.find<ChatBotController>().removeItem();
                    // chatbotController
                    //   .removeItem('MessageLoader');
                    Get.find<ChatBotController>().addItem(const BotText14());
                  });
                },
                child: const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BotText12 extends StatelessWidget {
  const BotText12({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BotMessage(
      icon:
          "https://maps.googleapis.com/maps/api/staticmap?size=600x300&maptype=roadmap&markers=color:blue%7Clabel:C%7C6.36638,-2.42327%7Cstyle:feature:road.highway%7Celement:labels%7Cvisibility:on&markers=color:green%7Clabel:O%7C6.36594,-2.35486%7Cstyle:feature:road.highway%7Celement:labels%7Cvisibility:on&path=color:0x0000ff|weight:5|6.36638,-2.42327|6.36594,-2.35486&key=AIzaSyASRqtge8VW1aHkhhuJWT2REzWQvZ3A0xs",
      message: Text("Je bouge"),
    );
  }
}

class BotText11 extends StatelessWidget {
  const BotText11({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotMessage(
      message: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              "Bien .Envoie la photo de ta pièce d’identité après précision de quel document d’identité il s’agit ."),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff6D6D88),
                        border: Border.all(color: Colors.white, width: 0.5)),
                    child: const FittedBox(
                        child: Text("Carte Nationale d’Identité",
                            style: TextStyle(fontSize: 10))),
                  )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff25253F),
                        border: Border.all(color: Colors.white, width: 0.5)),
                    child: const Center(
                        child: Text(
                      "Passeport",
                      style: TextStyle(fontSize: 10),
                    )),
                  )),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: const Placeholder(
                      fallbackWidth: 100,
                      fallbackHeight: 100,
                    )),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.check_box,
                    color: Colors.green,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class BotText10 extends StatelessWidget {
  const BotText10({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotMessage(
      message: Column(
        children: [
          const Text(
              "Nous allons maintenant vérifier ta piece d’identité. Dis moi d’abord ton Nom Prénom  tel qu’il apparait exactement sur votre carte d’identité . Tu peux le faire plutard ."),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          left: 5, right: 30, top: 0, bottom: 0),
                      hintText: "001-FDH-ND0",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Get.find<ChatBotController>().addItem(const MessageLoader());
                  Future.delayed(const Duration(seconds: 2), () {
                    Get.find<ChatBotController>().removeItem();
                    // chatbotController
                    //   .removeItem('MessageLoader');
                    Get.find<ChatBotController>().addItem(const BotText11());
                  });
                },
                child: const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BotText9 extends StatelessWidget {
  const BotText9({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BotMessage(
      message: Text("Super ton adresse e-mail a eté verifié avec succès  ✅"),
    );
  }
}

class BotText8 extends StatelessWidget {
  const BotText8({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotMessage(
      message: Column(
        children: [
          RichText(
              textAlign: TextAlign.start,
              text: const TextSpan(
                  text: "Nous allons vérifier ton adresse ",
                  children: [
                    TextSpan(
                        text: " hjem99@gmail.com",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "Tapes le code que je t’ai  envoyé. Tu peux le faire plutard .")
                  ])),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.only(
                          left: 5, right: 30, top: 0, bottom: 0),
                      hintText: "001-FDH-ND0",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Get.find<ChatBotController>().addItem(const MessageLoader());
                  Future.delayed(const Duration(seconds: 2), () {
                    Get.find<ChatBotController>().removeItem();
                    // chatbotController
                    //   .removeItem('MessageLoader');
                    Get.find<ChatBotController>().addItem(const BotText9());
                    Get.find<ChatBotController>().addItem(const BotText10());
                  });
                },
                child: const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BotText7 extends StatelessWidget {
  const BotText7({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BotMessage(
      message:
          Text("Tes adresses usuelles ont été enregistrées avec succes. ✅"),
    );
  }
}

class BotText6 extends StatelessWidget {
  const BotText6({super.key});

  @override
  Widget build(BuildContext context) {
    ChatBotController chatbotController = Get.put(ChatBotController());
    return BotMessage(
      message: Column(
        children: [
          const Text(
              "Nous allons avant tous enregistrer tes adresses usuelles."),
          const SizedBox(
            height: 3,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  // width: double.maxFinite,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: const Text(
                          "Maison",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: const Text(
                          "7197 Calavi, CA 90221 ...|",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: SvgPicture.asset(
                          "assets/images/fi-sr-map-marker.svg",
                          height: 18,
                          width: 18,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                            height: 100,
                            "https://maps.googleapis.com/maps/api/staticmap?size=600x300&maptype=roadmap&markers=color:blue%7Clabel:C%7C6.36638,-2.42327%7Cstyle:feature:road.highway%7Celement:labels%7Cvisibility:on&markers=color:green%7Clabel:O%7C6.36594,-2.35486%7Cstyle:feature:road.highway%7Celement:labels%7Cvisibility:on&path=color:0x0000ff|weight:5|6.36638,-2.42327|6.36594,-2.35486&key=AIzaSyASRqtge8VW1aHkhhuJWT2REzWQvZ3A0xs"),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  chatbotController.addItem(const MessageLoader());
                  Future.delayed(const Duration(seconds: 2), () {
                    Get.find<ChatBotController>().removeItem();
                    // chatbotController
                    //   .removeItem('MessageLoader');
                    chatbotController.addItem(const BotText7());
                    chatbotController.addItem(const BotText8());
                  });
                },
                child: const Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// class BotText5 extends StatelessWidget {
//   const BotText5({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const BotMessage(
//       message:
//           Text("Nous allons avant tous enregistrer tes adresses usuelles."),
//     );
//   }
// }

class BotMessage extends StatelessWidget {
  final Widget message;
  final String? icon;
  const BotMessage({Key? key, required this.message, this.icon = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 16, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon!.isNotEmpty
              ? CircleAvatar(
                  radius: 12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage(
                      height: 25,
                      width: 25,
                      fit: BoxFit.cover,
                      placeholder: const AssetImage("assets/images/bot.png"),
                      image: NetworkImage(
                        icon!,
                      ),
                    ),
                  ))
              : Image.asset(
                  "assets/images/bot.png",
                  height: 25,
                  width: 25,
                ),
          const SizedBox(
            width: 10,
          ),
          Expanded(child: message)
        ],
      ),
    );
  }
}

class BotText4 extends StatelessWidget {
  const BotText4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotMessage(
      message: RichText(
          textAlign: TextAlign.start,
          text: const TextSpan(
              text:
                  "Tu peux cliquer sur l’icone bleu de la bare des message pour voir les ",
              style: TextStyle(color: Colors.white),
              children: [
                TextSpan(
                    text: "commandes prédefinis",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    text:
                        " pour faciliter ton utilisation. tu peux aussi m’exprimer directement ton besoin.")
              ])),
    );
  }
}

class BotText3 extends StatelessWidget {
  const BotText3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BotMessage(
        message: Text(
      "Nous sommes sur le canal des services de transports ou mizon te propose des solutions de déplacement écologique ; sûrs et économique.",
      softWrap: true,
    ));
  }
}

class BotText2 extends StatelessWidget {
  const BotText2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BotMessage(
        message: Text(
      "je m’appelle  Yo. je suis l’ assistant intelligent qui te fera experimenter et apprecier tous les services de Mizon.",
      softWrap: true,
    ));
  }
}

class BotText1 extends StatelessWidget {
  const BotText1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BotMessage(
        message: Text(
      "Cc  🙂. Bienvenue sur Mizon",
      softWrap: true,
    ));
  }
}

List botRequest = [
  [
    "Je bouge",
    () {
      Get.find<ChatBotController>().addItem(const MessageLoader());
      Future.delayed(const Duration(seconds: 2), () {
        Get.find<ChatBotController>().removeItem();
        // chatbotController
        //   .removeItem('MessageLoader');
        Get.find<ChatBotController>().addItem(const BotText12());
        Get.find<ChatBotController>().addItem(const BotText13());
      });
      Get.back();
    },
  ],
  ["Je veux modifier un trajet", () {}],
  ["Je veux configurer une adresse", () {}],
  [
    "Je veux voir mes statistics",
    () {
      Get.find<ChatBotController>().addItem(const MessageLoader());
      Future.delayed(const Duration(seconds: 2), () {
        Get.find<ChatBotController>().removeItem();
        // chatbotController
        //   .removeItem('MessageLoader');
        Get.find<ChatBotController>().addItem(const BotText18());
      });
      Get.back();
    }
  ],
  ["Je veux  vérifier mon compte", () {}],
  ["Acheter des MIZ", () {}]
];

List<String> months = List<String>.generate(
    12,
    (int index) =>
        DateFormat.MMMM('fr_FR').format(DateTime(2020, index + 1, 1)));

int daysInMonth(month) {
  return int.parse(DateFormat("d", "fr_FR")
      .format(DateTime(DateTime.now().year, month + 2, 0)));
}
