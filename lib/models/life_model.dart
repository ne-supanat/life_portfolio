import 'package:get_it/get_it.dart';

import '../global/constants/life_unit_keys.dart';
import '../global/sharedpref.dart';
import '../global/util.dart';
import 'life_unit_model.dart';

class LifeModel {
  final Map<LifeUnitKey, LifeUnitModel> life;

  final LifeAreaKey? focusedArea;
  final LifeUnitKey? focusedUnit;

  LifeModel(this.life, {this.focusedArea, this.focusedUnit});

  factory LifeModel.i() {
    return LifeModel(
        LifeUnitKey.values.asMap().map((key, value) => MapEntry(value, LifeUnitModel.i())));
  }

  Map<String, dynamic> toJson() {
    return life.map((key, value) => MapEntry(_$LifeUnitEnumMap[key] ?? '', value.toJson()));
  }

  static LifeModel fromJson(Map<String, dynamic> json) {
    return LifeModel(Map<LifeUnitKey, LifeUnitModel>.from(json.map((key, value) =>
        MapEntry(enumDecodeNullable(_$LifeUnitEnumMap, key), LifeUnitModel.fromJson(value)))));
  }

  LifeModel update(Map<LifeUnitKey, LifeUnitModel> life) {
    GetIt.instance<AppSharedPref>().writLife(LifeModel(life));
    return LifeModel(life);
  }

  LifeModel focusArea(LifeAreaKey? area) {
    return LifeModel(life, focusedArea: area);
  }

  LifeModel focusUnit(LifeUnitKey? unit) {
    return LifeModel(life, focusedUnit: unit);
  }

  static const _$LifeUnitEnumMap = {
    LifeUnitKey.significantOther: 'significantOther',
    LifeUnitKey.family: 'family',
    LifeUnitKey.friendship: 'friendship',
    LifeUnitKey.physicalHealth: 'physicalHealth',
    LifeUnitKey.mentalHealth: 'mentalHealth',
    LifeUnitKey.spirituality: 'spirituality',
    LifeUnitKey.community: 'community',
    LifeUnitKey.societalEngagement: 'societalEngagement',
    LifeUnitKey.job: 'job',
    LifeUnitKey.education: 'education',
    LifeUnitKey.finances: 'finances',
    LifeUnitKey.hobbies: 'hobbies',
    LifeUnitKey.onlineEntertainment: 'onlineEntertainment',
    LifeUnitKey.offlineEntertainment: 'offlineEntertainment',
    LifeUnitKey.physiologicalNeeds: 'physiologicalNeeds',
    LifeUnitKey.activitiesDailyLiving: 'activitiesDailyLiving',
  };
}
