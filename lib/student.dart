class Student {
  Student({
    this.headerValue,
    this.isExpanded = false,
    this.courses,
  });

  String headerValue;
  bool isExpanded;
  List courses;
}