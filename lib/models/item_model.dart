class Item {
  String name;
  int qty;
  double price;
  double totalline;
  Item({
    required this.name,
    required this.qty,
    required this.price,
    required this.totalline,
  });
  List<String> toList() => [
        name,
        "$qty",
        "${price.toStringAsFixed(2)}",
         "$totalline"
      ];
}
