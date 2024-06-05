class LifeUnitModel {
  final int importance;
  final int timeSpend;
  final int satisfaction;

  LifeUnitModel(this.importance, this.timeSpend, this.satisfaction);

  factory LifeUnitModel.i() {
    return LifeUnitModel(0, 0, 0);
  }

  Map<String, dynamic> toJson() {
    return {
      'importance': importance,
      'timeSpend': timeSpend,
      'satisfaction': satisfaction,
    };
  }

  static LifeUnitModel fromJson(Map<String, dynamic> json) {
    return LifeUnitModel(
      json['importance'],
      json['timeSpend'],
      json['satisfaction'],
    );
  }

  LifeUnitModel copywith({int? importance, int? timeSpend, int? satisfaction}) {
    return LifeUnitModel(
      importance ?? this.importance,
      timeSpend ?? this.timeSpend,
      satisfaction ?? this.satisfaction,
    );
  }
}
