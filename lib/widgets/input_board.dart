import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/index_bloc.dart';
import '../global/constants/life_unit_index_keys.dart';
import '../global/constants/life_unit_keys.dart';

class InputBoard extends StatelessWidget {
  const InputBoard({super.key});

  static const double columnFirstWidth = 132;
  static const double columnWidth = 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _box(
          color: Colors.blue.shade100,
          area: LifeAreaKey.relationships,
          children: [
            _tableRow(context: context, topic: LifeUnitKey.significantOther),
            _tableRow(context: context, topic: LifeUnitKey.family),
            _tableRow(context: context, topic: LifeUnitKey.friendship),
          ],
        ),
        _box(
          color: Colors.blue.shade100,
          area: LifeAreaKey.bodyMindSpirituality,
          children: [
            _tableRow(context: context, topic: LifeUnitKey.physicalHealth),
            _tableRow(context: context, topic: LifeUnitKey.mentalHealth),
            _tableRow(context: context, topic: LifeUnitKey.spirituality),
          ],
        ),
        _box(
          color: Colors.blue.shade100,
          area: LifeAreaKey.comunitySociety,
          children: [
            _tableRow(context: context, topic: LifeUnitKey.community),
            _tableRow(context: context, topic: LifeUnitKey.societalEngagement),
          ],
        ),
        _box(
          color: Colors.blue.shade100,
          area: LifeAreaKey.jobLearningFinances,
          children: [
            _tableRow(context: context, topic: LifeUnitKey.job),
            _tableRow(context: context, topic: LifeUnitKey.education),
            _tableRow(context: context, topic: LifeUnitKey.finances),
          ],
        ),
        _box(
          color: Colors.blue.shade100,
          area: LifeAreaKey.interestEntertainment,
          children: [
            _tableRow(context: context, topic: LifeUnitKey.hobbies),
            _tableRow(context: context, topic: LifeUnitKey.onlineEntertainment),
            _tableRow(context: context, topic: LifeUnitKey.offlineEntertainment),
          ],
        ),
        _box(
          color: Colors.blue.shade100,
          area: LifeAreaKey.personalCare,
          children: [
            _tableRow(context: context, topic: LifeUnitKey.physiologicalNeeds),
            _tableRow(context: context, topic: LifeUnitKey.activitiesDailyLiving),
          ],
        ),
      ],
    );
  }

  Widget _box({required LifeAreaKey area, required List<DataRow> children, required Color color}) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(color: color.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Text(
              area.name,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 10,
              headingRowHeight: 40,
              columns: _tableHeader(),
              rows: children,
            ),
          )
        ],
      ),
    );
  }

  List<DataColumn> _tableHeader() {
    return [
      const DataColumn(label: SizedBox(width: columnFirstWidth)),
      DataColumn(label: _htableHeaderCell(text: 'Importance')),
      DataColumn(label: _htableHeaderCell(text: 'Time Spend')),
      DataColumn(label: _htableHeaderCell(text: 'Satisfaction')),
    ];
  }

  Widget _htableHeaderCell({required String text}) {
    return SizedBox(
      width: columnWidth,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }

  DataRow _tableRow({required BuildContext context, required LifeUnitKey topic}) {
    return DataRow(
      color: const MaterialStatePropertyAll(Colors.transparent),
      cells: [
        DataCell(
          SizedBox(
            width: columnFirstWidth,
            child: Row(
              children: [
                Tooltip(
                    message: topic.desc,
                    child: const Icon(
                      Icons.help,
                      size: 16,
                      color: Colors.grey,
                    )),
                const SizedBox(width: 8),
                Expanded(child: Text(topic.name)),
              ],
            ),
          ),
        ),
        _inputCell(_input(topic: topic, index: LifeUnitIndexKey.importance)),
        _inputCell(_input(topic: topic, index: LifeUnitIndexKey.timeSpend)),
        _inputCell(_input(topic: topic, index: LifeUnitIndexKey.satisfaction)),
      ],
    );
  }

  DataCell _inputCell(Widget child) {
    return DataCell(SizedBox(width: columnWidth, child: child));
  }

  Widget _input({
    required LifeUnitKey topic,
    required LifeUnitIndexKey index,
  }) {
    return BlocBuilder<LifeBloc, LifeModel>(
      builder: (context, state) {
        final lifeBloc = BlocProvider.of<LifeBloc>(context);

        int value() {
          switch (index) {
            case LifeUnitIndexKey.importance:
              return state.life[topic]!.importance;
            case LifeUnitIndexKey.timeSpend:
              return state.life[topic]!.timeSpend;
            case LifeUnitIndexKey.satisfaction:
              return state.life[topic]!.satisfaction;
          }
        }

        decrease(LifeUnitIndexKey index) {
          switch (index) {
            case LifeUnitIndexKey.importance:
              lifeBloc.updateUnitImportanceDecrease(topic);
              break;
            case LifeUnitIndexKey.timeSpend:
              lifeBloc.updateUnitTimeSpendDecrease(topic);
              break;
            case LifeUnitIndexKey.satisfaction:
              lifeBloc.updateUnitSatisfactionDecrease(topic);
              break;
          }
        }

        increase(LifeUnitIndexKey index) {
          switch (index) {
            case LifeUnitIndexKey.importance:
              lifeBloc.updateUnitImportanceIncrease(topic);
              break;
            case LifeUnitIndexKey.timeSpend:
              lifeBloc.updateUnitTimeSpendIncrease(topic);
              break;
            case LifeUnitIndexKey.satisfaction:
              lifeBloc.updateUnitSatisfactionIncrease(topic);
              break;
          }
        }

        return SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () => decrease(index),
                icon: const Icon(Icons.remove),
                iconSize: 16,
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(value().toString()),
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                onPressed: () => increase(index),
                icon: const Icon(Icons.add),
                iconSize: 16,
                visualDensity: VisualDensity.compact,
              )
            ],
          ),
        );
      },
    );
  }
}
