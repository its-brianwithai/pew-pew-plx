---
description: Forms - How we create and implement form structures
globs: *.dart, *.json
document_type: code_of_conduct
goal: Define standards and processes for creating form structures and implementations
gpt_action: Follow these steps when creating or modifying form structures
---

# Form Structure

1. GIVEN [[Form]] NEEDS creation
   1. THEN [[You]] CREATE enum for form fields
   2. AND [[You]] EXTEND FormConfig

2. WHEN [[You]] IMPLEMENT form
   1. THEN [[You]] ADD private constructor
   2. AND [[You]] ADD GetIt registration
   ```dart
   class ExampleForm extends FormConfig {
     ExampleForm._();
     
     static ExampleForm get locate => GetIt.I.get();
     static void registerFactory() => GetIt.I.registerFactory(ExampleForm._);
   }
   ```

3. WHEN [[You]] ADD form fields
   1. THEN [[You]] DECLARE late final formFieldConfigs
   2. AND [[You]] ADD field configurations
   ```dart
   @override
   late final Map<Enum, FormFieldConfig> formFieldConfigs = {
     _ExampleFormField.name: FormFieldConfig<String>(
       id: _ExampleFormField.name,
       formFieldType: FormFieldType.text,
       initialValue: _initialDto?.name,
       valueValidator: kValueValidatorsRequired(),
     ),
   };
   ```

4. WHEN [[You]] NEED initialization
   1. THEN [[You]] ADD late final DTO field
   2. AND [[You]] CREATE initialize method
   ```dart
   late final ExampleDto? _initialDto;
   
   void initialise({required ExampleDto? dto}) {
     _initialDto = dto;
   }
   ```

5. WHEN [[You]] EXPOSE fields
   1. THEN [[You]] CREATE getters for each field
   ```dart
   FormFieldConfig<String> get name => 
       formFieldConfig(_ExampleFormField.name);
   ```

6. WHEN [[You]] NEED field updates
   1. THEN [[You]] ADD update methods
   ```dart
   void updateName(String? value) => name.value = value;
   ```

# Form Usage in ViewModel

1. WHEN [[You]] USE form in ViewModel
   1. THEN [[You]] ADD form dependency
   ```dart
   late final _form = ExampleForm.locate;
   ```
   2. AND [[You]] INITIALIZE in initialise method
   ```dart
   @override
   Future<void> initialise() async {
     final dto = await _service.tryFindById(args.id);
     _form.initialise(dto: dto);
     super.initialise();
   }
   ```
   3. AND [[You]] DISPOSE form
   ```dart
   @override
   void dispose() {
     _form.dispose();
     super.dispose();
   }
   ```

# Form Field Types

1. GIVEN [[FormFieldType]] OPTIONS
   1. THEN [[text]] IS for text input
   2. AND [[counter]] IS for numeric input
   3. AND [[dropDown]] IS for enum selection
   4. AND [[toggle]] IS for boolean values

# Form Validation

1. WHEN [[You]] NEED validation
   1. THEN [[You]] USE kValueValidators
   2. OR [[You]] COMBINE with kValueValidatorsMultiple
   ```dart
   valueValidator: kValueValidatorsMultiple([
     kValueValidatorsRequired(),
     kValueValidatorsMinLength(minLength: 1),
     kValueValidatorsMaxLength(maxLength: 50),
   ])
   ```

# Complete Example

1. GIVEN [[CleaningTask]] NEEDS form
   1. THEN [[You]] CREATE form fields enum
   ```dart
   enum _ManageCleaningTaskFormField {
     name,
     description,
     frequency,
     timespan,
   }
   ```

