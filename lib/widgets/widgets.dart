import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;

  const Headline({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.fontSize = 36,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}

class Para extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;

  const Para({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        // fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}

class Quote extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;

  const Quote({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontStyle: FontStyle.italic,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class HomeButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color backgroundColor;
  final Color overlayColor;
  final void Function() onPressed;

  const HomeButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = Colors.white,
    this.backgroundColor = Colors.green,
    this.overlayColor = const Color(0xff199c2f),
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
        splashFactory: InkSplash.splashFactory,
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        overlayColor: MaterialStatePropertyAll(overlayColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(
              color: color,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ),
        padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
        fixedSize: MaterialStatePropertyAll(
          Size.fromWidth(width * 0.9),
        ),
      ),
      child: Headline(
        text: text,
        textColor: color,
      ),
    );
  }
}
