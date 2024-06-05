import 'package:flutter/material.dart';

enum LifeAreaKey {
  relationships,
  bodyMindSpirituality,
  comunitySociety,
  jobLearningFinances,
  interestEntertainment,
  personalCare
}

extension LifeAreaKeyExtension on LifeAreaKey {
  String get name {
    switch (this) {
      case LifeAreaKey.relationships:
        return 'Relationships';
      case LifeAreaKey.bodyMindSpirituality:
        return 'Body, Mind and Spirituality';
      case LifeAreaKey.comunitySociety:
        return 'Comunity and Society';
      case LifeAreaKey.jobLearningFinances:
        return 'Job, Learning and Finances';
      case LifeAreaKey.interestEntertainment:
        return 'Interest and Entertainment';
      case LifeAreaKey.personalCare:
        return 'Personal care';
    }
  }

  Color get color {
    switch (this) {
      case LifeAreaKey.relationships:
        return Colors.red;
      case LifeAreaKey.bodyMindSpirituality:
        return Colors.green;
      case LifeAreaKey.comunitySociety:
        return Colors.blue;
      case LifeAreaKey.jobLearningFinances:
        return Colors.purple;
      case LifeAreaKey.interestEntertainment:
        return Colors.orange;
      case LifeAreaKey.personalCare:
        return Colors.pink;
    }
  }
}

enum LifeUnitKey {
  significantOther,
  family,
  friendship,
  physicalHealth,
  mentalHealth,
  spirituality,
  community,
  societalEngagement,
  job,
  education,
  finances,
  hobbies,
  onlineEntertainment,
  offlineEntertainment,
  physiologicalNeeds,
  activitiesDailyLiving
}

extension LifeUnitKeyExtension on LifeUnitKey {
  LifeAreaKey get area {
    switch (this) {
      case LifeUnitKey.significantOther:
      case LifeUnitKey.family:
      case LifeUnitKey.friendship:
        return LifeAreaKey.relationships;
      case LifeUnitKey.physicalHealth:
      case LifeUnitKey.mentalHealth:
      case LifeUnitKey.spirituality:
        return LifeAreaKey.bodyMindSpirituality;
      case LifeUnitKey.community:
      case LifeUnitKey.societalEngagement:
        return LifeAreaKey.comunitySociety;
      case LifeUnitKey.job:
      case LifeUnitKey.education:
      case LifeUnitKey.finances:
        return LifeAreaKey.jobLearningFinances;
      case LifeUnitKey.hobbies:
      case LifeUnitKey.onlineEntertainment:
      case LifeUnitKey.offlineEntertainment:
        return LifeAreaKey.interestEntertainment;
      case LifeUnitKey.physiologicalNeeds:
      case LifeUnitKey.activitiesDailyLiving:
        return LifeAreaKey.personalCare;
    }
  }

  String get name {
    switch (this) {
      case LifeUnitKey.significantOther:
        return 'Significant Other';
      case LifeUnitKey.family:
        return 'Family';
      case LifeUnitKey.friendship:
        return 'Friendship';
      case LifeUnitKey.physicalHealth:
        return 'Physical health/sports';
      case LifeUnitKey.mentalHealth:
        return 'Mental health/mindfulness';
      case LifeUnitKey.spirituality:
        return 'Spirituality/faith';
      case LifeUnitKey.community:
        return 'Comunity/citizenship';
      case LifeUnitKey.societalEngagement:
        return 'Societal engagement';
      case LifeUnitKey.job:
        return 'Job/Career';
      case LifeUnitKey.education:
        return 'Education/Learning';
      case LifeUnitKey.finances:
        return 'Finances';
      case LifeUnitKey.hobbies:
        return 'Hobbies/interests';
      case LifeUnitKey.onlineEntertainment:
        return 'Online Entertainment';
      case LifeUnitKey.offlineEntertainment:
        return 'Offline Entertainment';
      case LifeUnitKey.physiologicalNeeds:
        return 'Physiological needs';
      case LifeUnitKey.activitiesDailyLiving:
        return 'Activities of daily living';
    }
  }

  String get desc {
    switch (this) {
      case LifeUnitKey.significantOther:
        return 'Time with partner, dates';
      case LifeUnitKey.family:
        return 'Engaging with kids, parents, siblings';
      case LifeUnitKey.friendship:
        return 'Time with friends';
      case LifeUnitKey.physicalHealth:
        return 'Exercise, physical therapy';
      case LifeUnitKey.mentalHealth:
        return 'Psychotherapy, meditation';
      case LifeUnitKey.spirituality:
        return 'Religious practice';
      case LifeUnitKey.community:
        return 'Membership in local clubs, jury duty';
      case LifeUnitKey.societalEngagement:
        return 'Volunteer, activism';
      case LifeUnitKey.job:
        return 'Work';
      case LifeUnitKey.education:
        return 'Classes, training';
      case LifeUnitKey.finances:
        return 'Planing, investing';
      case LifeUnitKey.hobbies:
        return 'Reading, collectibles';
      case LifeUnitKey.onlineEntertainment:
        return 'Social media, TV, gaming';
      case LifeUnitKey.offlineEntertainment:
        return 'Vacation, theatre, sporting events';
      case LifeUnitKey.physiologicalNeeds:
        return 'Eating, sleeping';
      case LifeUnitKey.activitiesDailyLiving:
        return 'Commuting, houseworks';
    }
  }
}
