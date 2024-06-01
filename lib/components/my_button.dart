import 'package:flutter/material.dart';

//button for calculator
class MyBtn extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
  const MyBtn(
      {super.key,
      required this.title,
      required this.color,
      required this.onPress});

  // const MyBtn({super.key, required this.title,  this.color = 'Colors.white'});//color will not  be req, default would be white,)

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          child:  Container(
            height: 80,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          onTap: onPress,
        ),
      ),
    );
  }
}
