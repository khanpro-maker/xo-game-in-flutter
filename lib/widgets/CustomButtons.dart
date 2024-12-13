import 'package:appone/widgets/TextStyleOwn.dart';
import 'package:flutter/material.dart';

class Custombuttons extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  const Custombuttons({super.key, required this.btnText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: onTap,
              child: Text(
                btnText,
                style: Textstyleown.text,
              )),
        ),
      ],
    );
  }
}
