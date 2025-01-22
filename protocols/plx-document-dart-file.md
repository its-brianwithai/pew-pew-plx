---
document_type: protocol
goal: create or update Dart documentation following official standards and class structure guidelines
gpt_action: follow these steps when working with Dart documentation
---

1. GIVEN [[User]] RUNS plx-document-dart-file command
   1. THEN [[You]] ANALYSE [[User]] input
      1. AND [[You]] IDENTIFY documentation scope
      2. AND [[You]] IDENTIFY documentation type
   2. IF [[User]] input HAS specific file
      1. THEN [[You]] FOCUS on file
   3. IF [[User]] input HAS no specifics
      1. THEN [[You]] SCAN project files

2. WHEN [[You]] STARTS documentation
   1. THEN [[You]] ANALYSE code structure
      1. AND [[You]] CHECK class sections:
         1. 📍 LOCATOR section
         2. 🧩 DEPENDENCIES section
         3. 🎬 INIT & DISPOSE section
         4. 👂 LISTENERS section
         5. ⚡️ OVERRIDES section
         6. 🎩 STATE section
         7. 🛠 UTIL section
         8. 🧲 FETCHERS section
         9. 🏗️ HELPERS section
         10. 🪄 MUTATORS section
      2. AND [[You]] CHECK methods
      3. AND [[You]] CHECK properties
   2. IF [[documentation]] EXISTS
      1. THEN [[You]] REVIEW existing docs
      2. AND [[You]] IDENTIFY gaps

3. GIVEN [[analysis]] IS complete
   1. THEN [[You]] CREATE documentation
      1. AND [[You]] ADD class documentation:
         1. /// A brief, single-line description
         2. /// 
         3. /// A longer description that explains:
         4. /// - The purpose of the class
         5. /// - Key responsibilities
         6. /// - Usage patterns
         7. /// - Important notes
      2. AND [[You]] ADD method documentation:
         1. /// Brief description of what the method does
         2. /// 
         3. /// Detailed explanation if needed
         4. /// 
         5. /// Parameters:
         6. /// - [paramName]: what this parameter is for
         7. /// 
         8. /// Returns: description of the return value
         9. /// 
         10. /// Throws: any exceptions that might be thrown
      3. AND [[You]] ADD property documentation:
         1. /// Brief description of what this property represents
         2. /// 
         3. /// Additional details about:
         4. /// - Usage
         5. /// - Constraints
         6. /// - Side effects
   2. IF [[code]] HAS examples
      1. THEN [[You]] ADD example code:
         1. /// Example:
         2. /// ```dart
         3. /// final instance = MyClass();
         4. /// await instance.doSomething();
         5. /// ```
      2. AND [[You]] EXPLAIN usage

4. WHEN [[documentation]] IS ready
   1. THEN [[You]] VERIFY format
      1. AND [[You]] CHECK Dart doc style:
         1. Triple slashes ///
         2. Proper markdown formatting
         3. Consistent indentation
         4. Line breaks between sections
         5. Proper parameter references [paramName]
      2. AND [[You]] CHECK completeness:
         1. All public APIs documented
         2. All parameters described
         3. Return values explained
         4. Exceptions documented
   2. IF [[format]] IS incorrect
      1. THEN [[You]] FIX formatting
      2. AND [[You]] VERIFY again

5. GIVEN [[documentation]] IS complete
   1. THEN [[You]] PRESENT to [[User]]
      1. AND [[You]] EXPLAIN changes
      2. AND [[You]] HIGHLIGHT improvements
   2. IF [[User]] APPROVES changes
      1. THEN [[You]] COMMIT changes
      2. AND [[You]] UPDATE work documents
   3. IF [[User]] REQUESTS changes
      1. THEN [[You]] MODIFY documentation
      2. AND [[You]] PRESENT again
