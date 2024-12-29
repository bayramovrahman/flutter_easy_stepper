import 'package:flutter/material.dart';

class QuestionsStep extends StatelessWidget {
  final Map<String, String> fifoAnswers;
  final ValueChanged<Map<String, String>> onAnswerChanged;

  const QuestionsStep({super.key, required this.fifoAnswers, required this.onAnswerChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: fifoAnswers.keys.map((question) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Да'),
                    value: 'Да',
                    groupValue: fifoAnswers[question],
                    onChanged: (value) {
                      fifoAnswers[question] = value!;
                      onAnswerChanged(fifoAnswers);
                    },
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Нет'),
                    value: 'Нет',
                    groupValue: fifoAnswers[question],
                    onChanged: (value) {
                      fifoAnswers[question] = value!;
                      onAnswerChanged(fifoAnswers);
                    },
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        );
      }).toList(),
    );
  }
}
