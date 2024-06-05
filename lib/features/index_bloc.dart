import 'package:flutter_bloc/flutter_bloc.dart';
import '../global/constants/life_unit_keys.dart';
import '../models/life_model.dart';
import '../models/life_unit_model.dart';

class LifeBloc extends Cubit<LifeModel> {
  LifeBloc(this.lifeModel) : super(lifeModel);

  final LifeModel lifeModel;

  updateFocusedArea(LifeAreaKey? area) {
    emit(state.focusArea(area));
  }

  updateFocusedUnit(LifeUnitKey? unit) {
    emit(state.focusUnit(unit));
  }

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

  clear() {
    emit(state.update(LifeModel.i().life));
  }
}
