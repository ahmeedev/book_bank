class MyBook {
  String name;
  String description;
  String imageUrl;
  String pdfUrl;
  int price;
  String authur;
  bool isFullAccess;
  MyBook({
    required this.name,
    required this.authur,
    required this.description,
    required this.imageUrl,
    required this.pdfUrl,
    required this.price,
    required this.isFullAccess,
  });
}
