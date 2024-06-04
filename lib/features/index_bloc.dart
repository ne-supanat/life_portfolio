import 'package:flutter_bloc/flutter_bloc.dart';

import '../global/constants/life_unit_keys.dart';

class LifeModel {
  final Map<LifeUnitKey, LifeUnitModel> life;

  LifeModel(this.life);

  factory LifeModel.i() {
    return LifeModel(
        LifeUnitKey.values.asMap().map((key, value) => MapEntry(value, LifeUnitModel.i())));
  }

  LifeModel update(Map<LifeUnitKey, LifeUnitModel> life) {
    return LifeModel(life);
  }
}

class LifeUnitModel {
  final int importance;
  final int timeSpend;
  final int satisfaction;

  LifeUnitModel(this.importance, this.timeSpend, this.satisfaction);

  factory LifeUnitModel.i() {
    return LifeUnitModel(0, 0, 0);
  }

  LifeUnitModel copywith({int? importance, int? timeSpend, int? satisfaction}) {
    return LifeUnitModel(
      importance ?? this.importance,
      timeSpend ?? this.timeSpend,
      satisfaction ?? this.satisfaction,
    );
  }
}

class LifeBloc extends Cubit<LifeModel> {
  LifeBloc() : super(LifeModel.i());

  updateUnitImportanceIncrease(LifeUnitKey key) {
    final tempLife = Map<LifeUnitKey, LifeUnitModel>.from(state.life);
    final unit = tempLife[key];
    if (unit != null && unit.importance < 10) {
      tempLife[key] = unit.copywith(importance: unit.importance + 1);
      emit(state.update(tempLife));
    }
  }

  updateUnitImportanceDecrease(LifeUnitKey key) {
    final tempLife = Map<LifeUnitKey, LifeUnitModel>.from(state.life);
    final unit = state.life[key];
    if (unit != null && unit.importance > 0) {
      tempLife[key] = unit.copywith(importance: unit.importance - 1);
      emit(state.update(tempLife));
    }
  }

  updateUnitTimeSpendIncrease(LifeUnitKey key) {
    final tempLife = Map<LifeUnitKey, LifeUnitModel>.from(state.life);
    final unit = state.life[key];
    if (unit != null) {
      tempLife[key] = unit.copywith(timeSpend: unit.timeSpend + 1);
      emit(state.update(tempLife));
    }
  }

  updateUnitTimeSpendDecrease(LifeUnitKey key) {
    final tempLife = Map<LifeUnitKey, LifeUnitModel>.from(state.life);
    final unit = state.life[key];
    if (unit != null && unit.timeSpend > 0) {
      tempLife[key] = unit.copywith(timeSpend: unit.timeSpend - 1);
      emit(state.update(tempLife));
    }
  }

  updateUnitSatisfactionIncrease(LifeUnitKey key) {
    final tempLife = Map<LifeUnitKey, LifeUnitModel>.from(state.life);
    final unit = state.life[key];
    if (unit != null && unit.satisfaction < 10) {
      tempLife[key] = unit.copywith(satisfaction: unit.satisfaction + 1);
      emit(state.update(tempLife));
    }
  }

  updateUnitSatisfactionDecrease(LifeUnitKey key) {
    final tempLife = Map<LifeUnitKey, LifeUnitModel>.from(state.life);
    final unit = state.life[key];
    if (unit != null && unit.satisfaction > 0) {
      tempLife[key] = unit.copywith(satisfaction: unit.satisfaction - 1);
      emit(state.update(tempLife));
    }
  }
}
