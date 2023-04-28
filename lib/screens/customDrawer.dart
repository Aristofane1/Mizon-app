import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'humanChatScreen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 260,
        child: Row(
          children: [IconsMenus(), SubMenus()],
        ),
      ),
    );
  }

  Widget IconsMenus() {
    return Container(
        width: 75,
        color: const Color(0xff2B2B43),
        child: ListView.builder(
            itemCount: menuList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Visibility(
                                visible: selectedIndex == index ? true : false,
                                child: Container(
                                  height: 25,
                                  width: 5,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5))),
                                )),
                            const Spacer(),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: const Color(0xff282844),
                                borderRadius: BorderRadius.circular(25),
                                // border: Border.all(color: Colors.black, width: 1)
                              ),
                              child: Center(
                                child: menuList[index][0],
                              ),
                            ),
                            const Spacer()
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Visibility(
                          visible: selectedIndex == index ? true : false,
                          child: Container(
                            height: 2,
                            width: 51,
                            decoration:
                                const BoxDecoration(color: Color(0xffD9D9D9)),
                          ),
                        )
                      ],
                    ),
                  ));
            }));
  }

  Widget SubMenus() {
    return Visibility(
      visible: menuList[selectedIndex][1].length > 0 ? true : false,
      child: Container(
          decoration: const BoxDecoration(
              color: Color(0xFF282844),
              gradient: LinearGradient(
                  begin: Alignment(
                    5.48,
                    -0.81,
                  ),
                  end: Alignment(
                    0.43,
                    0.54,
                  ),
                  stops: [
                    0.6,
                    1
                  ],
                  colors: [
                    Color(0xFF282844),
                    Color(0xff373958),
                  ])),
          width: 185,
          child: Column(
            children: [
              const SizedBox(
                height: 14,
              ),
              Text(menuList[selectedIndex][2],
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: menuList.length,
                    itemBuilder: (context, index) {
                      bool selected = selectedIndex == index;
                      var i = menuList[index];
                      return submenus(i[1], selected);
                    }),
              ),
            ],
          )),
    );
  }
}

Widget submenus(List submenus, bool selected) {
  return !selected
      ? const SizedBox()
      : SizedBox(
          height: double.maxFinite,
          child: ListView.builder(
              itemCount: submenus.length,
              itemBuilder: (context, index) {
                var submenuItem = submenus[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 14, top: 14),
                  child: InkWell(
                      onTap: submenuItem['onTap'],
                      // child: ListTile(leading: Image.asset(submenuItem['icon'], height: 25, width: 25,),
                      // title: Text(submenuItem['name'],),
                      // subtitle: Text(submenuItem['name'],),
                      // onTap: () {
                      //   Navigator.pop(context);
                      // },
                      child: Row(
                        children: [
                          Image.asset(
                            submenuItem['icon'],
                            height: 25,
                            width: 25,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(submenuItem['name']),
                              if (submenuItem['message'] != null)
                                Text(submenuItem['message'], style: const TextStyle(fontSize: 11, color: Colors.white70),),
                            ],
                          ),
                        ],
                      )),
                );
              }),
        );
}

List menuList = [
  [
    Image.asset(
      "assets/images/logo_name.png",
      height: 35,
      width: 35,
    ),
    [],
    "Mizon"
  ],
  [
    Image.asset(
      "assets/images/bot.png",
      height: 35,
      width: 35,
    ),
    [
      {'icon': 'assets/images/car.png', 'name': 'Transport', 'onTap': () {Get.back();}},
      {'icon': 'assets/images/immo2.png', 'name': 'Immobilier', 'onTap': () {Get.back();}},
      // {'icon': 'assets/images/immo2.png', 'name': 'Immobilier', 'onTap': (){}},
      {'icon': 'assets/images/market.png', 'name': 'Achats', 'onTap': () {Get.back();}}
    ],
    "yo'bot"
  ],
  [
    SvgPicture.asset(
      "assets/images/fi-sr-comments.svg",
      height: 35,
      width: 35,
    ),
    [
      {
        'icon': 'assets/images/me.png',
        'name': 'Smith L',
        'message': 'Salut. Je suis là',
        'onTap': () {Get.back(); Get.to((){return const HumanChatScreen();});}
      },
      // {
      //   'icon': 'assets/images/immo2.png',
      //   'name': 'Dupont X',
      //   'message': 'Juste, merci',
      //   'onTap': (){Get.back(); Get.to((){return const HumanChatScreen();});}
      // },
    ],
    "Chat"
  ],
  [
    SvgPicture.asset(
      "assets/images/Vector.svg",
      height: 35,
      width: 35,
    ),
    [],
    "Marchand"
  ],
  [
    SvgPicture.asset(
      "assets/images/Group.svg",
      height: 35,
      width: 35,
    ),
    [],
    "Setting"
  ],
  // [
  //   SvgPicture.asset(
  //     "assets/images/Group.svg",
  //     height: 35,
  //     width: 35,
  //   ),
  //   [],
  //   "Setting"
  // ],
];
