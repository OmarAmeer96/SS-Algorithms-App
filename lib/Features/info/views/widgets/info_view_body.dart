import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/Features/info/views/widgets/team_members_column.dart';
import 'package:ss_algorithms_app/Features/info/views/widgets/team_members_item.dart';

class InfoViewBody extends StatelessWidget {
  const InfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Team Members',
                style: Styles.sFProDisplayBold.copyWith(),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const TeamMemberColumn(),
            const SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Under the Guidance of Supervisor',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairoPlay(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const TeamMembersItem(name: "Eng. Ahmed Saber"),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Made With 🧡',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairoPlay(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
