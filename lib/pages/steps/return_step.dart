import 'package:flutter/material.dart';

class ReturnStep extends StatefulWidget {
  final void Function(String? option, String? reason, String? otherReason) onReturnSelected;
  final void Function() onNavigateToReturnPage;
  final String? selectedOption;
  final String? selectedReason;
  final String? otherReason;

  const ReturnStep({
    super.key,
    required this.onReturnSelected,
    required this.onNavigateToReturnPage,
    this.selectedOption,
    this.selectedReason,
    this.otherReason,
  });

  @override
  State<ReturnStep> createState() => _ReturnStepState();
}

class _ReturnStepState extends State<ReturnStep> {
  late TextEditingController otherReasonController;
  String? selectedOption;
  String? selectedReason;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
    selectedReason = widget.selectedReason;
    otherReasonController = TextEditingController(text: widget.otherReason);
  }

  @override
  void dispose() {
    super.dispose();
    otherReasonController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Есть ли товары, которые нужно вернуть?',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Column(
          children: [
            RadioListTile<String>(
              title: const Text('Да'),
              value: 'Да',
              visualDensity: VisualDensity.compact,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
                widget.onReturnSelected(selectedOption, null, null);
                widget.onNavigateToReturnPage();
              },
            ),
            RadioListTile<String>(
              title: const Text('Нет'),
              value: 'Нет',
              visualDensity: VisualDensity.compact,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
                widget.onReturnSelected(selectedOption, null, null);
              },
            ),
          ],
        ),
      ],
    );
  }

  // Just empty
}
