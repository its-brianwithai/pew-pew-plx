import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;
  final progress = logger.progress('Running component bricks');

  // Get selected components
  final components = (context.vars['components'] as List);

  for (final component in components) {
    logger.info('Running brick for $component...');

    final result = await Process.run(
      'mason',
      [
        'make',
        component,
        '--name',
        context.vars['name'],
        '--on-conflict',
        'overwrite',
      ],
      runInShell: true,
    );

    if (result.exitCode != 0) {
      logger.err('Failed to create $component: ${result.stderr}');
    } else {
      logger.success('Created $component successfully');
    }
  }

  progress.complete('All component bricks processed!');
}
