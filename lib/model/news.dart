class News {
  String author, title, description, image;

  News({this.author, this.description, this.title, this.image});

  factory News.fromJson(json) {
    print(json);
    return News(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        image: json['urlToImage']);
  }
}
