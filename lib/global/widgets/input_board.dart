import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/index_bloc.dart';
import '../constants/life_unit_index_keys.dart';
import '../constants/life_unit_keys.dart';
import 'input_field.dart';

class InputBoard extends StatelessWidget {
  const InputBoard({super.key});

  static const double columnFirstWidth = 132;
  static const double columnWidth = 100;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Tooltip(
                message: 'Importance: 0 - 10\nTime spend: hours per week\nSatisfication: 0 - 10',
                verticalOffset: 8,
                child: Row(
                  children: [
                    Icon(
                      Icons.help,
                      size: 16,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 4),
                    Text('Info')
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    final lifeBloc = BlocProvider.of<LifeBloc>(context);
                    lifeBloc.clear();
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.restart_alt),
                      SizedBox(width: 8),
                      Text('Reset'),
                    ],
                  ))
            ],
          ),
        ),
        _box(
          context,
          area: LifeAreaKey.relationships,
          children: [
            _tableRow(context: context, unit: LifeUnitKey.significantOther),
            _tableRow(context: context, unit: LifeUnitKey.family),
            _tableRow(context: context, unit: LifeUnitKey.friendship),
          ],
        ),
        _box(
          context,
          area: LifeAreaKey.bodyMindSpirituality,
          children: [
            _tableRow(context: context, unit: LifeUnitKey.physicalHealth),
            _tableRow(context: context, unit: LifeUnitKey.mentalHealth),
            _tableRow(context: context, unit: LifeUnitKey.spirituality),
          ],
        ),
        _box(
          context,
          area: LifeAreaKey.comunitySociety,
          children: [
            _tableRow(context: context, unit: LifeUnitKey.community),
            _tableRow(context: context, unit: LifeUnitKey.societalEngagement),
          ],
        ),
        _box(
          context,
          area: LifeAreaKey.jobLearningFinances,
          children: [
            _tableRow(context: context, unit: LifeUnitKey.job),
            _tableRow(context: context, unit: LifeUnitKey.education),
            _tableRow(context: context, unit: LifeUnitKey.finances),
          ],
        ),
        _box(
          context,
          area: LifeAreaKey.interestEntertainment,
          children: [
            _tableRow(context: context, unit: LifeUnitKey.hobbies),
            _tableRow(context: context, unit: LifeUnitKey.onlineEntertainment),
            _tableRow(context: context, unit: LifeUnitKey.offlineEntertainment),
          ],
        ),
        _box(
          context,
          area: LifeAreaKey.personalCare,
          children: [
            _tableRow(context: context, unit: LifeUnitKey.physiologicalNeeds),
            _tableRow(context: context, unit: LifeUnitKey.activitiesDailyLiving),
          ],
        ),
      ],
    );
  }

  Widget _box(BuildContext context, {required LifeAreaKey area, required List<DataRow> children}) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: area.color.withOpacity(0.25), borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {},
            onHover: (value) {
              final lifeBloc = BlocProvider.of<LifeBloc>(context);
              if (value) {
                lifeBloc.updateFocusedArea(area);
              } else {
                lifeBloc.updateFocusedArea(null);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: area.color.withOpacity(0.8),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              ),
              child: Text(
                area.name,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
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

  DataRow _tableRow({required BuildContext context, required LifeUnitKey unit}) {
    return DataRow(
      color: const MaterialStatePropertyAll(Colors.transparent),
      cells: [
        DataCell(
          SizedBox(
            width: columnFirstWidth,
            child: InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              onHover: (value) {
                final lifeBloc = BlocProvider.of<LifeBloc>(context);
                if (value) {
                  lifeBloc.updateFocusedUnit(unit);
                } else {
                  lifeBloc.updateFocusedUnit(null);
                }
              },
              child: Tooltip(
                  message: '${unit.name}:\n${unit.desc}',
                  waitDuration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.only(left: 48),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.help,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(unit.name),
                      ),
                    ],
                  )),
            ),
          ),
        ),
        _inputCell(InputField(unit: unit, index: LifeUnitIndexKey.importance)),
        _inputCell(InputField(unit: unit, index: LifeUnitIndexKey.timeSpend)),
        _inputCell(InputField(unit: unit, index: LifeUnitIndexKey.satisfaction)),
      ],
    );
  }

  DataCell _inputCell(Widget child) {
    return DataCell(SizedBox(width: columnWidth, child: child));
  }
}
