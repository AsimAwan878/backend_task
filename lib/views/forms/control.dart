
import 'package:flutter/material.dart';

class Controls extends StatelessWidget {
  ///
  const Controls();

  Widget get _space => const SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _space,
          _space,
          _space,
          _space,
          _space,
        ],
      ),
    );
  }
}
