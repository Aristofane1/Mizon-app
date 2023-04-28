import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../screens/home2Screen.dart';

class Dialog1 extends StatelessWidget {
  const Dialog1({
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
            // const Placeholder(
            //   fallbackHeight: 100,
            //   fallbackWidth: double.infinity,
            // ),
            Image.network(
              fit: BoxFit.cover,
                width: double.maxFinite,
                height: 100,
                "https://maps.googleapis.com/maps/api/staticmap?size=600x300&maptype=roadmap&markers=color:blue%7Clabel:C%7C6.36638,-2.42327%7Cstyle:feature:road.highway%7Celement:labels%7Cvisibility:on&markers=color:green%7Clabel:O%7C6.36594,-2.35486%7Cstyle:feature:road.highway%7Celement:labels%7Cvisibility:on&path=color:0x0000ff|weight:5|6.36638,-2.42327|6.36594,-2.35486&key=AIzaSyASRqtge8VW1aHkhhuJWT2REzWQvZ3A0xs"),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              color: const Color(0xff6D6D88),
              child: const ServiceOwner(
                name: "Smith L.",
                star: 4.8,
                niveau: 'Expert',
                status: 'Conducteur',
              ),
            ),
            Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                color: const Color(0xff42425A),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Je ne fume pas"),
                    Text("Je ne prend pas d’animaux à bord"),
                    Text("Je discute beaucoup"),
                    Text("j’ecoute de la musique")
                  ],
                )),
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
              children:[
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
