class MealModel {
  final int? id;
  final String name;
  final String imageUrl;
  final String description;
  final double calories;
  final String time;
  final double rate;

  MealModel({
    this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.calories,
    required this.time,
    required this.rate,
  });

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      description: map['description'],
      calories: map['calories'],
      time: map['time'],
      rate: map['rate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'calories': calories,
      'time': time,
      'rate': rate,
    };
  }
}
