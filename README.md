# Flutter Horizontal Calendar

Flutter UI package to interact with canelder in horizontal view. This package also supports custom header and chile element.

### Features:
* Interact with horizontal scrollable calendar
* Add custom child
* Add custom header

### Sample
<img width="292" alt="Screenshot 2024-02-24 at 11 31 49 PM" src="https://github.com/pratikbaid3/flutter_horizontal_calendar/assets/52864956/00347cce-b23c-459a-9db0-3a9cc4478e17">

## Getting Started

### Import
Add the following import in the ```pubspec.yaml``` file
```yaml
simple_horizontal_calendar:
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
