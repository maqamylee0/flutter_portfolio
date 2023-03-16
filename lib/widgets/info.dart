import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/custom_colors.dart';

class Info extends StatelessWidget {
  final double width;
  final double ratio;
  const Info({required this.width,required this.ratio ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width * ratio),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child:   Text('Achievements',
                style: GoogleFonts.getFont('Delius',
                    color: Colors.white, fontSize: 30)),
          ),
          Text(
              '• Graduated top of class with Bachelors of Science in Computer Science from Makerere University 2023',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 20)),
          const SizedBox(height: 20),
          Text(
              '• Women Techsters Fellow 2022- 2023 ,Mobile Application Development ',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 20)),

          const SizedBox(height: 20),
          Text('• Founder MpaMpe.(MTN Hackathon First Runners Up 2022)',
              style: GoogleFonts.getFont('Delius',
                  color: CustomColors.gray, fontSize: 20)),
        ],
      ),
    );
  }
}
