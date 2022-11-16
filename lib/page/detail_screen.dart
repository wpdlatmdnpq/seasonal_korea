import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:seasonal_korea_app/component/circle_custom_button.dart';
import 'package:seasonal_korea_app/component/location_custom_text.dart';
import 'package:seasonal_korea_app/component/rounded_custom_text.dart';
import 'package:seasonal_korea_app/data.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({required this.item});
  Sample item;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScopedModel<Sample>(
      model: item,
      child: ScopedModelDescendant<Sample>(
        builder: (context, child, model) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                Container(
                  child: SliverAppBar(
                    pinned: true,
                    snap: false,
                    floating: false,
                    expandedHeight: MediaQuery.of(context).size.height / 2,
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image(
                        image: AssetImage(item.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleCustomButton(
                          icon: Icons.arrow_back_ios_new,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        CircleCustomButton(
                          icon: Icons.more_horiz,
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(30),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                          color: Colors.white,
                        ),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          item.name,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    automaticallyImplyLeading: false,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LocationCustomText(
                          location: item.location,
                          fontSize: 12,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RoundedCustomText(
                                  icon: Icons.timer_outlined,
                                  text: item.tripType == 0
                                      ? '1 day'
                                      : 'Over 2 Days',
                                  onTab: () {},
                                  isButton: false,
                                ),
                                RoundedCustomText(
                                  icon: Icons.cloud_outlined,
                                  text: item.Season(),
                                  onTab: () {},
                                  isButton: false,
                                ),
                                RoundedCustomText(
                                  icon: item.isLike
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_outlined,
                                  text: item.likeCnt.toString(),
                                  onTab: () {
                                    model.IsLike();
                                  },
                                  isButton: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'Overviews',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ReadMoreText(
                          item.overview,
                          trimLines: 5,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '  show more',
                          trimExpandedText: '  show less',
                          lessStyle:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color.fromARGB(255, 72, 151, 215),
                                  ),
                          moreStyle:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Color.fromARGB(255, 72, 151, 215),
                                  ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Material(
                            color: Color.fromARGB(255, 72, 151, 215),
                            borderRadius: BorderRadius.circular(30),
                            child: InkWell(
                              onTap: () {
                                print('hello');
                              },
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 10),
                                child: Text(
                                  'Show Reviews',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );

          //   return Scaffold(
          //     body: Stack(
          //       children: [
          //         Container(
          //           height: MediaQuery.of(context).size.height / 2,
          //           width: double.infinity,
          //           child: Image(
          //             image: AssetImage(item.imagePath),
          //             fit: BoxFit.fitWidth,
          //           ),
          //         ),
          //         Container(
          //           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               CircleCustomButton(
          //                 icon: Icons.arrow_back_ios_new,
          //                 onTap: () {
          //                   Navigator.pop(context);
          //                 },
          //               ),
          //               CircleCustomButton(
          //                 icon: Icons.more_horiz,
          //                 onTap: () {
          //                   Navigator.pop(context);
          //                 },
          //               ),
          //             ],
          //           ),
          //         ),
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           children: [
          //             Container(
          //               height: (size.height / 2) + 30,
          //               decoration: const BoxDecoration(
          //                 borderRadius: BorderRadius.only(
          //                   topLeft: Radius.circular(40),
          //                   topRight: Radius.circular(40),
          //                 ),
          //                 color: Colors.white,
          //               ),
          //               padding: const EdgeInsets.symmetric(
          //                 horizontal: 20,
          //                 vertical: 20,
          //               ),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     item.name,
          //                     style:
          //                         Theme.of(context).textTheme.bodyText1!.copyWith(
          //                               fontSize: 25,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                   ),
          //                   const SizedBox(
          //                     height: 10,
          //                   ),
          //                   LocationCustomText(
          //                     location: item.location,
          //                     fontSize: 15,
          //                   ),
          //                   Container(
          //                     margin: EdgeInsets.symmetric(
          //                       vertical: 20,
          //                     ),
          //                     child: SingleChildScrollView(
          //                       scrollDirection: Axis.horizontal,
          //                       child: Row(
          //                         mainAxisAlignment: MainAxisAlignment.start,
          //                         children: [
          //                           RoundedCustomText(
          //                             icon: Icons.timer_outlined,
          //                             text: item.tripType == 0
          //                                 ? '1 day'
          //                                 : 'Over 2 Days',
          //                             onTab: () {},
          //                             isButton: false,
          //                           ),
          //                           RoundedCustomText(
          //                             icon: Icons.cloud_outlined,
          //                             text: item.Season(),
          //                             onTab: () {},
          //                             isButton: false,
          //                           ),
          //                           RoundedCustomText(
          //                             icon: item.isLike
          //                                 ? Icons.thumb_up
          //                                 : Icons.thumb_up_outlined,
          //                             text: item.likeCnt.toString(),
          //                             onTab: () {
          //                               model.IsLike();
          //                             },
          //                             isButton: true,
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                   Text(
          //                     'Overviews',
          //                     style:
          //                         Theme.of(context).textTheme.bodyText1!.copyWith(
          //                               fontSize: 18,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                   ),
          //                   SizedBox(
          //                     height: 5,
          //                   ),
          //                   Expanded(
          //                     child: SingleChildScrollView(
          //                       child: ReadMoreText(
          //                         item.overview,
          //                         trimLines: 5,
          //                         colorClickableText: Colors.pink,
          //                         trimMode: TrimMode.Line,
          //                         trimCollapsedText: '  show more',
          //                         trimExpandedText: '  show less',
          //                         lessStyle: Theme.of(context)
          //                             .textTheme
          //                             .bodyText1!
          //                             .copyWith(
          //                               fontWeight: FontWeight.bold,
          //                               color: Color.fromARGB(255, 72, 151, 215),
          //                             ),
          //                         moreStyle: Theme.of(context)
          //                             .textTheme
          //                             .bodyText1!
          //                             .copyWith(
          //                               color: Color.fromARGB(255, 72, 151, 215),
          //                             ),
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     alignment: Alignment.center,
          //                     child: Material(
          //                       color: Color.fromARGB(255, 72, 151, 215),
          //                       borderRadius: BorderRadius.circular(30),
          //                       child: InkWell(
          //                         onTap: () {
          //                           print('hello');
          //                         },
          //                         borderRadius: BorderRadius.circular(30),
          //                         child: Container(
          //                           decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.circular(30),
          //                           ),
          //                           padding: const EdgeInsets.symmetric(
          //                               horizontal: 50, vertical: 10),
          //                           child: Text(
          //                             'Show Reviews',
          //                             style: Theme.of(context)
          //                                 .textTheme
          //                                 .bodyText1!
          //                                 .copyWith(
          //                                   fontSize: 15,
          //                                   color: Colors.white,
          //                                 ),
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         )
          //       ],
          //     ),
          //   );
        },
      ),
    );
  }
}
