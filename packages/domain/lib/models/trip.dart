class Trip {
  const Trip({
    required this.destination,
    required this.date,
    required this.imageUrl,
  });

  final String destination;
  final DateTime date;
  final String imageUrl;

  Trip.fromJson(Map<String, dynamic> json)
      : destination = json['photographer'],
        date = DateTime.now(),
        imageUrl = json['src']['original'];
}
