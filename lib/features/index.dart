import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:life_portfolio/global/sharedpref.dart';
import 'package:life_portfolio/global/util.dart';
import '../global/widgets/input_board.dart';

import '../global/widgets/graph.dart';
import '../models/life_model.dart';
import 'index_bloc.dart';

class Index extends StatelessWidget {
  const Index({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final savedLife = GetIt.instance<AppSharedPref>().getLife();
        return LifeBloc(savedLife ?? LifeModel.i());
      },
      child: Scaffold(
        body: SafeArea(
          child: isSmallDevice(context) ? _smallLayout() : _largeLayout(),
        ),
      ),
    );
  }

  _largeLayout() {
    return const Row(
      children: [
        Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: InputBoard(),
            )),
        Expanded(
          flex: 3,
          child: ClipRRect(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Graph(),
            ),
          ),
        ),
      ],
    );
  }

  _smallLayout() {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          ClipRRect(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: AspectRatio(
                aspectRatio: 1,
                child: Graph(),
              ),
            ),
          ),
          SizedBox(height: 8),
          InputBoard(),
        ],
      ),
    );
  }
}
