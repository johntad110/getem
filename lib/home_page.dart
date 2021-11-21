import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:getem/read_getem.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map getemData = {};

  @override
  void initState(){
    super.initState();
    getGetemData();
  }

  void getGetemData() async {
    await DefaultAssetBundle.of(context).loadString("assets/json/getem_data.json").then((d) {
      setState(() {
        getemData = json.decode(d);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text("ግጥም"),
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              String poemId = getemData["poems"].keys.elementAt(index);
              Map poem = getemData["poems"][poemId];
              return Container(
                margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        spreadRadius: 0.1,
                        offset: Offset(0, 1)
                      )
                    ]
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReadGetem(poems: getemData["poems"], index: index)
                        ),
                      );
                    },
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(poem["title"], style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(poem["author"], style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          )),
                          Text(poem["date"] ?? "- - -"),
                        ],
                      )
                    ],
                ),
                  )
              );
            },
            itemCount: getemData["poems"].length
        ),
      ),
    );
  }
}
