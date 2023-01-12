import 'package:flutter/material.dart';

class Reusable_Card extends StatelessWidget {
  Reusable_Card({required this.renk, required this.CardChild, required this.cnstyTiklama});
  final Color renk;
  final Widget CardChild;
  final Function cnstyTiklama;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cnstyTiklama(),
      child: Container(
        child: CardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color:renk,
        ),
      ),
    );
  }
}