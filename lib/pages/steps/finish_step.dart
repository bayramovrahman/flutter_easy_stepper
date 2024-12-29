import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';

class FinishStep extends StatelessWidget {
  final String? selectedReturnReason;
  final String? selectedOption;
  final String? otherReason;
  final Map<String, String> fifoAnswers;
  final String? complaintAnswer;
  final String? complaintOrSuggestion;
  final double storeRating;
  final List<XFile> beforeUploadedFiles;
  final List<XFile> afterUploadedFiles;

  const FinishStep({
    super.key,
    required this.selectedReturnReason,
    required this.selectedOption,
    required this.otherReason,
    required this.fifoAnswers,
    required this.complaintAnswer,
    required this.complaintOrSuggestion,
    required this.storeRating,
    required this.beforeUploadedFiles,
    required this.afterUploadedFiles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Общий контроль',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10.0),
        Text('Причина возврата : ${selectedReturnReason ?? "Нет"}'),
        Text('Выбранный вариант возврата : ${selectedOption ?? "Нет"}'),
        Text('Другая причина: ${otherReason ?? "Нет"}'),
        const SizedBox(height: 20),
        const Text('Вопросы FIFO:'),
        for (var entry in fifoAnswers.entries)
          Text('${entry.key} : ${entry.value}'),
        const SizedBox(height: 20),
        Text('Жалоба : ${complaintAnswer ?? "Нет"}'),
        Text('Предложение или жалоба : ${complaintOrSuggestion ?? "Нет"}'),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text(
              'Рейтинг магазина:',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(width: 5.0),
            RatingBarIndicator(
              rating: storeRating,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        const Center(child: Text("До Mерчендайзинга", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))),
        const SizedBox(height: 10.0),
        beforeUploadedFiles.isNotEmpty
            ? GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: beforeUploadedFiles.length,
                itemBuilder: (context, index) {
                  final file = beforeUploadedFiles[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      File(file.path),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              )
            : const Text('Нет загруженных файлов'),

        const SizedBox(height: 20.0),
        const Center(child: Text("После Mерчендайзинга", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))),
        const SizedBox(height: 10.0),
        afterUploadedFiles.isNotEmpty
            ? GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: afterUploadedFiles.length,
                itemBuilder: (context, index) {
                  final file = afterUploadedFiles[index];
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      File(file.path),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              )
            : const Text('Нет загруженных файлов'),

        const SizedBox(height: 20.0),
        SizedBox(
          width: double.infinity,
          child: CupertinoButton(
            padding: const EdgeInsets.symmetric(vertical: 15),
            color: CupertinoColors.activeBlue,
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.paperplane_fill, color: Colors.white),
                SizedBox(width: 10),
                Text('Oтправить', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}