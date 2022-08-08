class CheckBoxListTileModel {
  int? userId;
  String? img;
  String? title;
  bool? isCheck;

  CheckBoxListTileModel({this.userId, this.img, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1,
          img: 'assets/images/breakfast.png',
          title: "Breakfast",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 2,
          img: 'assets/images/lunch.png',
          title: "Lunch",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          img: 'assets/images/dinner.png',
          title: "Dinner",
          isCheck: false),
    ];
  }
}
