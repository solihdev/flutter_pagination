class OrdersListItem {
  int id;
  String date;
  String slug;
  String type;
  int author;

  OrdersListItem({
    required this.id,
    required this.date,
    required this.slug,
    required this.type,
    required this.author,
  });

  factory OrdersListItem.fromJson(Map<String, dynamic> json) {
    return OrdersListItem(
      id: json['id'] as int? ?? 0,
      date: json['date'] as String? ?? "",
      slug: json['slug'] as String? ?? "",
      type: json['type'] as String? ?? "",
      author: json['author'] as int? ?? 0,
    );
  }
}
