import 'package:flutter/material.dart';

class ArtistDivisionCard extends StatelessWidget {
  final String title;
  final Function onPressed;
  const ArtistDivisionCard(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              onPressed();
            },
            child: Row(
              children: const [
                Text(
                  '전체보기',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                  size: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
