class Question {
  final String texte;
  final List<String> reponses;
  const Question({
    required this.texte,
    required this.reponses,
  });

  List<String> qcm() {
    final lesReponses = List.of(reponses);
    //reponses.shuffle(); //melanger la liste
    lesReponses.shuffle();
    return lesReponses;
  }
}
