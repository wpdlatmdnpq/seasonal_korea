import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:seasonal_korea_app/component/navi_custom_bar.dart';
import 'package:seasonal_korea_app/model/main_model.dart';

class Main extends StatelessWidget {
  Main();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: ScopedModelDescendant<MainModel>(
        builder: ((context, child, model) {
          return Scaffold(
            body: model.selectedScreen,
            bottomNavigationBar: NaviCustomBar(
              model: model,
            ),
          );
        }),
      ),
    );
  }
}
