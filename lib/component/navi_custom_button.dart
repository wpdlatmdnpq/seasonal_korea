import 'package:flutter/material.dart';

class NaviCustomButton extends StatelessWidget {
  NaviCustomButton(this.active, this.inactive, this.isSelected, this.onTab);

  final IconData active;
  final IconData inactive;
  final bool isSelected;
  final Function onTab;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTab();
      },
      borderRadius: BorderRadius.circular(
        100,
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Icon(
          isSelected ? active : inactive,
          color: isSelected
              ? Theme.of(context).primaryColor
              : Colors.grey.shade600,
          size: 30,
        ),
      ),
    );
  }
}
