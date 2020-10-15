class Category {
  String name;
  int color;
  int iconCode;

  Category(this.name, this.color, this.iconCode);
}

List<Category> getCategories() {
  return <Category>[
    Category("Cafe", 0xFF52CBF8, 0xe161),
    Category("Office", 0xFF96BE57, 0xe8b3),
    Category("Space", 0xFFFF8987, 0xe266),
    Category("See All", 0xFFA986FF, 0xe146)
  ];
}