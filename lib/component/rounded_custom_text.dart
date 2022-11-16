import 'package:flutter/material.dart';

class RoundedCustomText extends StatelessWidget {
  RoundedCustomText({
    required this.icon,
    required this.text,
    required this.isButton,
    required this.onTab,
  });

  IconData icon;
  String text;
  bool isButton;
  Function onTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10,
      ),
      child: Material(
        color: const Color.fromARGB(255, 206, 222, 235),
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: () {
            if (isButton) {
              onTab();
            }
          },
          borderRadius: BorderRadius.circular(30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isButton
                  ? Colors.transparent
                  : const Color.fromARGB(255, 206, 222, 235),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(children: [
              Icon(
                icon,
                color: Colors.black.withOpacity(0.56),
                size: 20,
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.black.withOpacity(0.56), fontSize: 13),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
