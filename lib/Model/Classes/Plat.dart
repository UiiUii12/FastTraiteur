class Plat {
  final String nom ;
  final String description ;
  final String categorie ;
  final double prix ;
  final int id_restaurant ;
  Plat( {required this.nom, required this.prix, required this.description, required this.categorie ,required this.id_restaurant,});
  factory Plat.fromJson(Map<String , dynamic> json) {
    return Plat(
      nom: json['Nom'],
      description: json['description'] ,
      categorie: json['categorie'] ,
      prix: json['prix'],
      id_restaurant: json["restau"]

    ) ;
  }
}