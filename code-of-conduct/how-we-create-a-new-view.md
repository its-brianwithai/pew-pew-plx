---
document_type: code of conduct
goal: define process for creating new views in the application
gpt_action: follow these steps when creating a new view
---

# 🎯 View Creation Process

1. [[GPT Agent]] [[generate base files]]
   1. [[generate base files]]
      - 1. Navigate to project: `cd project_flutter`
      - 2. Run script: `dart scripts/create_view.dart`
      - 3. Enter feature name when prompted (e.g., "items")
      - 4. Enter snake_case file name without '_view' (e.g., "manage_item")

2. [[GPT Agent]] [[configure view]]
   1. [[configure view]]
      - 1. Update view path with parameters
      - 2. Add required arguments and origin
      - 3. Update UI elements
      ```dart
      class ManageItemView extends StatelessWidget {
        static const String path = 'manage-item/:$kKeysItemId';
        
        final ManageItemViewArguments arguments;
        final ManageItemViewOrigin origin;
        
        header: EmojiHeader.scaffoldTitle(
          emoji: Emoji.box,
          title: 'Manage Item',
        ),
      }
      ```

3. [[GPT Agent]] [[setup arguments]]
   1. [[setup arguments]]
      - 1. Create type-safe arguments class
      - 2. Define required properties
      - 3. Implement toMap method
      ```dart
      class ManageItemViewArguments extends ViewArguments {
        ManageItemViewArguments({required this.itemId});

        final String? itemId;

        @override
        Map<String, dynamic> toMap() => {
          if (itemId != null) kKeysItemId: itemId,
        };
      }
      ```

4. [[GPT Agent]] [[configure routing]]
   1. [[configure routing]]
      - 1. Add parameter handling extension
      - 2. Create route in base router
      - 3. Add route to parent router
      ```dart
      extension on GoRouterState {
        String? get itemId =>
            pathParameters[kKeysItemId] ?? 
            uri.queryParameters[kKeysItemId] ?? 
            arguments()?.itemId;
      }

      static GoRoute get manageItemView => GoRoute(
        path: ManageItemView.path,
        redirect: (context, state) {
          if (!AuthService.locate.hasAuth.value) {
            return AuthView.path.asRootPath;
          }
          return null;
        },
        pageBuilder: (context, state) => _buildPage(
          child: ManageItemView(
            arguments: ManageItemViewArguments(
              itemId: state.itemId!,
            ),
            origin: ManageItemViewOrigin.core,
          ),
        ),
      );
      ```

5. [[GPT Agent]] [[add navigation]]
   1. [[add navigation]]
      - 1. Create navigation method in feature router
      ```dart
      Future<void> pushManageItemView({
        required String itemId,
      }) async =>
          push(
            location: '$root'
                '/${ManageItemView.path}'.withItemId(itemId),
            extra: [
              ManageItemViewArguments(itemId: itemId),
            ],
          );
      ```

6. [[GPT Agent]] [[register view model]]
   1. [[register view model]]
      - 1. Add registration in app setup
      ```dart
      void registerViewModels() {
        ManageItemViewModel.registerFactory();
      }
      ```

# ✅ Verification Checklist

1. [[GPT Agent]] [[verify implementation]]
   1. [[verify implementation]]
      - 1. Confirm view files are generated with correct names
      - 2. Check view path includes required parameters
      - 3. Verify arguments extend ViewArguments
      - 4. Confirm origin enum exists with appropriate values
      - 5. Check base router includes route with auth checks
      - 6. Verify parameter handling from all sources
      - 7. Confirm feature router has navigation methods
      - 8. Check view model registration in app setup
      - 9. Verify UI elements use appropriate base widgets
      - 10. Confirm navigation methods follow established patterns 
