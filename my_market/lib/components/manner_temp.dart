import 'package:flutter/material.dart';

class MannerTemperature extends StatelessWidget {
  final double mannerTemp;
  int mannerLevel = 0;
  //FontColor
  final List<Color> temperColors = [
    Color(0xFF072038),
    Color(0xFF0D3A65),
    Color(0xFF186EC0),
    Color(0xFF37B24D),
    Color(0xFFFFAD13),
    Color(0xFFF76707),
  ];
  MannerTemperature(this.mannerTemp) {
    _calcTempLevel();
  }
  void _calcTempLevel() {
    if (mannerTemp <= 20) {
      mannerLevel = 0;
    } else if (mannerTemp <= 32) {
      mannerLevel = 1;
    } else if (mannerTemp <= 36.5) {
      mannerLevel = 2;
    } else if (mannerTemp <= 40) {
      mannerLevel = 3;
    } else if (mannerTemp <= 50) {
      mannerLevel = 4;
    } else {
      mannerLevel = 5;
    }
  }

  Widget _makeTempLabelAndBar() {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$mannerTemp°C',
            style: TextStyle(
              color: temperColors[mannerLevel],
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: 60,
              height: 6,
              color: Colors.black.withOpacity(0.2),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: mannerTemp * 60 / 99,
                      height: 6,
                      color: temperColors[mannerLevel],
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _makeTempLabelAndBar(),
            Image(
              image: AssetImage('assets/images/level-$mannerLevel.jpg'),
              width: 30.0,
            ),
          ],
        ),
        Text(
          '매너온도',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
