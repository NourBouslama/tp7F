class ListEtud {
  int id;
  String nom;
  String prenom;
  String dateNais;
  ListEtud(this.id, this.nom, this.prenom,  this.dateNais);
  Map<String, dynamic> toMap() {
    return {
      'id': (id == 0) ? null : id,
      'nom': nom,
      'prenom': prenom,
      'dateNais': dateNais
    };
  }
}