import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MessageLoader extends StatefulWidget {
  const MessageLoader({super.key});

  @override
  State<MessageLoader> createState() => _MessageLoaderState();
}

class _MessageLoaderState extends State<MessageLoader>{

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeBounce(
    color: Colors.blue,
    size: 20.0,
    );
  }
}
