class Items {
  final int id;
  final String itemcategory;
  final String categoryimg;
  Items(
      {required this.id,
      required this.itemcategory,
      required this.categoryimg});
  factory Items.fromMap(Map<String, dynamic> data) {
    return Items(
        id: int.parse(data["id"]),
        itemcategory: data["item_category"],
        categoryimg: data["category_img"]);
  }
}
