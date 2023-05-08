import 'package:fastraiteur/Model/Classes/Category.dart';

class Restaurant {
  final String photo ;
  final String nom ;
  final String addresse ;
  final List<Category> categories;

  Restaurant(this.nom, this.photo, this.addresse, this.categories);
}