import 'package:co_working_app/models/user.dart';

import 'category.dart';

class Coworking {

  String coworkingId;
  String name;
  String city;
  String address;
  String image;
  double rating;
  int numberOfMembers;
  int price;
  List<Category> coworkingEquipments;
  User user;
  List<User> participants;

  Coworking({this.coworkingId, this.name, this.city, this.address, this.image,
    this.rating, this.numberOfMembers, this.price, this.coworkingEquipments, this.user, this.participants});
}
