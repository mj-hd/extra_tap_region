## ExtraTapRegion

A widget to add an extra tap region around the child widget.

## Example

```
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
