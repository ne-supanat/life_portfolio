import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: _inputs(),
            ),
            Expanded(
              flex: 2,
              child: _graph(),
            ),
          ],
        ),
      ),
    );
  }

  _inputs() {
    return Column(
      children: [
        Text('test'),
      ],
    );
  }

  _graph() {
    return Column(
      children: [
        Text('test'),
      ],
    );
  }
}
