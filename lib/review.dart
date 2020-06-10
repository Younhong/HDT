class Review {
  Review({
    this.headerValue,
    this.isExpanded = false,
    this.reviews,
  });

  String headerValue;
  bool isExpanded;
  List reviews;
}