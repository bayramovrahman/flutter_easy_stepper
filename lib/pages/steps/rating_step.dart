import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; 

class RatingStep extends StatefulWidget {
  final double initialRating;
  final void Function(double rating) onRatingUpdated;

  const RatingStep({
    super.key,
    required this.initialRating,
    required this.onRatingUpdated,
  });

  @override
  State<RatingStep> createState() => _RatingStepState();
}

class _RatingStepState extends State<RatingStep> {
  late double storeRating;

  @override
  void initState() {
    super.initState();
    storeRating = widget.initialRating; 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Какую оценку вы хотите дать магазину?',
          style: TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        RatingBar.builder(
          initialRating: storeRating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 60.0,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              storeRating = rating;
            });
            widget.onRatingUpdated(storeRating);
          },
        ),
      ],
    );
  }
}
