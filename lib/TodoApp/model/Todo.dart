
class Todo {
  late int id;
  late String title;
  late String detail;
  late bool done;
  late String createdDate;
  late String updatedDate;

  Todo(
      this.id,
      this.title,
      this.detail,
      this.done,
      this.createdDate,
      this.updatedDate
      );

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'detail': detail,
      'done': done,
      'createdDate': createdDate,
      'updatedDate': updatedDate
    };
  }

  Todo.fromJson(Map json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
    done = json['done'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }
}