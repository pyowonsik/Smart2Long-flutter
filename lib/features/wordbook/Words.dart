class Words {
  String word;
  String mean;

  Words({
    required this.word,
    required this.mean,
  }); //json맵의 키를 클래스의 프로퍼티로 사용한다

  factory Words.fromJson(Map<String, dynamic> json) =>
      Words(word: json["word"] as String, mean: json["mean"] as String);

  // @override
  // String toString() {
  //   return '{${this.word},${this.mean}}';
  // }
}
