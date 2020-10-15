class Coworking {
  String coworkingId;
  String name;
  String city;
  String image;
  double rating;
  int numberOfMembers;

  Coworking(this.coworkingId, this.name, this.city, this.image, this.rating, this.numberOfMembers);
}

List<Coworking> getCoworkings() {
  return <Coworking>[
    Coworking("cwk001", "Lain Coworking", "Strasbourg", "assets/images/coworking.jpg", 4.5, 80 ),
    Coworking("cwk002", "Bamako Coworking", "Bamako", "assets/images/coworking.jpg", 4.5, 80 ),
    Coworking("cwk003", "Paris Coworking", "Paris", "assets/images/coworking.jpg", 4.5, 80 ),
    Coworking("cwk004", "Lyon Coworking", "Lyon", "assets/images/coworking.jpg", 4.5, 80 ),
    Coworking("cwk005", "Lille Coworking", "Lille", "assets/images/coworking.jpg", 4.5, 80 )
  ];
}
