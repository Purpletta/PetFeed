class Article {
  int _articleId;
  String _articleTitle;
  String _articleContent;
  DateTime _articleDate;
  String _author;

  Article({
    required int articleId,
    required String articleTitle,
    required String articleContent,
    required DateTime articleDate,
    required String author,
  })  : _articleId = articleId,
        _articleTitle = articleTitle,
        _articleContent = articleContent,
        _articleDate = articleDate,
        _author = author;

  int get articleId => _articleId;
  String get articleTitle => _articleTitle;
  String get articleContent => _articleContent;
  DateTime get articleDate => _articleDate;
  String get author => _author;

  set articleId(int value) {
    _articleId = value;
  }

  set articleTitle(String value) {
    _articleTitle = value;
  }

  set articleContent(String value) {
    _articleContent = value;
  }

  set articleDate(DateTime value) {
    _articleDate = value;
  }

  set author(String value) {
    _author = value;
  }
}
