// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_quiz/models/bouton_reponse.dart';

import 'data/questions.dart';

class QuizContent extends StatefulWidget {
  final Function processus;

  const QuizContent({
    Key? key,
    required this.processus,
  }) : super(key: key);

  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  var index = 0;

  void questionSuivante() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeQuestion = monQuiz[index];

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16 * 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              activeQuestion.texte, //'Qui est le premier president du Cameroun?
              style: GoogleFonts.openSans(
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(16 * 4),
            //...activeQuestion.reponses.map(
            ...activeQuestion.qcm().map(
                  (chaqueReponse) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16 / 2,
                    ),
                    child: BoutonReponse(
                        texte: chaqueReponse,
                        clic: () {
                          widget.processus(chaqueReponse);
                          questionSuivante();
                        } //questionSuivante,

                        ),
                  ),
                ),
            //   BoutonReponse(
            //     texte: 'Reponse 1',
            //     clic: questionSuivante, //(){}
            //   ),
            //   const Gap(16),
            //   BoutonReponse(
            //     texte: 'Reponse 2',
            //     clic: questionSuivante,
            //   ),
            //   const Gap(16),
            //   BoutonReponse(
            //     texte: 'Reponse 3',
            //     clic: questionSuivante,
            //   ),
            //   const Gap(16),
            //   BoutonReponse(
            //     texte: 'Reponse 4',
            //     clic: questionSuivante,
            //   ),
          ],
        ),
      ),
    );
  }
}