2. WHEN [[You]] IMPLEMENT form class
   ```dart
   class ManageCleaningTaskForm extends FormConfig {
     ManageCleaningTaskForm._();

     static ManageCleaningTaskForm get locate => GetIt.I.get();
     static void registerFactory() => GetIt.I.registerFactory(ManageCleaningTaskForm._);

     late final CleaningTaskDto? _initialCleaningTaskDto;

     void initialise({required CleaningTaskDto? cleaningTaskDto}) {
       _initialCleaningTaskDto = cleaningTaskDto;
     }

     @override
     late final Map<Enum, FormFieldConfig> formFieldConfigs = {
       _ManageCleaningTaskFormField.name: FormFieldConfig<String>(
         id: _ManageCleaningTaskFormField.name,
         formFieldType: FormFieldType.text,
         initialValue: _initialCleaningTaskDto?.name,
         valueValidator: kValueValidatorsMultiple([
           kValueValidatorsRequired(
             errorText: () => 'This field is required',
           ),
           kValueValidatorsMinLength(
             minLength: 1,
             errorText: () => 'Name must be at least 1 character long.',
           ),
           kValueValidatorsMaxLength(
             maxLength: 50,
             errorText: () => 'Name can be at most 50 characters long.',
           ),
         ]),
       ),
       _ManageCleaningTaskFormField.description: FormFieldConfig<String>(
         id: _ManageCleaningTaskFormField.description,
         formFieldType: FormFieldType.text,
         initialValue: _initialCleaningTaskDto?.description,
         valueValidator: kValueValidatorsMaxLength(
           maxLength: 200,
           errorText: () => 'Description can be at most 200 characters long.',
         ),
       ),
       _ManageCleaningTaskFormField.frequency: FormFieldConfig<String>(
         id: _ManageCleaningTaskFormField.frequency,
         formFieldType: FormFieldType.counter,
         initialValue: _initialCleaningTaskDto?.frequency?.toString(),
         valueValidator: kValueValidatorsMultiple([
           kValueValidatorsRequired(
             errorText: () => 'This field is required',
           ),
           kValueValidatorsIsValidNumber(
             errorText: () => 'Please enter a valid number.',
           ),
         ]),
       ),
       _ManageCleaningTaskFormField.timespan: FormFieldConfig<CleaningScheduleTimeSpan>(
         id: _ManageCleaningTaskFormField.timespan,
         formFieldType: FormFieldType.dropDown,
         initialValue: _initialCleaningTaskDto?.cleaningScheduleTimeSpan ?? CleaningScheduleTimeSpan.week,
         valueValidator: kValueValidatorsRequired(
           errorText: () => 'This field is required',
         ),
       ),
     };

     FormFieldConfig<String> get name => formFieldConfig(_ManageCleaningTaskFormField.name);
     FormFieldConfig<String> get description => formFieldConfig(_ManageCleaningTaskFormField.description);
     FormFieldConfig<String> get frequency => formFieldConfig(_ManageCleaningTaskFormField.frequency);
     FormFieldConfig<CleaningScheduleTimeSpan> get timespan => formFieldConfig(_ManageCleaningTaskFormField.timespan);

     void updateName(String? value) => name.value = value;
     void updateDescription(String? value) => description.value = value;
     void updateFrequency(String? value) => frequency.value = value;
     void updateTimespan(CleaningScheduleTimeSpan? value) => timespan.value = value;
   }
   ```

3. WHEN [[You]] USE form in ViewModel
   ```dart
   class ManageCleaningTaskViewModel extends BaseViewModel<OriginArguments<ManageCleaningTaskOrigin, ManageCleaningTaskArguments>> {
     final _cleaningTasksService = CleaningTasksService.locate;
     late final _form = ManageCleaningTaskForm.locate;

     @override
     Future<void> initialise() async {
       final cleaningTask = await _cleaningTasksService.tryFindById(args.id);
       _form.initialise(cleaningTaskDto: cleaningTask);
       super.initialise();
     }

     @override
     void dispose() {
       _form.dispose();
       super.dispose();
     }

     ManageCleaningTaskForm get form => _form;
   }
   ``` 