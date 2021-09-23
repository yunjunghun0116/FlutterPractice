import 'package:flutter/material.dart';

class PetImageComponent extends StatefulWidget {
  final String imageUrl;
  final String comment;
  final String momentTime;

  PetImageComponent(this.imageUrl, this.comment, this.momentTime);

  @override
  State<PetImageComponent> createState() => _PetImageComponentState();
}

class _PetImageComponentState extends State<PetImageComponent> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              widget.imageUrl,
              width: 100,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                child: Text(
                  widget.comment,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(height: 10,),
              Text('일시 : ${widget.momentTime}'),
            ],
          ),
        ],
      ),
    );
  }
}
