import 'package:flutter/material.dart';
import 'package:walletric/config/colors.dart';

class CustomHeaderTab extends StatefulWidget {
  final ValueChanged<int>? onTabChanged;
  final int initialIndex;
  final String labelFirst;
  final String labelSecond;

  const CustomHeaderTab({
    super.key,
    this.onTabChanged,
    this.initialIndex = 0,
    required this.labelFirst,
    required this.labelSecond,
  });

  @override
  State<CustomHeaderTab> createState() => _CustomHeaderTabState();
}

class _CustomHeaderTabState extends State<CustomHeaderTab> {
  late int _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialIndex;
  }

  void _onTabSelect(int index) {
    setState(() {
      _selectedTab = index;
    });

    if (widget.onTabChanged != null) {
      widget.onTabChanged!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFAF8FF),
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _onTabSelect(0),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        _selectedTab == 0 ? Palette.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.labelFirst,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          _selectedTab == 0 ? Colors.black87 : Colors.black54,
                      fontWeight: _selectedTab == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _onTabSelect(1),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        _selectedTab == 1 ? Palette.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.labelSecond,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          _selectedTab == 1 ? Colors.black87 : Colors.black54,
                      fontWeight: _selectedTab == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
