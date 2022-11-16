import 'package:flutter/material.dart';

class SubTitleWithButton extends StatelessWidget {
  SubTitleWithButton({
    required this.title,
    required this.buttonTitle,
    required this.onTab,
  });
  String title;
  String buttonTitle;
  Function onTab;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        TextButton(
            onPressed: () {
              onTab();
            },
            child: Text(
              buttonTitle,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12,
                    color: Theme.of(context).primaryColor,
                  ),
            ))
      ],
    );
  }
}
