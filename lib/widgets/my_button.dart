import 'package:flutter/material.dart';
import 'package:stok_makanan/utils/colors.dart';
import 'package:stok_makanan/utils/styles.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.color = mBlueColor,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      label: Text(
        text,
        style: buttonTextStyle,
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
