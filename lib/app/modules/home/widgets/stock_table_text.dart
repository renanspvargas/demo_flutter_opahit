import 'package:flutter/material.dart';

class StockTableText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const StockTableText(
    this.text, {
    Key? key,
    this.size = 13,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        overflow: TextOverflow.clip,
        softWrap: true,
        style: TextStyle(fontSize: size, fontWeight: fontWeight),
        textAlign: textAlign,
      ),
    );
  }
}
