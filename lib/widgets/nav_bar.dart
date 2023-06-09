import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/utils/image_asset_constants.dart';
import 'package:portfolio/widgets/logo.dart';
import 'package:portfolio/widgets/nav_bar_button.dart';
import 'package:portfolio/widgets/nav_bar_item.dart';
import 'package:portfolio/widgets/nav_bar_item_with_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  final double width;
  final GlobalKey intrestsKey;
  final GlobalKey skillsKey;
  final ScrollController scrollController;
  late final RxDouble collapsableHeight;
  NavBar(
      {required this.width,
      required this.intrestsKey,
      required this.skillsKey,
      required this.scrollController,
      Key? key})
      : super(key: key) {
    collapsableHeight = 0.0.obs;
  }

  void scrollToWidgetByKey(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    double y = position.dy;
    scrollController.animateTo(y,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    Widget navBarRow = Stack(children: [
      Padding(
        padding: EdgeInsets.only(left: width * 0.04),
        child: Logo(width: width,scrollController: scrollController,),
      ),
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavBarItem(
              text: 'Home',
              onTap: () {},
            ),
            NavBarItem(
                text: 'Skills', onTap: () => scrollToWidgetByKey(skillsKey)),
            NavBarItem(
              text: 'Projects',
              onTap: () => scrollToWidgetByKey(intrestsKey),
            ),
            NavBarItem(
              text: 'CV',
              onTap: () => scrollToWidgetByKey(intrestsKey),
            ),
            const SizedBox(width: 60),
          ]),
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        const SizedBox(width: 50),
        Row(children: const [
          NavBarItemWithIcon(
            text: 'github',
            icon: ImageAssetConstants.github,
            url: 'https://github.com/maqamylee0',
          ),
          SizedBox(width: 10),
          // NavBarItemWithIcon(
          //     text: 'facebook',
          //     icon: ImageAssetConstants.facebook,
          //     url: 'https://www.facebook.com/khalid.alsaleh.52090/'),
          SizedBox(width: 10),
          NavBarItemWithIcon(
              text: 'linkedIn',
              icon: ImageAssetConstants.linkedIn,
              url: 'https://www.linkedin.com/in/namuganga-emmilly-immaculate-6a57b1191/'),
          SizedBox(width: 50),
        ])
      ])
    ]);
    List<Widget>? navBarColumn = [
      NavBarItem(
          text: 'Home',
          onTap: () {
            collapsableHeight.value = 0.0;
          }),
      const SizedBox(width: 10),
      NavBarItem(
          text: 'Experience',
          onTap: () {
            scrollToWidgetByKey(skillsKey);

            collapsableHeight.value = 0.0;
          }),
      const SizedBox(width: 10),
      NavBarItem(
          text: 'Projects',
          onTap: () {
            scrollToWidgetByKey(intrestsKey);
            collapsableHeight.value = 0.0;
          }),
      NavBarItem(
          text: 'github',
          onTap: () async {
            await launch('https://github.com/maqamylee0');
          }),
      // NavBarItem(
      //     text: 'facebook',
      //     onTap: () async =>
      //         await launch('https://www.facebook.com/khalid.alsaleh.52090/')),
      NavBarItem(
          text: 'linkedIn',
          onTap: () async => await launch(
              'https://www.linkedin.com/in/namuganga-emmilly-immaculate-6a57b1191/')),
      NavBarItem(
          text: 'CV',
          onTap: () async => await launch(
              'https://drive.google.com/file/d/1cZ3BTB7ME4b7NjkLzA9aF0UTJTwhI2mM/view?usp=sharing')),
    ];
    return Stack(
      children: [
        ObxValue<RxDouble>(
            (data) => AnimatedContainer(
                  margin: const EdgeInsets.only(top: 110.0),
                  duration: const Duration(milliseconds: 375),
                  curve: Curves.ease,
                  height: data.value,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: CustomColors.darkBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: navBarColumn,
                    ),
                  ),
                ),
            collapsableHeight),
        Container(
          height: 80.0,
          margin: const EdgeInsets.only(top: 40.0),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: (width < Breakpoints.xlg)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: width * 0.04),
                        child: Logo(width: width,scrollController: scrollController,)),
                    NavBarButton(
                        onPressed: () {
                          if (collapsableHeight.value == 0.0) {
                            collapsableHeight.value = 240.0;
                          } else if (collapsableHeight.value == 240.0) {
                            collapsableHeight.value = 0.0;
                          }
                        },
                        width: width),
                  ],
                )
              : navBarRow,
        ),
      ],
    );
  }
}
