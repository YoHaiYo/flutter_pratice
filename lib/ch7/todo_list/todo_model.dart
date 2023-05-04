/// model : 주요 데이터를 닫고 있는 얘들

class TodoModel{
  String text;
  bool complete;

  TodoModel(this.text, this.complete);

  @override
  String toString() {
    return 'TodoModel{text: $text, complete: $complete}';
  }
}