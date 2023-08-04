import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer_content.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/quiz_content.dart';

import 'welcome_content.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var activecontent = 'welcome-content';
  List<String> reponsesChoisies = [];

  void update() {
    setState(() {
      activecontent = 'quiz-content';
    });
  }

  void reset() {
    setState(() {
      reponsesChoisies.clear();
      activecontent = 'welcome-content';
    });
  }

  void repondre(String reponse) {
    reponsesChoisies.add(reponse);

    if (reponsesChoisies.length == monQuiz.length) {
      setState(() {
        activecontent = 'answer-content';
      });
    }
  }

  void repondons(String reponse) {
    reponsesChoisies.add(reponse);
  }

  bool verifionsSiCestFini() {
    return reponsesChoisies.length == monQuiz.length;
  }

  void okCestVraimentFini() {
    setState(() {
      activecontent = 'answer-content';
    });
  }

  // void processusDeReponse(String reponse) {
  //   repondons(reponse);
  //   if (verifionsSiCestFini() == true) {
  //     okCestVraimentFini();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Widget? content;

    if (activecontent == 'welcome-content') {
      content = WelcomeContent(bouton: update);
    }

    if (activecontent == 'quiz-content') {
      content = QuizContent(processus: repondre);
    }

    if (activecontent == 'answer-content') {
      content = AnswerContent(
        reponsesChoisies: reponsesChoisies,
        onReinitialiser: reset,
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xff32128B),
      body: content,
    );
  }
}
