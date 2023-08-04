import 'package:flutter/material.dart';

class BoutonReponse extends StatelessWidget {
  final String texte;
  final Function clic;

  const BoutonReponse({
    Key? key,
    required this.texte,
    required this.clic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        clic();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1D0561),
        padding: const EdgeInsets.symmetric(
          horizontal: 16 * 4,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        texte,
        textAlign: TextAlign.center,
      ),
    );
  }
}
