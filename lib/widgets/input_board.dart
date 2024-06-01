import 'package:flutter/material.dart';

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
          area: 'Relationships',
          children: [
            _tableRow(topic: 'Significant Other', tooltip: 'Time with partner, dates'),
            _tableRow(topic: 'Family', tooltip: 'Engaging with kids, parents, siblings'),
            _tableRow(topic: 'Friendship', tooltip: 'Time with friends'),
          ],
        ),
        _box(
          color: Colors.blue.shade100,
          area: 'Body, Mind and Spirituality',
          children: [
            _tableRow(topic: 'Physical health/sports', tooltip: 'Exercise, physical therapy'),
            _tableRow(topic: 'Mental health/mindfulness', tooltip: 'Psychotherapy, meditation'),
            _tableRow(topic: 'spirituality/faith', tooltip: 'Religious practice'),
          ],
        ),
        _box(
          color: Colors.blue.shade100,
          area: 'Comunity and Society',
          children: [
            _tableRow(
                topic: 'Comunity/citizenship', tooltip: 'Membership in local clubs, jury duty'),
            _tableRow(topic: 'Societal engagement', tooltip: 'Volunteer, activism'),
          ],
        ),
        _box(
          color: Colors.blue.shade100,
          area: 'Job, Learning and Finances',
          children: [
            _tableRow(topic: 'Job/Career', tooltip: 'Work'),
            _tableRow(topic: 'Education/Learning', tooltip: 'Classes, training'),
            _tableRow(topic: 'Finances', tooltip: 'Planing, investing'),
          ],
        ),
        _box(
          color: Colors.blue.shade100,
          area: 'Interest and Entertainment',
          children: [
            _tableRow(topic: 'Hobbies/interests', tooltip: 'Reading, collectibles'),
            _tableRow(topic: 'Online Entertainment', tooltip: 'Social media, TV, gaming'),
            _tableRow(
                topic: 'Offline Entertainment', tooltip: 'Vacation, theatre, sporting events'),
          ],
        ),
        _box(
          color: Colors.blue.shade100,
          area: 'Personal care',
          children: [
            _tableRow(topic: 'Physiological needs', tooltip: 'Eating, sleeping'),
            _tableRow(topic: 'activities of daily living', tooltip: 'Commuting, houseworks'),
          ],
        ),
      ],
    );
  }

  Widget _box({required String area, required List<DataRow> children, required Color color}) {
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
              area,
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

  DataRow _tableRow({required String topic, required String tooltip}) {
    return DataRow(cells: [
      DataCell(
        SizedBox(
          width: columnFirstWidth,
          child: Row(
            children: [
              Tooltip(
                  message: tooltip,
                  child: const Icon(
                    Icons.help,
                    size: 16,
                    color: Colors.grey,
                  )),
              const SizedBox(width: 8),
              Expanded(child: Text(topic)),
            ],
          ),
        ),
      ),
      DataCell(SizedBox(width: columnWidth, child: _input())),
      DataCell(SizedBox(width: columnWidth, child: _input())),
      DataCell(SizedBox(width: columnWidth, child: _input())),
    ]);
  }

  Widget _input() {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove),
            iconSize: 16,
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: FittedBox(
              child: Text('10'),
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(width: 4),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            iconSize: 16,
            visualDensity: VisualDensity.compact,
          )
        ],
      ),
    );
  }
}
