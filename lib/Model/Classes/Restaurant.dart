class Restaurants {
  final String phoneNumber ;
  final String nom ;
  final String addresse ;

  Restaurants( {required this.nom , required this.addresse, required this.phoneNumber});
  factory Restaurants.fromJson(Map<String , dynamic> json) {
    return Restaurants(
        nom: json['Nom'],
        addresse: json['Adresse_de_restaurant'],
        phoneNumber: json['Numero_de_telephone'] ,

    ) ;
  }

}