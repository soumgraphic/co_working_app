class Category {
  String name;
  int color;
  int iconCode;

  Category(this.name, this.color, this.iconCode);
}

List<Category> getCategories() {
  return <Category>[
    Category("Cafe", 0xFF00B0FF, 0xe161),
    Category("Office", 0xFF2E7D32, 0xe8b3),
    Category("Space", 0xFFF06292, 0xe266),
    Category("See All", 0xFFAB47BC, 0xe146)
  ];
}