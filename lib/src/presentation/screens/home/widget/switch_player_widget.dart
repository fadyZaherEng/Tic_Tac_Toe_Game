import 'package:flutter/material.dart';

class SwitchPlayerWidget extends StatefulWidget {
  bool isSwitch;
  void Function(bool) onChanged;
  SwitchPlayerWidget({
    super.key,
    required this.isSwitch,
    required this.onChanged,
  });

  @override
  State<SwitchPlayerWidget> createState() => _SwitchPlayerWidgetState();
}

class _SwitchPlayerWidgetState extends State<SwitchPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      activeColor: Colors.deepPurple.shade300,
      selectedTileColor: Theme.of(context).primaryColor,
      inactiveTrackColor: Colors.black54,
      value: widget.isSwitch,
      title: const Text(
        'Turn on/off Two Player Mode',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      onChanged: (value) => widget.onChanged(value),
    );
  }
}
