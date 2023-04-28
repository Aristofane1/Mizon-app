import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mizon/screens/background.dart';
import 'package:mizon/utils.dart';
import 'package:mizon/widgets/dialog1.dart';

class Home2Screen extends StatefulWidget {
  const Home2Screen({super.key});

  @override
  State<Home2Screen> createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {
  int dateSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff3D3D56),
          centerTitle: true,
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
          )),
      body: Background(
        content: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: dateList()
                      .map((String date) => InkWell(
                            onTap: () {
                              setState(() {
                                dateSelected = dateList().indexOf(date);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              decoration: BoxDecoration(
                                  color:
                                      dateSelected == dateList().indexOf(date)
                                          ? Colors.white
                                          : null,
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: Column(
                                children: [
                                  Text(
                                    date.substring(0, 4),
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                  Text(
                                    date.substring(5, 7),
                                    style: const TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Row(
                children: [
                  const InkWell(
                      onTap: null, child: Icon(Icons.keyboard_arrow_left)),
                  Expanded(
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [const SizedBox(height: 3,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal:8.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Maison",
                                    ),
                                    Image.asset(
                                      "assets/images/dir.png",
                                    ),
                                    const Text(
                                      "Travail",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: const Color(0xff282844)),
                                      child: SvgPicture.asset(
                                          "assets/images/fi-sr-trash.svg")),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: const Color(0xff282844)),
                                            child: SvgPicture.asset(
                                                "assets/images/fi-sr-time-oclock.svg")),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Column(
                                            children: const [
                                              Text(
                                                "Départ",
                                                style: TextStyle(fontSize: 7),
                                              ),
                                              Text(
                                                "07h00",
                                                style: TextStyle(fontSize: 9),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          color: const Color(0xff282844)),
                                      child: SvgPicture.asset(
                                          "assets/images/fi-sr-user-add.svg"))
                                ],
                              ),const SizedBox(height: 3,),
                            ],
                          ))),
                  const InkWell(
                      onTap: null, child: Icon(Icons.keyboard_arrow_right))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: moving_vehicles
                      .map((movingVehicle) => Column(
                            children: [
                              SvgPicture.asset(
                                movingVehicle['icon'],
                                color: Colors.grey,
                                height: 25,
                                width: 25,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                width: 15,
                                height: 3,
                                color: Colors.white,
                              )
                            ],
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: InkWell(
                  onTap: () {
                    Get.dialog(const Dialog1());
                  },
                  child: Container(
                    // padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: const Color(0xff42425A)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            top: 1,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6),
                              decoration: const BoxDecoration(
                                  color: Color(0xff42425A),
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(8))),
                              child: const Text("3miz - 300 F CFA"),
                            )),
                        Column(
                          children: [
                            const DirectionWidget(
                              arriverHeure: "10h00",
                              arriverLieu:
                                  "7746 Court Drive Bakersfield, CA 93306",
                              departHeure: '07h00',
                              departLieu: "7197 Wilson Drive Compton, CA 90221",
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 3),
                              decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, -3),
                                      color: Colors.black,
                                      // blurRadius: 3,
                                      // spreadRadius: 3
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.white54.withOpacity(0.8)),
                              child: const ServiceOwner(
                                name: "Smith L.",
                                star: 4.8,
                                niveau: 'Expert',
                                status: 'Conducteur',
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceOwner extends StatelessWidget {
  final String name, status, niveau;
  final double star;
  const ServiceOwner({
    Key? key,
    required this.name,
    required this.status,
    required this.niveau,
    required this.star,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
                height: 50,
                width: 50,
                "https://media.licdn.com/dms/image/C5603AQHD5mPVl66yQQ/profile-displayphoto-shrink_800_800/0/1600552843351?e=2147483647&v=beta&t=V-lFpcM21Mw6UO-CCRtotAEl-xD0C8Kt5Od0bPg4-0Q")
            // const Placeholder(
            //   fallbackHeight: 50,
            //   fallbackWidth: 50,
            // ),
            ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("  $name"),
            Text(niveau),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,size: 20,
                  color: Colors.amberAccent,
                ),
                Text("$star"),
              ],
            )
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(4)),
              child: Text(
                " $status ",
                style: const TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("assets/images/vehicle_place.svg",
                    height: 20, width: 20),
                SvgPicture.asset("assets/images/vehicle_place.svg",
                    height: 20, width: 20)
              ],
            )
          ],
        )
      ],
    );
  }
}

class DirectionWidget extends StatelessWidget {
  final String departLieu, departHeure, arriverLieu, arriverHeure;
  const DirectionWidget({
    Key? key,
    required this.departLieu,
    required this.departHeure,
    required this.arriverLieu,
    required this.arriverHeure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, right: 18, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(departHeure),
                  Text(
                    departLieu,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: const Color(0xff8C9FFE),
                        borderRadius: BorderRadius.circular(12)),
                  )
                ]),
          ),
          Image.asset(
            "assets/images/dir.png",
            height: 25,
            width: 25,
          ),
          Expanded(
            flex: 3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(arriverHeure),
                  Text(
                    arriverLieu,
                    textAlign: TextAlign.right,
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: const Color(0xff8C9FFE),
                        borderRadius: BorderRadius.circular(12)),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
