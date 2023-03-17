import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/breakpoints.dart';
import 'package:portfolio/utils/custom_colors.dart';
import 'package:portfolio/utils/image_asset_constants.dart';
import 'package:portfolio/widgets/hello_with_bio.dart';
import 'package:portfolio/widgets/info.dart';
import 'package:portfolio/widgets/intrest.dart';
import 'package:portfolio/widgets/skill_card.dart';

class LowerContainer extends StatelessWidget {
  final double width;
  final List<Map> intrests;
  final GlobalKey intrestsKey;
  final GlobalKey skillsKey;

   LowerContainer(
      {Key? key,
      required this.width,
      required this.intrests,
      required this.intrestsKey,
      required this.skillsKey})
      : super(key: key);
  List<String> vids = [
    'https://firebasestorage.googleapis.com/v0/b/portfolio-9ca66.appspot.com/o/capstonefinal.mp4?alt=media&token=0058cb16-6293-46ac-bc39-53641bcfc9f0',
    'https://firebasestorage.googleapis.com/v0/b/portfolio-9ca66.appspot.com/o/kitubs.mp4?alt=media&token=91cc895b-05c8-4c1d-a061-0c74024731f6',
    'https://firebasestorage.googleapis.com/v0/b/portfolio-9ca66.appspot.com/o/rosary.mp4?alt=media&token=25343749-907d-4770-919d-6f4190f5354a',
    'https://firebasestorage.googleapis.com/v0/b/portfolio-9ca66.appspot.com/o/shecode.mp4?alt=media&token=ae070798-0fe4-4dab-97e5-ec86fb42a62a',
    'https://firebasestorage.googleapis.com/v0/b/portfolio-9ca66.appspot.com/o/kotlin_kitubs.mp4?alt=media&token=1b2564dc-ccc9-4a54-b796-255e98fba619',
    'https://firebasestorage.googleapis.com/v0/b/portfolio-9ca66.appspot.com/o/gameon.mp4?alt=media&token=634a8bc7-d78e-4534-8902-6da9034dca8b',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
         // height: MediaQuery.of(context).size.height*0.8,
        width: width,
        key: skillsKey,
        color: CustomColors.darkBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= Breakpoints.lg) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HelloWithBio(
                          ratio:0.4 ,
                          width: width,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Info(width: width,ratio:0.4)
                      ],
                    ),
                    SizedBox(width: 0.05 * width),

                    // skills cards
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkillCard(
                          title: 'Flutter Development',
                          description:
                              'I’m developing android,ios and web applications using flutter platform.',
                          icon: ImageAssetConstants.flutter,
                          width: width,
                          ratio: 0.35,
                        ),
                        const SizedBox(height: 10),
                        SkillCard(
                          title: 'Android Development',
                          description:
                              'I’m developing android applications using kotlin.',
                          icon: ImageAssetConstants.backendIcon,
                          width: width,
                          ratio: 0.35,
                        ),
                        // SkillCard(
                        //     title: 'Python Development',
                        //     description:
                        //         'I’m developing maching learing and deep learning projects using standard python libraries and tensorflow api.',
                        //     icon: ImageAssetConstants.kotlin,
                        //     width: width,
                        //     ratio: 0.35),
                      ],
                    ),
                    // hello with bio and info

                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // skills cards
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkillCard(
                            title: 'Flutter Development',
                            description:
                                'I’m developing android,ios and web applications using flutter platform.',
                            icon: ImageAssetConstants.flutter,
                            width: 2 * width,
                            ratio: 0.45),
                        const SizedBox(height: 10),
                        SkillCard(
                            title: 'Android Development',
                            description:
                                'I’m developing android applications with kotlin.',
                            icon: ImageAssetConstants.backendIcon,
                            width: 2 * width,
                            ratio: 0.45),
                        const SizedBox(height: 10),
                        // SkillCard(
                        //     title: 'Python Development',
                        //     description:
                        //         'I’m developing maching learing and deep learning projects using standard python libraries and tensorflow api.',
                        //     icon: ImageAssetConstants.kotlin,
                        //     width: 2 * width,
                        //     ratio: 0.45),
                      ],
                    ),
                    // hello with bio and info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        HelloWithBio(width: 3 * width,ratio: 0.3,),
                        const SizedBox(
                          height: 35,
                        ),
                        Info(width: 3 * width,ratio:0.3),
                      ],
                    )
                  ],
                );
              }
            }),
            SizedBox(
              height: width * 0.07,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left:width>=Breakpoints.lg? width * 0.1:width * 0.05),
              child: Text('Some of my work',
                  style: GoogleFonts.getFont('Delius',
                      color: Colors.white, fontSize: 19)),
            ),
            SizedBox(height: width * 0.03),

            Expanded(
              child: Column(
                children: [
                  LayoutBuilder(builder: (context, constraints) {
                      if (constraints.maxWidth >= Breakpoints.lg) {
                        return SizedBox(
                          width: width * 1.86,
                          height: MediaQuery.of(context).size.height * 2.0,
                          child: GridView.builder(
                            itemCount: vids.length,

                            itemBuilder: (BuildContext context, int index) => SizedBox(
                              child: Intrest(
                                url: vids[index],
                                key: index == 4 ? intrestsKey : null,
                              ),
                            ),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 40.0,
                              crossAxisCount: 3,
                              childAspectRatio: 0.5
                            ),
                          ),
                        );
                      } else if (constraints.maxWidth < Breakpoints.lg &&
                          constraints.maxWidth >= Breakpoints.sm) {
                        return SizedBox(
                          width: width * 0.86,
                          height: MediaQuery.of(context).size.height * 2 ,
                          child: GridView.builder(
                            itemCount: vids.length,
                            itemBuilder: (BuildContext context, int index) => Intrest(
                              url: vids[index],
                              key: index == 2 ? intrestsKey : null,
                            ),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 40.0,
                              crossAxisCount: 2,
                                childAspectRatio: 0.5

                            ),
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: width * 0.76,
                          height: MediaQuery.of(context).size.height * 2.0,
                          child: GridView.builder(
                            itemCount: vids.length,
                            itemBuilder: (BuildContext context, int index) => Intrest(
                              url: vids[index],
                              key: index == 4 ? intrestsKey : null,
                            ),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 40.0,
                              crossAxisCount: 1,
                              childAspectRatio: 0.4
                            ),
                          ),
                        );
                      }
                    }),
                ],
              ),
            ),

            const SizedBox(height:10)

          ],
        ));
  }
}
