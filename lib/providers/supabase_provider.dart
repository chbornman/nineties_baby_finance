import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/supabase_service.dart';
import '../models/user_progress.dart';
import '../models/achievement.dart';

final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  return SupabaseService();
});

// Progress provider
final userProgressProvider = FutureProvider.family<UserProgress?, String>((ref, userId) async {
  final supabaseService = ref.watch(supabaseServiceProvider);
  return supabaseService.getUserProgress(userId);
});

// Achievements provider
final userAchievementsProvider = FutureProvider.family<List<Achievement>, String>((ref, userId) async {
  final supabaseService = ref.watch(supabaseServiceProvider);
  return supabaseService.getUserAchievements(userId);
});