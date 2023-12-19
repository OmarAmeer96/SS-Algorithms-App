import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Core/utils/styles.dart';
import 'package:ss_algorithms_app/Features/change_ip/views/widgets/change_ip_view_body.dart';
import 'package:ss_algorithms_app/Features/home/views/widgets/home_view_body.dart';
import 'package:ss_algorithms_app/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.settings_outlined,
        size: 26,
      ),
      const Icon(
        Icons.home_outlined,
        size: 26,
      ),
      const Icon(
        Icons.info_outline_rounded,
        size: 26,
      ),
    ];
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Software Security Project",
          style: Styles.sFProDisplayBold.copyWith(
            fontSize: 22,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // Design
        height: 55.0,
        color: kPrimaryColor,
        buttonBackgroundColor: kButtonColor2,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 200),

        // Impo
        items: items,
        index: index,
        onTap: (index) => setState(() => this.index = index),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (index) {
      case 0:
        return const ChangeIpViewBody();
      case 1:
        return const HomeViewBody();
      case 2:
        return Container();
      default:
        return Container();
    }
  }
}
