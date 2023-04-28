import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'background.dart';

List<Map<String, String>> messages = [
  {
    "content": "Salut, comment ça va?",
    "sender": "me",
    "date": DateTime.now().subtract(const Duration(minutes: 4)).toString()
  },
  {
    "content": "Ça va bien, merci. Et toi?",
    "sender": "Jane",
    "date": DateTime.now().subtract(const Duration(minutes: 3)).toString()
  },
  {
    "content": "Je vais bien aussi.",
    "sender": "me",
    "date": DateTime.now().subtract(const Duration(minutes: 1)).toString()
  },
  {
    "content": "Cool.",
    "sender": "Jane",
    "date": DateTime.now().subtract(const Duration(seconds: 20)).toString()
  },
];

class HumanChatScreen extends StatefulWidget {
  const HumanChatScreen({super.key});

  @override
  State<HumanChatScreen> createState() => _HumanChatScreenState();
}

class _HumanChatScreenState extends State<HumanChatScreen> {
  TextEditingController chatText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Background(
            content: SafeArea(
                child: Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/smi.png",
                // height: 75,
                // width: 75,
              ),
              Image.asset(
                "assets/images/me.png",
                // height: 75,
                // width: 75,
              ),
              const Spacer(),
              const Text(
                "Moi\nSmith L.",
                textAlign: TextAlign.end,
              )
            ],
          ),
          Expanded(
              child: GroupedListView(
            elements: messages,
            groupBy: (element) => element['date']!.substring(0, 10),
            groupSeparatorBuilder: (String groupByValue) =>
                Center(child: Text(groupByValue)),
            itemBuilder: (context, element) => Align(
              alignment: element['sender'] == "me"
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                  width: size.width * 0.8,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: element['sender'] == "me"
                          ? const Color(0xff373E4E)
                          : const Color(0xffB5CADD).withOpacity(0.37),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    element['content']!,
                    softWrap: true,
                    textAlign: element['sender'] == "me"
                        ? TextAlign.right
                        : TextAlign.left,
                  )),
            ),
          )),
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                      controller: chatText,
                      decoration: const InputDecoration())),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {
                    if(chatText.text.isNotEmpty){
                      messages.add({
                        "date": DateTime.now().toString(),
                        "content": chatText.text,
                        "sender": "me"
                      });
                      chatText.clear();
                      setState(() {});
                    }
                  },
                  icon: const Icon(Icons.send))
            ],
          )
        ],
      ),
    ))));
  }
}
