import 'package:flutter/material.dart';

import '../../core/theme/index.dart';

class CommingSoonPage extends StatefulWidget {
  const CommingSoonPage({super.key, required this.shell});
  final bool shell;

  @override
  State<CommingSoonPage> createState() => _CommingSoonPageState();
}

class _CommingSoonPageState extends State<CommingSoonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !widget.shell
          ? null
          : AppBar(
              title: const Text('Comming Soon Page'),
            ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsDirectional.all(20),
          children: const [
            MainCard(
              child: Column(
                children: [
                  /// comming soon page

                  TitleText('Comming Soon Page'),
                  SizedBox(height: 20),
                  Icon(
                    Icons.build,
                    size: 100,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
