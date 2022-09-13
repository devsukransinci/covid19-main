import 'dart:async';

import 'package:flutter/material.dart';

import 'package:covid19/models/global.stats.dart';
import 'package:covid19/library/services.lib.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  IndianGenericData? indianGeneriData;
  int initCallCount = 0;

  @override
  void initState() {
    _retryGet();
    super.initState();
  }

  void _retryGet() {
    getIndiaGlobalStats().then((value) {
      setState(() {
        indianGeneriData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (indianGeneriData == null) {
      if (initCallCount < 3) {
        Timer(const Duration(seconds: 2), () {
          initCallCount++;
          _retryGet();
        });
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      } else {
        // Tried for 2 times took 4 seconds
        return const Scaffold(
          body: Center(
            child: Text("Please try again later"),
          ),
        );
      }
    }

    return Scaffold(
      body: //ListWheelScrollView(
          ListWheelScrollView.useDelegate(
        // padding: const EdgeInsets.all(16),
        itemExtent: 250,
        physics: const FixedExtentScrollPhysics(),
        diameterRatio: 0.7,

        onSelectedItemChanged: (index) {},
        // children: [getCard(), getCard(), getCard(), getCard(), getCard()],
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 10,
          builder: (context, index) => homePageDataCard(
              dataObjectToDiaplay: indianGeneriData, index: index),
        ),
      ),
    );
  }
}
