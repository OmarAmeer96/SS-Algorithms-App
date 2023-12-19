import 'package:flutter/material.dart';
import 'package:ss_algorithms_app/Features/change_ip/views/widgets/change_ip_view_body.dart';

class ChangeIpView extends StatelessWidget {
  const ChangeIpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const ChangeIpViewBody(),
    );
  }
}
