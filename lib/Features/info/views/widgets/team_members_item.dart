import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/constants.dart';
import 'package:confetti/confetti.dart'; // Import the confetti package

class TeamMembersItem extends StatefulWidget {
  const TeamMembersItem({
    super.key,
    required this.name,
  });

  final String name;

  @override
  // ignore: library_private_types_in_public_api
  _TeamMembersItemState createState() => _TeamMembersItemState();
}

class _TeamMembersItemState extends State<TeamMembersItem> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _confettiController.play();
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: kPrimaryColor,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  widget.name,
                  style: Styles.sFProDisplayBold.copyWith(
                    fontSize: 24,
                    color: kButtonColor2,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              gravity: 0,
              confettiController: _confettiController,
            ),
          ),
        ],
      ),
    );
  }
}
