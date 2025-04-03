class Notes {
  int? id;
  String? title;
  String? desc;
  String? date;
  int? color;

  Notes(
      {required this.title,
      required this.desc,
      required this.date,
      required this.color,
      this.id});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'date': date,
      'color': color,
      'id': id
    };
  }
}
