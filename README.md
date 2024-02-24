# Flutter Horizontal Calendar

Flutter UI package to interact with canelder in horizontal view. This package also supports custom header and chile element.

### Features:
* Interact with horizontal scrollable calendar
* Add custom child
* Add custom header

## Getting Started

### Import
Add the following import in the ```pubspec.yaml``` file
```yaml
client_sse:
    git:
      url: https://github.com/pratikbaid3/flutter_horizontal_calendar
```

### Example
```dart
HorizontalCalender(
    onSelected: (DateTime date) {
        setState(() {
          selectedDate = DateFormat('dd MMMM, yyyy').format(date);
        });
    },
),
```