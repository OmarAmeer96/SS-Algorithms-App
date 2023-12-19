import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/Features/info/views/widgets/team_members_column.dart';

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
              alignment: Alignment.topLeft,
              child: Text(
                'Team Members',
                style: Styles.sFProDisplayBold.copyWith(),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const TeamMemberColumn(),
          ],
        ),
      ),
    );
  }
}
