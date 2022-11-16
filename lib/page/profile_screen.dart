import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:seasonal_korea_app/component/circle_custom_button.dart';
import 'package:seasonal_korea_app/model/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProfileModel>(
        model: ProfileModel(),
        child: ScopedModelDescendant<ProfileModel>(
          builder: (context, child, model) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 50,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleCustomButton(
                        icon: Icons.edit,
                        onTap: () {},
                      )
                    ],
                  ),
                  ProfileImage(
                    imagePath: model.userImagePath,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Text(
                      model.userName,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                  ),
                  Container(
                    height: 1,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.18),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              print(model.menuList[index].cd);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              height: 50,
                              child: Row(
                                children: [
                                  Icon(
                                    model.menuList[index].icon,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.76),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Text(model.menuList[index].nm,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!)
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: model.menuList.length),
                  )
                ],
              ),
            );
          },
        ));
  }
}

class ProfileImage extends StatelessWidget {
  ProfileImage({
    required this.imagePath,
  });
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.18),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(100),
            color: Colors.black.withOpacity(0.04)),
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fitHeight,
                opacity: 0.78),
          ),
        ),
      ),
    );
  }
}
