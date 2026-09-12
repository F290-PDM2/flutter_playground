class QuoteModel {
  final int id;
  final String quote;
  final String author;

  QuoteModel({required this.id, required this.quote, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        id: json['id'],
        quote: json['quote'],
        author: json['author']
    );
  }
}
