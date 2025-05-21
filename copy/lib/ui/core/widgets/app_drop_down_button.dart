import 'package:flutter/material.dart';

class AppDropDownButton extends StatelessWidget {
  const AppDropDownButton({
    required this.text,
    required this.onPressed,
    super.key,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
      ),
      child: Container(
        width: 160,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: Row(
          children: [
            const Expanded(child: SizedBox()),
            Center(
              child: Text(
                text,
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Icon(Icons.arrow_drop_down),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
