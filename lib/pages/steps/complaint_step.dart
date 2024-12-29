import 'package:flutter/material.dart';

class ComplaintStep extends StatefulWidget {
  final Function(String? complaintAnswer, String? complaintOrSuggestion) onComplaintChanged;
  final String? initialComplaintAnswer;
  final String? initialComplaintOrSuggestion;

  const ComplaintStep({
    super.key,
    required this.onComplaintChanged,
    this.initialComplaintAnswer,
    this.initialComplaintOrSuggestion,
  });

  @override
  State<ComplaintStep> createState() => _ComplaintStepState();
}

class _ComplaintStepState extends State<ComplaintStep> {
  // Just empty column

  String? complaintAnswer;
  String? complaintOrSuggestion;
  late TextEditingController complaintController;

  @override
  void initState() {
    super.initState();
    complaintAnswer = widget.initialComplaintAnswer;
    complaintOrSuggestion = widget.initialComplaintOrSuggestion;
    complaintController = TextEditingController(text: widget.initialComplaintOrSuggestion);
  }

  @override
  void dispose() {
    complaintController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            const Text(
              'Есть ли жалоба или предложение от клиента?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10.0),
            RadioListTile<String>(
              title: const Text('Да'),
              value: 'Да',
              groupValue: complaintAnswer,
              visualDensity: VisualDensity.compact,
              onChanged: (value) {
                setState(() {
                  complaintAnswer = value;
                  complaintOrSuggestion = null;
                  complaintController.clear();
                });
                widget.onComplaintChanged(complaintAnswer, complaintOrSuggestion);
              },
            ),
            RadioListTile<String>(
              title: const Text('Нет'),
              value: 'Нет',
              groupValue: complaintAnswer,
              visualDensity: VisualDensity.compact,
              onChanged: (value) {
                setState(() {
                  complaintAnswer = value;
                  complaintOrSuggestion = null;
                  complaintController.clear();
                });
                widget.onComplaintChanged(complaintAnswer, complaintOrSuggestion);
              },
            ),
            const SizedBox(height: 20),
            if (complaintAnswer == 'Да')
              TextField(
                controller: complaintController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Жалоба или предложение',
                  hintText: 'Пожалуйста, напишите свою жалобу или предложение здесь.',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    complaintOrSuggestion = text;
                  });
                  widget.onComplaintChanged(complaintAnswer, complaintOrSuggestion);
                },
              ),
          ],
        ),
      ),
    );
  }

  // Just empty column
}

