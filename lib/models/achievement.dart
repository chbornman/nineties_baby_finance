class Achievement {
  final String id;
  final String userId;
  final String title;
  final String description;
  final String iconPath;
  final DateTime earnedAt;
  final int pointsAwarded;

  Achievement({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.earnedAt,
    required this.pointsAwarded,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) {
    return Achievement(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      iconPath: json['icon_path'] as String,
      earnedAt: DateTime.parse(json['earned_at'] as String),
      pointsAwarded: json['points_awarded'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'description': description,
      'icon_path': iconPath,
      'earned_at': earnedAt.toIso8601String(),
      'points_awarded': pointsAwarded,
    };
  }
}
