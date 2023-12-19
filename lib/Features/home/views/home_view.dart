import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/Features/change_ip/views/change_ip_view.dart';
import 'package:ss_algorithms_app/Features/home/views/widgets/home_view_body.dart';
import 'package:ss_algorithms_app/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChangeIpView(),
              ),
            );
          },
          icon: const Icon(
            Icons.settings,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const ChangeIpView(),
              //   ),
              // );
            },
            icon: const Icon(
              Icons.info_outline_rounded,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          "Software Security Project",
          style: Styles.sFProDisplayBold.copyWith(
            fontSize: 22,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: const HomeViewBody(),
    );
  }
}
