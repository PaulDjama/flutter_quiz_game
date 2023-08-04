// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/models/sommaire_question.dart';

class AnswerContent extends StatelessWidget {
  final Function onReinitialiser;
  final List<String> reponsesChoisies;
  const AnswerContent({
    Key? key,
    required this.onReinitialiser,
    required this.reponsesChoisies,
  }) : super(key: key);

  List<Map<String, Object>> statistique() {
    List<Map<String, Object>> liste = [];

    for (int i = 0; i < monQuiz.length; i++) {
      liste.add({
        'numQuestion': i + 1,
        'texteQuestion': monQuiz[i].texte,
        'bonneReponse': monQuiz[i].reponses[0],
        'reponseChoisie': reponsesChoisies[i],
      });
    }
    return liste;
  }

  @override
  Widget build(BuildContext context) {
    final stats = statistique();
    final nombreTotal = monQuiz.length;
    final reponsesVraies = stats
        .where((chaqueElement) =>
            chaqueElement['bonneReponse'] == chaqueElement['reponseChoisie'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16 * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Vous avez trouvé $reponsesVraies questions sur $nombreTotal',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(16 * 3),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...stats.map(
                      (chaqueMap) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                        ),
                        child: SommaireQuestion(
                          numQuestion: chaqueMap['numQuestion'] as int,
                          texteQuestion: chaqueMap['texteQuestion'] as String,
                          bonneReponse: chaqueMap['bonneReponse'] as String,
                          reponseChoisie: chaqueMap['reponseChoisie'] as String,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(16 * 3),
            TextButton(
              onPressed: () {
                onReinitialiser();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
              ),
              child: const Text('REESSAYER'),
            ),
          ],
        ),
      ),
    );
  }
}
