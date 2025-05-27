import 'package:flutter/material.dart';
import 'package:nba_sdk/feat/notifications/data/notification_type.dart';

class NotificationFilterDropdown extends StatefulWidget {
  final Set<NotificationType> selectedTypes;
  final Function(Set<NotificationType>) onChanged;

  const NotificationFilterDropdown({
    Key? key,
    required this.selectedTypes,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<NotificationFilterDropdown> createState() => _NotificationFilterDropdownState();
}

class _NotificationFilterDropdownState extends State<NotificationFilterDropdown> {
  late Set<NotificationType> _localSelectedTypes;
  final MenuController _menuController = MenuController();

  @override
  void initState() {
    super.initState();
    _localSelectedTypes = Set<NotificationType>.from(widget.selectedTypes);
  }

  @override
  void didUpdateWidget(NotificationFilterDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedTypes != widget.selectedTypes) {
      _localSelectedTypes = Set<NotificationType>.from(widget.selectedTypes);
    }
  }

  void _handleSelection(NotificationType type) {
    setState(() {
      if (_localSelectedTypes.contains(type)) {
        _localSelectedTypes.remove(type);
      } else {
        _localSelectedTypes.add(type);
      }
      widget.onChanged(_localSelectedTypes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xff1C2B32),
        borderRadius: BorderRadius.circular(8),
      ),
      child: MenuAnchor(
        controller: _menuController,
        style: const MenuStyle(
          backgroundColor: MaterialStatePropertyAll(Color(0xff1C2B32)),
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
        ),
        builder: (context, controller, child) {
          return InkWell(
            onTap: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _localSelectedTypes.isEmpty 
                        ? 'Select Types' 
                        : '${_localSelectedTypes.length} types selected',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down, color: Colors.white),
              ],
            ),
          );
        },
        menuChildren: NotificationType.values.map((type) {
          final isSelected = _localSelectedTypes.contains(type);
          return Material(
            color: const Color(0xff1C2B32),
            child: InkWell(
              onTap: () => _handleSelection(type),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Color(0xff0E86A6),
                              size: 20,
                            )
                          : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      type.label,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    //_menuController.dispose();
    super.dispose();
  }
}
