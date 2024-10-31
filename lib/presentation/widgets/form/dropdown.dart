import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomDropdown extends StatefulWidget {
  final double width;
  final List<String> items;
  final IconData icon;

  const CustomDropdown(
      {super.key,
      required this.width,
      required this.items,
      required this.icon});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late String selectedItem = widget.items[0];
  bool _isDropdownOpened = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _isDropdownOpened ? _closeDropdown() : _openDropdown();
        },
        child: CompositedTransformTarget(
          link: _layerLink,
          child: Container(
            height: 36,
            width: widget.width,
            decoration: const BoxDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: blackTheme,
                  size: 18,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  selectedItem,
                  style: mediumBodyText.copyWith(
                      color: selectedItem == widget.items[0]
                          ? neutralTheme[300]
                          : blackTheme),
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
          // Modal barrier to detect taps outside the dropdown
          GestureDetector(
            onTap: () {
              _closeDropdown();
            },
            child: Container(
              color: Colors.transparent, // Transparent barrier
            ),
          ),
          Positioned(
            width: widget.width,
            left: offset.dx,
            top: offset.dy + size.height + 5,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
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
                      children: widget.items.asMap().entries.map((entry) {
                        int index = entry.key;
                        String item = entry.value;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedItem = item;
                            });
                            _closeDropdown();
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: neutralTheme,
                              border: index != widget.items.length - 1
                                  ? Border(
                                      bottom: BorderSide(
                                        color: neutralTheme[100]!,
                                        width: 1,
                                      ),
                                    )
                                  : null, // Jika item terakhir, tidak ada border bottom
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Text(item),
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
