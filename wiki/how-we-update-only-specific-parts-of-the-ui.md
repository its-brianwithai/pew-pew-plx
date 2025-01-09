---
document_type: wiki
goal: define process for implementing granular UI updates
gpt_action: follow these steps when implementing UI updates that need to be optimized
---

# 🔍 Initial Research

1. [[GPT Agent]] [[verify update needs]]
   1. [[verify update needs]]
      1. Check if simple value updates
      2. Check if collection updates
      3. Review UI rebuild scope
      4. Identify state management needs

2. [[GPT Agent]] [[confirm approach]]
   1. [[confirm approach]]
      1. Check if ValueNotifier sufficient
      2. Check if Informer needed
      3. Review collection handling needs
      4. Verify encapsulation requirements

# 🛠️ Implementation

1. [[GPT Agent]] [[implement value updates]]
   1. [[implement value updates]]
      1. Basic ValueNotifier implementation:
```dart
// Basic example of ValueNotifier
final counter = ValueNotifier<int>(0);

// Using ValueListenableBuilder for granular updates
ValueListenableBuilder<int>(
  valueListenable: counter,
  builder: (context, value, child) {
    return Text('Count: $value');
  },
)
```

2. [[GPT Agent]] [[implement informer]]
   1. [[implement informer]]
      1. Create Informer with collection support:
```dart
class InvitesService {
  // Private Informer
  final _invites = Informer<List<InviteModel>>(
    [],
    forceUpdate: true,
  );

  // Public ValueListenable
  ValueListenable<List<InviteModel>> get invites => _invites;
}
```

3. [[GPT Agent]] [[implement real world example]]
   1. [[implement real world example]]
      1. Team invites implementation:
```dart
class InvitesService {
  final _sentInvites = Informer<List<InviteModel>>(
    [],
    forceUpdate: true,
  );
  final _receivedInvites = Informer<List<InviteModel>>(
    [],
    forceUpdate: true,
  );

  ValueListenable<List<InviteModel>> get sentInvites => _sentInvites;
  ValueListenable<List<InviteModel>> get receivedInvites => _receivedInvites;

  @override
  Future<void> afterSyncNotifyUpdate(List<InviteDto> docs) async {
    final inviteModels = <InviteModel>[];
    // Process docs...

    final currentUserId = gUserId;
    final sent = <InviteModel>[];
    final received = <InviteModel>[];

    for (final invite in inviteModels) {
      if (invite.dto.createdBy == currentUserId) {
        sent.add(invite);
      }
      if (invite.dto.recipientId == currentUserId) {
        received.add(invite);
      }
    }

    _sentInvites.update(sent);
    _receivedInvites.update(received);
  }
}
```

4. [[GPT Agent]] [[implement update methods]]
   1. [[implement update methods]]
      1. Use appropriate update method:
```dart
// Replace current value
_invites.update(newValue);

// Modify current value in-place
_invites.updateCurrent((current) => current..add(newItem));

// Update without notifying
_invites.silentUpdate(newValue);

// Force notify without value change
_invites.rebuild();
```

# ✅ Verification

1. [[GPT Agent]] [[verify update control]]
   1. [[verify update control]]
      1. Update methods work correctly
      2. Silent updates don't trigger rebuilds
      3. Force updates work for collections
      4. Rebuilds happen when needed

2. [[GPT Agent]] [[verify encapsulation]]
   1. [[verify encapsulation]]
      1. Informers are private
      2. Only ValueListenable exposed
      3. Collection updates reliable
      4. State properly isolated

3. [[GPT Agent]] [[verify best practices]]
   1. [[verify best practices]]
      1. ValueListenableBuilder placed deep in tree
      2. forceUpdate enabled for collections
      3. Clean separation of data and UI
      4. Proper update method selection
