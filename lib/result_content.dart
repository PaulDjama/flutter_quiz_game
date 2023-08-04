import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResultContent extends StatefulWidget {
  const ResultContent({super.key});

  @override
  State<ResultContent> createState() => _ResultContentState();
}

class _ResultContentState extends State<ResultContent> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'vous avez obtenu 5 bonnes reponses',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Gap(16 * 2),
          Text(
            'reponses',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Gap(16 * 2),
          Text(
            'Recommencer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
