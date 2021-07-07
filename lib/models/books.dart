import 'dart:convert';

class Book {
  var author;
  var title;

  Book({
    this.author,
    this.title,
  });

  set authorBook(var editAuthor) {
    this.author = editAuthor;
  }

  set titleBook(var editTitle) {
    this.title = editTitle;
  }
}
