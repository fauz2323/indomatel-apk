import 'package:flutter/material.dart';

class WidgetMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final double W;
  final double H;
  WidgetMenu(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed,
      required this.W,
      required this.H})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: H,
      width: W,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(9),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.all(14),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 60,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
