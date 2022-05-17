## ExtraTapRegion

A widget to add an extra tap region around the child widget.

![a button with an extra tap region](https://user-images.githubusercontent.com/6854255/168779276-c1528af1-621e-423d-aeca-fa7823a0aedc.png)

## Example

```dart
@override
Widget build(BuildContext context) {
  return DeferredPointerHandler(
    child: Scaffold(
      body: Center(
        child: ExtraTapRegion(
          margin: 16.0,
          onPressed: _onPressed,
          child: ElevatedButton(
            onPressed: _onPressed,
            child: const Text('Hello'),
          ),
        ),
      ),
    ),
  );
}

void _onPressed() {}
```
