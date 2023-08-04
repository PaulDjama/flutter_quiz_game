// ignore_for_file: public_member_api_docs, sort_constructors_first

class Personne {
  final String nom;
  final String prenom;
  final bool sexe;
  final DateTime dateDeNaissance;
  final String nationalite;
  final int id;
  const Personne({
    required this.nom,
    required this.prenom,
    required this.sexe,
    required this.dateDeNaissance,
    required this.nationalite,
    required this.id,
  });
}
