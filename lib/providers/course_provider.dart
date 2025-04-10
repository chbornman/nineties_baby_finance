import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/course.dart';

class CourseCompletionNotifier extends StateNotifier<Map<String, bool>> {
  CourseCompletionNotifier() : super({});

  void toggleCompletion(String courseId) {
    final updatedState = Map<String, bool>.from(state);
    updatedState[courseId] = !(state[courseId] ?? false);
    state = updatedState;
  }

  void markAsCompleted(String courseId) {
    final updatedState = Map<String, bool>.from(state);
    updatedState[courseId] = true;
    state = updatedState;
  }

  bool isCourseCompleted(String courseId) {
    return state[courseId] ?? false;
  }
}

final courseCompletionProvider = StateNotifierProvider<CourseCompletionNotifier, Map<String, bool>>((ref) {
  return CourseCompletionNotifier();
});

final coursesProvider = Provider<List<Course>>((ref) {
  return sampleCourses;
});