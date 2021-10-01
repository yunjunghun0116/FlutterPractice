import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetImageComponent extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String comment;
  final String date;

  PetImageComponent(this.id, this.imageUrl, this.comment, this.date);

  @override
  State<PetImageComponent> createState() => _PetImageComponentState();
}

class _PetImageComponentState extends State<PetImageComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/detail/${widget.id}', arguments: {
          'imageUrl': widget.imageUrl,
          'comment': widget.comment,
          'date': widget.date,
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Container(
              child: Image.network(
                widget.imageUrl,
                width: 100,
                height: 100,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '내용 : ${widget.comment}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Container(
                  height: 10,
                  margin: EdgeInsets.only(bottom: 10),
                ),
                Text(
                  '일시 : ${widget.date}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
