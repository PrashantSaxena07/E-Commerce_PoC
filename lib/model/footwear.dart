class Footwear {
  final int id;
  final String title;
  final String category;
  final String urlImage;

  const Footwear({
    required this.id,
    required this.category,
    required this.title,
    required this.urlImage,
  });

  factory Footwear.fromJson(Map<String, dynamic> json) => Footwear(
        id: json['id'],
        category: json['category'],
        title: json['title'],
        urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'category': category,
        'urlImage': urlImage,
      };
}
