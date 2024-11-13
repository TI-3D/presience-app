import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class DropdownStatus extends StatefulWidget {
  final double width;
  final IconData icon;
  final List<Map<String, dynamic>> items;
  final Function(String)? onChange;

  const DropdownStatus({
    super.key,
    required this.width,
    required this.items,
    required this.icon,
    this.onChange,
  });

  @override
  State<DropdownStatus> createState() => _DropdownStatusState();
}

class _DropdownStatusState extends State<DropdownStatus> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late Map<String, dynamic> selectedItem = widget.items[0];
  bool _isDropdownOpened = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _isDropdownOpened ? _closeDropdown() : _openDropdown();
        },
        child: CompositedTransformTarget(
          link: _layerLink,
          child: SizedBox(
            height: 36,
            width: widget.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: blackTheme,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    selectedItem['name'],
                    style: mediumBodyText.copyWith(
                      color: selectedItem['value'] == ""
                          ? neutralTheme[300]
                          : blackTheme,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _isDropdownOpened = true;
    setState(() {});
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _isDropdownOpened = false;
    setState(() {});
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: _closeDropdown,
            child: Container(color: Colors.transparent),
          ),
          Positioned(
            width: widget.width,
            left: offset.dx,
            top: offset.dy + size.height + 5,
            child: CompositedTransformFollower(
              link: _layerLink,
              offset: Offset(0, size.height + 8),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: neutralTheme,
                      border: Border.all(color: neutralTheme[100]!, width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: widget.items.map((item) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedItem = item;
                            });
                            widget.onChange?.call(item['value']);
                            _closeDropdown();
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: neutralTheme,
                              border: item != widget.items.last
                                  ? Border(
                                      bottom: BorderSide(
                                        color: neutralTheme[100]!,
                                        width: 1,
                                      ),
                                    )
                                  : null,
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Text(item['name']),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
