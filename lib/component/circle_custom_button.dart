import 'package:flutter/material.dart';

class CircleCustomButton extends StatelessWidget {
  CircleCustomButton({required this.icon, required this.onTap});

  IconData icon;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            onTap();
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Icon(
              icon,
              size: 20,
              color: Colors.black.withOpacity(0.38),
            ),
          ),
        ),
      ),
    );
  }
}
