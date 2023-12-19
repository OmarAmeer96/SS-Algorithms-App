import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Features/info/views/widgets/team_members_item.dart';

class TeamMemberColumn extends StatelessWidget {
  const TeamMemberColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TeamMembersItem(name: "Omar Ameer"),
        SizedBox(
          height: 10,
        ),
        TeamMembersItem(name: "Omar Khaled"),
        SizedBox(
          height: 10,
        ),
        TeamMembersItem(name: "Omar Fawzy"),
        SizedBox(
          height: 10,
        ),
        TeamMembersItem(name: "Mohamed Samy"),
        SizedBox(
          height: 10,
        ),
        TeamMembersItem(name: "Mohamed Alaa"),
      ],
    );
  }
}
