import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_easy_stepper/pages/steps/after_take_photo_step.dart';
import 'package:flutter_easy_stepper/pages/steps/finish_step.dart';
import 'package:flutter_easy_stepper/pages/steps/instructions_step.dart';
import 'package:flutter_easy_stepper/pages/steps/planogram_step.dart';
import 'package:flutter_easy_stepper/pages/steps/rules_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_easy_stepper/pages/steps/rating_step.dart';
import 'package:flutter_easy_stepper/pages/steps/complaint_step.dart';
import 'package:flutter_easy_stepper/pages/steps/before_take_photo_step.dart';
import 'package:flutter_easy_stepper/pages/steps/return_step.dart';
import 'package:flutter_easy_stepper/pages/steps/questions_step.dart';
import 'package:flutter_easy_stepper/pages/steps/mechandising_queations.dart';

class EasyStepperWidget extends StatefulWidget {
  const EasyStepperWidget({super.key});

  @override
  State<EasyStepperWidget> createState() => _EasyStepperWidgetState();
}

class _EasyStepperWidgetState extends State<EasyStepperWidget> {
  // Just empty column

  Map<String, String> fifoAnswers = getFifoQuestions();
  final ImagePicker _imagePicker1 = ImagePicker();
  final ImagePicker _imagePicker2 = ImagePicker();
  final List<XFile> _beforeUploadedFiles = [];
  final List<XFile> _afterUploadedFiles = [];
  String? selectedReturnReason;
  String? selectedOption;
  String? otherReason;
  String? complaintAnswer;
  String? complaintOrSuggestion;
  double storeRating = 0;
  int activeStep = 0;

  Future<void> _pickImage1(ImageSource source) async {
    final XFile? image = await _imagePicker1.pickImage(source: source);
    if (image != null) {
      setState(() {
        _beforeUploadedFiles.add(image);
      });
    }
  }

  Future<void> _pickImage2(ImageSource source) async {
    final XFile? image = await _imagePicker2.pickImage(source: source);
    if (image != null) {
      setState(() {
        _afterUploadedFiles.add(image);
      });
    }
  }

  void _removeImage1(int index) {
    setState(() {
      _beforeUploadedFiles.removeAt(index);
    });
  }

  void _removeImage2(int index) {
    setState(() {
      _afterUploadedFiles.removeAt(index);
    });
  }

  Widget _buildStepForm(int step) {
    switch (step) {
      case 0:
        return const InstructionsStep();
      case 1:
        return const PlanogramStep();
      case 2:
        return BeforeTakePhotoStep(
          uploadedFiles: _beforeUploadedFiles,
          onPickImage: _pickImage1,
          onRemoveImage: _removeImage1,
        );
      case 3:
        return ReturnStep(
          selectedOption: selectedOption,
          selectedReason: selectedReturnReason,
          otherReason: otherReason,
          onReturnSelected: (option, reason, other) {
            setState(() {
              selectedOption = option;
              selectedReturnReason = reason;
              otherReason = other;
            });
          },
          onNavigateToReturnPage: () {
            debugPrint("İade Ürün sayfasına yönlendiriliyor...");
          },
        );
      case 4:
        return QuestionsStep(
          fifoAnswers: fifoAnswers,
          onAnswerChanged: (Map<String, String> updatedAnswers) {
            setState(() {
              fifoAnswers = updatedAnswers;
            });
          },
        );
      case 5:
        return ComplaintStep(
          initialComplaintAnswer: complaintAnswer,
          initialComplaintOrSuggestion: complaintOrSuggestion,
          onComplaintChanged: (answer, suggestion) {
            setState(() {
              complaintAnswer = answer;
              complaintOrSuggestion = suggestion;
            });
          },
        );
      case 6:
        return RatingStep(
          initialRating: storeRating,
          onRatingUpdated: (rating) {
            setState(() {
              storeRating = rating;
            });
          },
        );
      case 7:
        return AfterTakePhotoStep(
          uploadedFiles: _afterUploadedFiles,
          onPickImage: _pickImage2,
          onRemoveImage: _removeImage2,
        );
      case 8:
        return FinishStep(
          selectedReturnReason: selectedReturnReason,
          selectedOption: selectedOption,
          otherReason: otherReason,
          fifoAnswers: fifoAnswers,
          complaintAnswer: complaintAnswer,
          complaintOrSuggestion: complaintOrSuggestion,
          storeRating: storeRating,
          beforeUploadedFiles: _beforeUploadedFiles,
          afterUploadedFiles: _afterUploadedFiles,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stepper",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: activeStep == 0
            ? [
                IconButton(
                  icon: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      CupertinoIcons.book,
                      color: Colors.blue,
                      size: 24,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const RulesPage()));
                  },
                ),
              ]
            : null,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildStepForm(activeStep),
              ),
            ),
          ),
          EasyStepper(
            lineStyle: const LineStyle(
              lineType: LineType.normal,
            ),
            activeStep: activeStep,
            direction: Axis.horizontal,
            unreachedStepIconColor: Colors.white,
            unreachedStepBorderColor: Colors.black54,
            finishedStepBackgroundColor: Colors.blue,
            unreachedStepBackgroundColor: Colors.blue.shade200,
            showTitle: false,
            onStepReached: (index) => setState(() => activeStep = index),
            steps: const [
              EasyStep(
                title: 'Instructions',
                icon: Icon(CupertinoIcons.book),
                activeIcon: Icon(CupertinoIcons.book),
              ),
              EasyStep(
                title: 'Instructions',
                icon: Icon(CupertinoIcons.list_bullet),
                activeIcon: Icon(CupertinoIcons.list_bullet),
              ),
              EasyStep(
                title: 'Photo',
                icon: Icon(CupertinoIcons.camera),
                activeIcon: Icon(CupertinoIcons.camera),
              ),
              EasyStep(
                title: 'Return',
                icon: Icon(CupertinoIcons.return_icon),
                activeIcon: Icon(CupertinoIcons.return_icon),
              ),
              EasyStep(
                icon: Icon(CupertinoIcons.square_grid_2x2),
                activeIcon: Icon(CupertinoIcons.square_grid_2x2),
                title: 'Questions',
              ),
              EasyStep(
                icon: Icon(CupertinoIcons.exclamationmark_bubble),
                activeIcon: Icon(CupertinoIcons.exclamationmark_bubble),
                title: 'Complaint',
              ),
              EasyStep(
                icon: Icon(CupertinoIcons.star),
                activeIcon: Icon(CupertinoIcons.star),
                title: 'Rating',
              ),
              EasyStep(
                title: 'Photo',
                icon: Icon(CupertinoIcons.camera),
                activeIcon: Icon(CupertinoIcons.camera),
              ),
              EasyStep(
                icon: Icon(Icons.check_circle_outline),
                activeIcon: Icon(Icons.check_circle_outline),
                title: 'Finish',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Just empty column
}
