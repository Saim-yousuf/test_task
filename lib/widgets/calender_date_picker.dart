import 'package:flutter/material.dart';
import 'package:test_task/config/colors.dart';

class DatePickerBottomSheet extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateSelected;

  const DatePickerBottomSheet({
    required this.initialDate,
    required this.onDateSelected,
  });

  @override
  State<DatePickerBottomSheet> createState() => DatePickerBottomSheetState();
}

class DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  late DateTime _tempDate;

  @override
  void initState() {
    super.initState();
    _tempDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      decoration: const BoxDecoration(
        color: Palette.card,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Drag Handle
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          const SizedBox(height: 12),

          Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Palette.themeColor,
                onPrimary: Palette.white,
                surface: Palette.card,
                onSurface: Palette.white,
              ),
            ),
            child: CalendarDatePicker(
              initialDate: _tempDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              onDateChanged: (date) {
                setState(() => _tempDate = date);
                widget.onDateSelected(_tempDate);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:test_task/config/colors.dart';

// class DatePickerBottomSheet extends StatefulWidget {
//   final DateTime initialDate;
//   final ValueChanged<DateTime> onDateSelected;

//   const DatePickerBottomSheet({
//     required this.initialDate,
//     required this.onDateSelected,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
// }

// class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
//   late DateTime _selectedDate;
//   late DateTime _displayedMonth;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDate = widget.initialDate;
//     _displayedMonth =
//         DateTime(widget.initialDate.year, widget.initialDate.month);
//   }

//   List<DateTime> _getDaysInMonth() {
//     final firstDay = DateTime(_displayedMonth.year, _displayedMonth.month, 1);
//     final lastDay =
//         DateTime(_displayedMonth.year, _displayedMonth.month + 1, 0);
//     final days = <DateTime>[];

//     // Find weekday of first day (Monday = 1, Sunday = 7)
//     int weekday = firstDay.weekday; // 1=Mon ... 7=Sun

//     // Add leading empty days? We skip them to start directly with 1 (like your image seems to)
//     // If you want leading empties, uncomment the loop below.

//     for (int day = 1; day <= lastDay.day; day++) {
//       days.add(DateTime(_displayedMonth.year, _displayedMonth.month, day));
//     }
//     return days;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final days = _getDaysInMonth();
//     final monthName =
//         '${_displayedMonth.month} ${_displayedMonth.year}'; // e.g. "Sep 2024"

//     return Container(
//       padding: const EdgeInsets.only(top: 12),
//       decoration: const BoxDecoration(
//         color: Palette.card,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Drag handle
//           Container(
//             height: 4,
//             width: 40,
//             margin: const EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white24,
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),

//           // Month title with arrows
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.chevron_left, color: Palette.white),
//                   onPressed: () {
//                     setState(() {
//                       _displayedMonth = DateTime(
//                           _displayedMonth.year, _displayedMonth.month - 1);
//                     });
//                   },
//                 ),
//                 Text(
//                   monthName,
//                   style: const TextStyle(
//                       color: Palette.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.chevron_right, color: Palette.white),
//                   onPressed: () {
//                     setState(() {
//                       _displayedMonth = DateTime(
//                           _displayedMonth.year, _displayedMonth.month + 1);
//                     });
//                   },
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 16),

//           // Weekday headers
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
//                   .map((day) => Text(
//                         day,
//                         style: const TextStyle(
//                             color: Colors.white70, fontSize: 12),
//                       ))
//                   .toList(),
//             ),
//           ),

//           const SizedBox(height: 16),

//           // Days grid (7 columns)
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 7,
//               childAspectRatio: 1.2,
//             ),
//             itemCount: days.length,
//             itemBuilder: (context, index) {
//               final date = days[index];
//               final isSelected = date.day == _selectedDate.day &&
//                   date.month == _selectedDate.month &&
//                   date.year == _selectedDate.year;

//               return GestureDetector(
//                 onTap: () {
//                   setState(() => _selectedDate = date);
//                   widget.onDateSelected(date);
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   decoration: isSelected
//                       ? BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                               color: Palette.themeColor,
//                               width: 2), // Green outline like your image
//                         )
//                       : null,
//                   child: Text(
//                     '${date.day}',
//                     style: TextStyle(
//                       color: isSelected ? Palette.themeColor : Palette.white,
//                       fontWeight:
//                           isSelected ? FontWeight.bold : FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),

//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }
