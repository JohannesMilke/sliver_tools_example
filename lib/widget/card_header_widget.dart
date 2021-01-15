import 'package:flutter/material.dart';

class CardHeaderWidget extends StatelessWidget {
  static const double padding = 16;
  final String title;

  const CardHeaderWidget({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: padding),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300])),
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
        ),
      );
}
