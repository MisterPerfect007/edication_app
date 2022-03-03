import 'dart:async';

import 'package:flutter/material.dart';

class RemainingTimeProgressbar extends StatefulWidget {
  const RemainingTimeProgressbar({Key? key}) : super(key: key);

  @override
  State<RemainingTimeProgressbar> createState() => _RemainingTimeProgressbarState();
}

class _RemainingTimeProgressbarState extends State<RemainingTimeProgressbar> {

  double _initialWidth = 0.0;
  bool isIt = false;

  void updateWidth(){
    if(!isIt && mounted){
      print('called');
      Timer.periodic(const Duration(milliseconds: 100), (timer){
        setState(() {
          _initialWidth += 0.001;
        });
      });
      isIt = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    updateWidth();
    
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      child: Stack(
        children: [
          Container(
            width: screenWidth,
            height: 5,
            color: const Color(0xffeeeeee),
          ),
          Container(
            width: screenWidth * _initialWidth,
            height: 5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xfff83600),
                  Color(0xfffe8c00),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
