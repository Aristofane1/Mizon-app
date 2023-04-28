import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormButtonWidget extends StatelessWidget {
  final String title;
  final Function() tap;
  const FormButtonWidget({
    Key? key, required this.title, required this.tap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: tap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20.h)
        ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,textAlign: TextAlign.center, style: const TextStyle(fontSize: 18),),
            ],
          )),
    );
  }
}
