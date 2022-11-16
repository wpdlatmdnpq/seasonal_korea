import 'package:flutter/material.dart';
import 'package:seasonal_korea_app/component/circle_custom_button.dart';

class HeaderCustom extends StatelessWidget {
  HeaderCustom(
      {required this.isShowAlarmButton,
      required this.title,
      required this.description});

  bool isShowAlarmButton;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              Container(
                child: isShowAlarmButton
                    ? CircleCustomButton(
                        icon: Icons.notifications_none_outlined,
                        onTap: () {
                          print('ALARM!!!');
                        },
                      )
                    : null,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Color.fromARGB(255, 108, 104, 104),
                ),
          ),
        ],
      ),
    );
  }
}
