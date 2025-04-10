import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/course.dart';
import '../providers/course_provider.dart';

class CourseDetailScreen extends ConsumerWidget {
  final Course course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              ref.read(courseCompletionProvider.notifier).markAsCompleted(course.id);
              Navigator.pop(context);
            },
            tooltip: 'Mark as completed',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(width: 8),
                      Text('${course.durationMinutes} minutes'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: course.topics.map((topic) => Chip(
                      label: Text(topic),
                      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                    )).toList(),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Course description
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              course.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            
            const SizedBox(height: 32),
            
            // Placeholder content
            Text(
              'Course Content',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            
            // Sample lessons
            _buildLessonItem(context, 1, 'Introduction to ${course.title}'),
            _buildLessonItem(context, 2, 'Key Concepts'),
            _buildLessonItem(context, 3, 'Practical Examples'),
            _buildLessonItem(context, 4, 'Common Pitfalls'),
            _buildLessonItem(context, 5, 'Next Steps'),
            
            const SizedBox(height: 40),
            
            // Complete course button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(courseCompletionProvider.notifier).markAsCompleted(course.id);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Text('Complete Course'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildLessonItem(BuildContext context, int lessonNumber, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(lessonNumber.toString()),
        ),
        title: Text(title),
        trailing: const Icon(Icons.play_circle_outline),
        onTap: () {
          // Future implementation: play the lesson
        },
      ),
    );
  }
}