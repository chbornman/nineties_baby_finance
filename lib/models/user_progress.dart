class UserProgress {
  final String userId;
  final int lessonsCompleted;
  final int totalScore;
  final Map<String, dynamic> moduleProgress;
  final DateTime updatedAt;

  UserProgress({
    required this.userId,
    required this.lessonsCompleted,
    required this.totalScore,
    required this.moduleProgress,
    required this.updatedAt,
  });

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      userId: json['user_id'] as String,
      lessonsCompleted: json['lessons_completed'] as int,
      totalScore: json['total_score'] as int,
      moduleProgress: json['module_progress'] as Map<String, dynamic>,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'lessons_completed': lessonsCompleted,
      'total_score': totalScore,
      'module_progress': moduleProgress,
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
