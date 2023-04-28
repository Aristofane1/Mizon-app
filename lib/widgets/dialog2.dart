import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/home2Screen.dart';

class Dialog2 extends StatelessWidget {
  const Dialog2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      insetPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DirectionWidget(
              arriverHeure: "10h00",
              arriverLieu: "7746 Court Drive Bakersfield, CA 93306",
              departHeure: '07h00',
              departLieu: "7197 Wilson Drive Compton, CA 90221",
            ),
            const SizedBox(
              height: 3,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              width: double.infinity,
              color: const Color(0xff6D6D88),
              child: const Text(
                "3miz - 300F CFA",
                textAlign: TextAlign.center,
              ),
            ),
            const Placeholder(
              fallbackHeight: 100,
              fallbackWidth: double.infinity,
            ),
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Les Arrêts Ligne 4 ",
                      textAlign: TextAlign.center,
                    ),
                    Text("7197 Wilson Drive Compton, CA 90221"),
                    Text("7197 Wilson Drive Compton, CA 90221"),
                    Text("Gedeons  gare  728 ")
                  ],
                )),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              color: const Color(0xff6D6D88),
              child: Column(
                children: [
                  const ServiceOwner(
                    name: "Smith L.",
                    star: 4.8,
                    niveau: 'Expert',
                    status: 'Conducteur',
                  ),
                  Row(
                    children: const [
                      Expanded(
                          flex: 4,
                          child: Text(
                            "Compton, CA 90221",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Icon(Icons.arrow_right_alt_outlined),
                      Expanded(
                          flex: 4,
                          child: Text(
                            "Compton, CA 90221",
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("assets/images/fi-sr-comments.svg",
                    height: 20, width: 20),const SizedBox(width: 8,),
                const Text("Contacter Smith")
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("assets/images/fi-sr-shield-exclamation.svg",
                    height: 20, width: 20),const SizedBox(width: 8,),
                const Text("Signaler le trajet")
              ],
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }
}