import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  final Color color;
  final Widget? cardChild;
  const ReusableCard({
    Key? key,
    required this.color,
    this.cardChild,
  }) : super(key: key);

  @override
  State<ReusableCard> createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.cardChild,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: widget.color,
      ),
    );
  }
}
