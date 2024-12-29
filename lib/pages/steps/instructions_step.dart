import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_stepper/pages/steps/rules_page.dart';

class InstructionsStep extends StatelessWidget {
  const InstructionsStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 75,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              size: 125,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12.0),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Провести  мерчендайзинг ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: 'по  стандартам',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const RulesPage()),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
