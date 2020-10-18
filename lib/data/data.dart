import 'package:co_working_app/models/category.dart';
import 'package:co_working_app/models/user.dart';
import 'package:co_working_app/models/coworking.dart';
import 'package:co_working_app/utils/assets_utils.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// Category
final _categoryCafe =
      Category( name: "Cafe", color: 0xFF52CBF8, icon: MdiIcons.coffeeMaker, iconColor: 0, iconPath: getIconCoffeeMug());
final _categoryOffice =
      Category(name: "Office", color: 0xFF96BE57, icon: MdiIcons.officeBuilding, iconColor: 0, iconPath: "");
final _categorySpace =
      Category(name: "Space", color: 0xFFFF8987, icon: MdiIcons.spaceStation, iconColor: 0, iconPath: getIconHomeOutline());
final _categorySeeAll =
      Category(name: "See All", color: 0xFFA986FF, icon: MdiIcons.selectAll, iconColor: 0, iconPath: getIconVisualization2());

List<Category> categories2() {
  return <Category> [
    _categoryCafe,
    _categoryOffice,
    _categorySpace,
    _categorySeeAll
  ];
}

// Coworking equipments
final _equipmentWifi =
      Category(name: "Wifi", color: 0xFFECEFF1, icon: MdiIcons.wifi, iconColor: 0xFF7049FA, iconPath: "");
final _equipmentAC =
      Category(name: "AC", color: 0xFFECEFF1, icon: MdiIcons.printer, iconColor: 0xFF7049FA, iconPath: "");
final _equipmentFood =
      Category(name: "Food", color: 0xFFECEFF1, icon: MdiIcons.food, iconColor: 0xFF7049FA, iconPath: getFoodServing());
final _equipmentSpace =
      Category(name: "Coffee", color: 0xFFECEFF1, icon: MdiIcons.coffeeToGo, iconColor: 0xFF7049FA, iconPath: getIconCoffeeMug());

List<Category> coworkingEquipments() {
  return <Category> [
    _equipmentWifi,
    _equipmentAC,
    _equipmentFood,
    _equipmentSpace
  ];
}

// User
final User _currentUser =
          User(name: "Laura Menzel", position: "Owner", avatarUrl: getImgAvatarCurrentUser());

final User _userAlicja =
          User(name: "Alicja Dunkley", position: "Owner", avatarUrl: getImgAvatarAlicja());

final User _userGianni =
          User(name: "Gianni Mcneill", position: "Owner", avatarUrl: getImgAvatarGianni());

final User _userMikail =
          User(name: "Mikail Tanner", position: "Owner", avatarUrl: getImgAvatarMikail());

final User _userEvieMai =
          User(name: "Evie-Mai Busby", position: "Owner", avatarUrl: getImgAvatarEvieMai());

final User _userWilf =
          User(name: "Wilf Kendall", position: "Owner", avatarUrl: getImgAvatarWilf());

User currentUser() {
  return _currentUser;
}

List<User> users() {
  return <User> [
    _currentUser,
    _userAlicja,
    _userGianni,
    _userMikail,
    _userEvieMai,
    _userWilf
  ];
}

//Coworking
final _cwkStrasbourg = Coworking(
    coworkingId : "cwk001",
    name : "Lain Coworking",
    city: "Strasbourg",
    address: "11 Rue jean jaurès, Strasbourg, France",
    image: getImgCwkStrasbourg(),
    rating: 4.5,
    numberOfMembers: 54,
    price: 30,
    coworkingEquipments: coworkingEquipments(),
    user: _currentUser,
    participants: [_userGianni, _userWilf]
);

final _cwkMali = Coworking(
    coworkingId : "cwk002",
    name : "Mali Coworking",
    city: "Bamako",
    address: "8 Rue Kankou Moussa, Bamako, Mali",
    image:  getImgCwkMali(),
    rating: 4.8,
    numberOfMembers: 80,
    price: 41,
    coworkingEquipments: coworkingEquipments(),
    user: _userAlicja,
    participants: [_currentUser, _userAlicja]
);

final _cwkParis = Coworking(
    coworkingId : "cwk003",
    name : "Paris Coworking",
    city: "Paris",
    address: "16 Rue Robespierre, Paris, France",
    image: getImgCwkParis(),
    rating: 4.3,
    numberOfMembers: 26,
    price: 35,
    coworkingEquipments: coworkingEquipments(),
    user: _userGianni,
    participants: [_userMikail, _userEvieMai]
);

final _cwkLyon = Coworking(
    coworkingId : "cwk004",
    name : "Lyon Coworking",
    city: "Lyon",
    address: "1 Rue Anatole, Lyon, France",
    image: getImgCwkLyon(),
    rating: 4.1,
    numberOfMembers: 39,
    price: 25,
    coworkingEquipments: coworkingEquipments(),
    user: _userWilf,
    participants: [_userGianni, _currentUser]
);

final _cwkLille = Coworking(
    coworkingId : "cwk005",
    name : "Lille Coworking",
    city: "Lille",
    address: "105 Rue Charle Degaulle, Lille, France",
    image: getImgCwkLille(),
    rating: 3.9,
    numberOfMembers: 76,
    price: 52,
    coworkingEquipments: coworkingEquipments(),
    user: _userEvieMai,
    participants: [_userGianni, _userEvieMai]
);

List<Coworking> coworkings() {
  return <Coworking> [
    _cwkStrasbourg,
    _cwkMali,
    _cwkParis,
    _cwkLyon,
    _cwkLille
  ];
}