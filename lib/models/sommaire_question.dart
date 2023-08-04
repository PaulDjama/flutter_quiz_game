import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SommaireQuestion extends StatelessWidget {
  final int numQuestion;
  final String texteQuestion;
  final String bonneReponse;
  final String reponseChoisie;

  const SommaireQuestion({
    Key? key,
    required this.numQuestion,
    required this.texteQuestion,
    required this.bonneReponse,
    required this.reponseChoisie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$numQuestion',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(16 * 2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                texteQuestion,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              const Gap(16 / 2),
              Text(
                bonneReponse,
                style: const TextStyle(
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const Gap(16 / 2),
              Text(
                reponseChoisie,
                style: TextStyle(
                  color: reponseChoisie == bonneReponse
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
