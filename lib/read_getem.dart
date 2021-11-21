import 'package:flutter/material.dart';

class ReadGetem extends StatefulWidget {
  final Map poems;
  final int index;
  const ReadGetem({
    Key? key,
    required this.poems,
    required this.index,
  }) : super(key: key);

  @override
  State<ReadGetem> createState() => _ReadGetemState();
}

class _ReadGetemState extends State<ReadGetem> {
  @override
  Widget build(BuildContext context) {
    int poemNum = widget.index;
    String poemId = widget.poems.keys.elementAt(poemNum);
    Map poem = widget.poems[poemId];
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
          ),
          body: Center(child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
              child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(poem["title"],
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                      )),
                      Text(poem["body"],
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
              ),
          ),
                Container(
                    padding: const EdgeInsets.only(right: 60),
                    alignment: Alignment.topRight,
                    child: Text(poem["date"] ?? "",
                      textAlign: TextAlign.right,)),
                Container(
                    padding: const EdgeInsets.only(right: 60),
                    alignment: Alignment.topRight,
                    child: Text(poem["author"] ?? "",
                      textAlign: TextAlign.right,)),
      ]))
          )),
    ));
  }
}
