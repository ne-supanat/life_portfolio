import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/index_bloc.dart';
import '../../models/life_model.dart';
import '../constants/life_unit_index_keys.dart';
import '../constants/life_unit_keys.dart';

class InputField extends StatefulWidget {
  const InputField({super.key, required this.index, required this.topic});

  final LifeUnitIndexKey index;
  final LifeUnitKey topic;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late LifeBloc lifeBloc;

  Timer? signalTimer;
  Timer? holdingTimer;

  @override
  void initState() {
    super.initState();
    lifeBloc = BlocProvider.of<LifeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          _button(iconData: Icons.remove, onTap: _decrease),
          const SizedBox(width: 4),
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: BlocBuilder<LifeBloc, LifeModel>(
                buildWhen: (previous, current) {
                  return _value(previous) != _value(current);
                },
                builder: (context, state) {
                  return Text(_value(state).toString());
                },
              ),
            ),
          ),
          const SizedBox(width: 4),
          _button(iconData: Icons.add, onTap: _increase),
        ],
      ),
    );
  }

  Widget _button({
    required IconData iconData,
    required void Function() onTap,
  }) {
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        onTapDown: (details) {
          signalTimer = Timer(const Duration(milliseconds: 500), () {
            _startHolding(onTap);
          });
        },
        onTapUp: (details) {
          _cancelTimer();
        },
        onTapCancel: () {
          _cancelTimer();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            size: 16,
          ),
        ),
      ),
    );
  }

  _startHolding(callback) {
    holdingTimer = Timer(const Duration(milliseconds: 100), () {
      callback();

      _startHolding(callback);
    });
  }

  _cancelTimer() {
    signalTimer?.cancel();
    holdingTimer?.cancel();
  }

  int _value(LifeModel state) {
    switch (widget.index) {
      case LifeUnitIndexKey.importance:
        return state.life[widget.topic]!.importance;
      case LifeUnitIndexKey.timeSpend:
        return state.life[widget.topic]!.timeSpend;
      case LifeUnitIndexKey.satisfaction:
        return state.life[widget.topic]!.satisfaction;
    }
  }

  _decrease() {
    switch (widget.index) {
      case LifeUnitIndexKey.importance:
        lifeBloc.updateUnitImportanceDecrease(widget.topic);
        break;
      case LifeUnitIndexKey.timeSpend:
        lifeBloc.updateUnitTimeSpendDecrease(widget.topic);
        break;
      case LifeUnitIndexKey.satisfaction:
        lifeBloc.updateUnitSatisfactionDecrease(widget.topic);
        break;
    }
  }

  _increase() {
    switch (widget.index) {
      case LifeUnitIndexKey.importance:
        lifeBloc.updateUnitImportanceIncrease(widget.topic);
        break;
      case LifeUnitIndexKey.timeSpend:
        lifeBloc.updateUnitTimeSpendIncrease(widget.topic);
        break;
      case LifeUnitIndexKey.satisfaction:
        lifeBloc.updateUnitSatisfactionIncrease(widget.topic);
        break;
    }
  }
}
