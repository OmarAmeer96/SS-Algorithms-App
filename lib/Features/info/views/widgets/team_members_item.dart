import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/constants.dart';

class TeamMembersItem extends StatelessWidget {
  const TeamMembersItem({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kPrimaryColor,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            name,
            style: Styles.sFProDisplayBold.copyWith(
              fontSize: 24,
              color: kButtonColor2,
            ),
          ),
        ),
      ),
    );
  }
}
