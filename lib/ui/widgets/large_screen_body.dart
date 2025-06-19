import 'package:flutter/material.dart';

class LargeScreenBody extends StatelessWidget {
  const LargeScreenBody({
    super.key,
    required this.largePaneBody,
    required this.smallPaneBody,
  });
  final List<Widget> smallPaneBody;
  final List<Widget> largePaneBody;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 412, child: Column(children: smallPaneBody)),
        VerticalDivider(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: largePaneBody,
          ),
        ),
      ],
    );
  }
}
