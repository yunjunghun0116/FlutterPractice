import 'package:flutter/material.dart';

class CustomDecoration{

  borderBtnDecoration(Color color){
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color: color)
    );
  }

  gradientGoldDecoration(){
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFdbbb8b),
              Color(0xFFb4875e)
            ]
        )
    );
  }
}

final customDecoration = CustomDecoration();