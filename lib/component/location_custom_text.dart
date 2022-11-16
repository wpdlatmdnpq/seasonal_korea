import 'package:flutter/material.dart';

class LocationCustomText extends StatelessWidget {
  LocationCustomText({
    required this.location,
    required this.fontSize,
  });

  String location;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.location_on_outlined,
          color: Colors.black.withOpacity(0.58),
          size: fontSize + 2,
        ),
        SizedBox(
          width: fontSize / 3,
        ),
        Text(
          location,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: fontSize,
                color: Colors.black.withOpacity(0.68),
              ),
        )
      ],
    );
  }
}
