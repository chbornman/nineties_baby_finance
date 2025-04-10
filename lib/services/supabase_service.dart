import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_progress.dart';
import '../models/achievement.dart';

class SupabaseService {
  final SupabaseClient _client = Supabase.instance.client;

  SupabaseClient get client => _client;

  // Add methods for interacting with your Supabase database here
  // For example:
  
  // Fetch user progress
  Future<UserProgress?> getUserProgress(String userId) async {
    try {
      final response = await _client
          .from('user_progress')
          .select()
          .eq('user_id', userId)
          .single();
      
      if (response != null) {
        return UserProgress.fromJson(response);
      }
      return null;
    } catch (e) {
      // Handle error
      return null;
    }
  }

  // Save user progress
  Future<bool> saveUserProgress(String userId, UserProgress progress) async {
    try {
      await _client
          .from('user_progress')
          .upsert(progress.toJson());
      
      return true;
    } catch (e) {
      // Handle error
      return false;
    }
  }

  // Get user achievements
  Future<List<Achievement>> getUserAchievements(String userId) async {
    try {
      final response = await _client
          .from('user_achievements')
          .select()
          .eq('user_id', userId);
      
      return (response as List)
          .map((item) => Achievement.fromJson(item))
          .toList();
    } catch (e) {
      // Handle error
      return [];
    }
  }
}
