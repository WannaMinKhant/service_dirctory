class CategoryModel {
  String img;
  String name;
  bool isActive;

  CategoryModel(
      {required this.img, required this.name, required this.isActive});
}

List<CategoryModel> categories = [
  CategoryModel(
    img: "assets/images/1.jpg",
    name: "Counseling Services",
    isActive: true,
  ),
  CategoryModel(
    img: "assets/images/2.jpg",
    name: "အဲယားကွန်း ဆားဗစ်",
    isActive: true,
  ),
  CategoryModel(
    img: "assets/images/3.jpg",
    name: "Laptop/PC Services",
    isActive: true,
  ),
  CategoryModel(
    img: "assets/images/4.png",
    name: "Electric Services",
    isActive: true,
  ),
  CategoryModel(
    img: "assets/images/5.png",
    name: "Phone Repair Services",
    isActive: true,
  ),
  CategoryModel(
    img: "assets/images/1.jpg",
    name: "Health Care Services",
    isActive: true,
  ),
];
