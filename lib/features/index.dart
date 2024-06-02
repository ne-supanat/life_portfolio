import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/input_board.dart';

import '../widgets/graph.dart';
import 'index_bloc.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LifeBloc(),
      child: const Scaffold(
        body: SafeArea(
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: InputBoard(),
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Graph(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
