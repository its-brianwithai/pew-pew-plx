import 'dart:io';

const sourceDirOverride = null;
const targetDirOverride = null;

void main() async {
  // Define replacements map
  final replacementsMap = {
    'Turbo': '',
    'package_name': '',
    'path-name': '',
    'Hello World': 'Hello Mars',
    // Add more replacements as needed
  };

  // Get the script and source directories
  final scriptFile = File(Platform.script.toFilePath());
  final scriptDir = scriptFile.parent;
  final sourceDir = Directory(sourceDirOverride ?? scriptDir.path);
  final targetDir =
      Directory('${targetDirOverride ?? scriptDir.path}${Platform.pathSeparator}__brick__');
  final scriptPath = scriptFile.path;

  if (!await sourceDir.exists()) {
    print('Error: Source directory does not exist: ${sourceDir.path}');
    exit(1);
  }

  print('Source directory: ${sourceDir.path}');
  print('Target directory: ${targetDir.path}\n');

  // Remove existing __brick__ directory if it exists
  if (await targetDir.exists()) {
    print('Removing existing __brick__ directory...');
    await targetDir.delete(recursive: true);
  }

  print('Creating fresh target directory: ${targetDir.path}\n');

  // Create target directory if it doesn't exist
  await targetDir.create(recursive: true);

  try {
    final usedReplacements = <String, int>{};
    await processDirectory(sourceDir, targetDir, replacementsMap, scriptPath, usedReplacements);

    if (usedReplacements.isNotEmpty) {
      print('\nReplacements used:');
      usedReplacements.forEach((key, count) {
        print('  "$key" → "${replacementsMap[key]}" ($count times)');
      });
    } else {
      print('\nNo replacements were used.');
    }

    print('\nSuccessfully completed the brick update!');
  } catch (e) {
    print('Error during brick update: $e');
    exit(1);
  }
}

Future<void> processDirectory(
  Directory sourceDir,
  Directory targetDir,
  Map<String, String> replacements,
  String scriptPath,
  Map<String, int> usedReplacements,
) async {
  await for (final entity in sourceDir.list()) {
    try {
      final sourcePath = entity.path;
      final relativePath = sourcePath.substring(sourceDir.path.length + 1);

      // Skip the script itself, target directory, and system files
      if (sourcePath == scriptPath ||
          relativePath.startsWith('__brick__') ||
          relativePath.startsWith('.') || // Skip hidden files like .DS_Store
          relativePath.endsWith('.DS_Store')) {
        continue;
      }

      // First get the relative path and apply replacements
      String relativeTargetPath = relativePath;
      for (final entry in replacements.entries) {
        final newPath = relativeTargetPath.replaceAll(entry.key, entry.value);
        if (newPath != relativeTargetPath) {
          usedReplacements.update(entry.key, (count) => count + 1, ifAbsent: () => 1);
          relativeTargetPath = newPath;
        }
      }

      // Then construct the full target path
      String targetPath = '${targetDir.path}${Platform.pathSeparator}$relativeTargetPath';

      if (entity is Directory) {
        final newTargetDir = Directory(targetPath);
        if (!await newTargetDir.exists()) {
          await newTargetDir.create(recursive: true);
        }
        await processDirectory(entity, newTargetDir, replacements, scriptPath, usedReplacements);
      } else if (entity is File) {
        try {
          // Ensure parent directory exists
          final parentDir =
              Directory(targetPath.substring(0, targetPath.lastIndexOf(Platform.pathSeparator)));
          if (!await parentDir.exists()) {
            await parentDir.create(recursive: true);
          }

          final content = await entity.readAsString();
          var newContent = content;

          // Apply replacements to file content
          for (final entry in replacements.entries) {
            final updatedContent = newContent.replaceAll(entry.key, entry.value);
            if (updatedContent != newContent) {
              usedReplacements.update(entry.key, (count) => count + 1, ifAbsent: () => 1);
              newContent = updatedContent;
            }
          }

          final targetFile = File(targetPath);
          await targetFile.writeAsString(newContent);
        } catch (e) {
          // If we can't read the file as text, just copy it as binary
          if (e is FileSystemException && e.message.contains('Failed to decode data')) {
            // Ensure parent directory exists before copying
            final parentDir =
                Directory(targetPath.substring(0, targetPath.lastIndexOf(Platform.pathSeparator)));
            if (!await parentDir.exists()) {
              await parentDir.create(recursive: true);
            }
            await File(sourcePath).copy(targetPath);
          } else {
            rethrow;
          }
        }
      }
    } catch (e) {
      print('Error processing ${entity.path}: $e');
      rethrow;
    }
  }
}
