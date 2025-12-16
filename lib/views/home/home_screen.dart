import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_task/config/colors.dart';
import 'package:test_task/utils/image_path.dart';
import 'package:test_task/widgets/calender_date_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  double waterIntake = 0;
  final double waterGoal = 2000;

  List<DateTime> getWeekDates(DateTime date) {
    final weekday = date.weekday;
    final firstDayOfWeek = date.subtract(Duration(days: weekday % 7));
    return List.generate(
        7, (index) => firstDayOfWeek.add(Duration(days: index)));
  }

  int getCurrentWeekNumber(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final firstMonday =
        firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday % 7));
    final difference = date.difference(firstMonday).inDays;
    return (difference / 7).floor() + 1;
  }

  int getTotalWeeksInMonth(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    final firstMonday =
        firstDayOfMonth.subtract(Duration(days: firstDayOfMonth.weekday % 7));
    final difference = lastDayOfMonth.difference(firstMonday).inDays;
    return (difference / 7).ceil();
  }

  // void _showCalendarPicker() async {
  //   final picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2020),
  //     lastDate: DateTime(2030),
  //     builder: (context, child) {
  //       return Theme(
  //         data: ThemeData.dark().copyWith(
  //           colorScheme: const ColorScheme.dark(
  //             primary: Palette.themeColor,
  //             onPrimary: Palette.white,
  //             surface: Palette.card,
  //             onSurface: Palette.white,
  //           ),
  //           dialogBackgroundColor: Palette.card,
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );

  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }
  void _showCalendarPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => DatePickerBottomSheet(
        initialDate: selectedDate,
        onDateSelected: (date) {
          setState(() => selectedDate = date);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final weekDates = getWeekDates(selectedDate);
    final currentWeek = getCurrentWeekNumber(selectedDate);
    final totalWeeks = getTotalWeeksInMonth(selectedDate);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          AssetsPath.png.notification,
                          color: Palette.white,
                          height: 28,
                          width: 28,
                        ),
                      ),
                      InkWell(
                        onTap: _showCalendarPicker,
                        borderRadius: BorderRadius.circular(20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              AssetsPath.png.weekFrame,
                              color: Palette.white,
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Week $currentWeek/$totalWeeks',
                              style: const TextStyle(
                                color: Palette.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: Palette.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Text(
                  'Today, ${DateFormat('dd MMM yyyy').format(selectedDate)}',
                  style: const TextStyle(
                    color: Palette.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: weekDates.map((date) {
                    final isSelected = date.day == selectedDate.day &&
                        date.month == selectedDate.month &&
                        date.year == selectedDate.year;
                    final dayName = DateFormat('E')
                        .format(date)
                        .substring(0, 2)
                        .toUpperCase();

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            dayName,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Palette.green.withOpacity(0.3)
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? Palette.green
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: const TextStyle(
                                  color: Palette.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (isSelected)
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: Palette.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 8),
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Workouts',
                      style: TextStyle(
                        color: Palette.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.wb_sunny_outlined,
                            color: Palette.white, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          '9°',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Palette.card,
                    borderRadius: BorderRadius.circular(16),
                    border: const Border(
                      left: BorderSide(
                        color: Palette.themeColor,
                        width: 4,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'December 22 - 25m - 30m',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Upper Body',
                            style: TextStyle(
                              color: Palette.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward, color: Palette.white),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                const Text(
                  'My Insights',
                  style: TextStyle(
                    color: Palette.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Palette.card,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  '550',
                                  style: TextStyle(
                                    color: Palette.white,
                                    fontSize: 44,
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(width: 4),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      'Calories',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '1950 Remaining',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '0',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  '2500',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: 0.22,
                                backgroundColor: Colors.grey[800],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Palette.themeColor),
                                minHeight: 6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Palette.card,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  '75',
                                  style: TextStyle(
                                    color: Palette.white,
                                    fontSize: 44,
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                const SizedBox(width: 4),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      'kg',
                                      style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.arrow_upward,
                                    color: Palette.themeColor, size: 12),
                                const SizedBox(width: 4),
                                Text(
                                  '+1.6kg',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Weight',
                              style: TextStyle(
                                color: Palette.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  // margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // gradient: const LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [
                    //     Color(0xFF0E1116),
                    //     Color(0xFF141A22),
                    //   ],
                    // ),
                    color: Palette.card,
                  ),
                  child: Column(
                    children: [
                      // Main Content
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// LEFT TEXT
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "0%",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4FC3F7),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Hydration",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Log Now",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white54,
                                  ),
                                ),
                              ],
                            ),

                            const Spacer(),

                            /// RIGHT WATER SCALE
                            ///
                            IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// LEFT LABELS (2L → 0L)
                                  const Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '2 L',
                                        style: TextStyle(
                                          color: Palette.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        '0 L',
                                        style: TextStyle(
                                          color: Palette.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(width: 10),

                                  /// SCALE + INDICATOR
                                  IntrinsicWidth(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          height: 4,
                                          width: 16,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF4FC3F7),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        ...List.generate(
                                          5,
                                          (index) => Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            height: 3,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF4FC3F7)
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          height: 4,
                                          width: 16,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF4FC3F7),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        ...List.generate(
                                          5,
                                          (index) => Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 6),
                                            height: 3,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFF4FC3F7)
                                                  .withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              height: 4,
                                              width: 16,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF4FC3F7),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 80,
                                              child: Divider(
                                                color: Palette.white
                                                    .withOpacity(0.5),
                                                thickness: 1,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  /// RIGHT VALUE
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '0ml',
                                        style: TextStyle(
                                          color: Palette.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Column(
                            //   children: List.generate(13, generator),
                            // ),
                            // Column(
                            //   children: [
                            //     const Text(
                            //       "2 L",
                            //       style: TextStyle(
                            //         color: Colors.white54,
                            //         fontSize: 12,
                            //       ),
                            //     ),
                            //     const SizedBox(height: 6),
                            //     Container(
                            //       height: 120,
                            //       width: 6,
                            //       decoration: BoxDecoration(
                            //         color: Colors.white10,
                            //         borderRadius: BorderRadius.circular(6),
                            //       ),
                            //       child: Align(
                            //         alignment: Alignment.bottomCenter,
                            //         child: Container(
                            //           height: 30, // current water level
                            //           decoration: BoxDecoration(
                            //             color: Color(0xFF4FC3F7),
                            //             borderRadius: BorderRadius.circular(6),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     const SizedBox(height: 6),
                            //     const Text(
                            //       "0 L",
                            //       style: TextStyle(
                            //         color: Colors.white54,
                            //         fontSize: 12,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),

                      /// BOTTOM BAR
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E4E57),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "500 ml added to water log",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.all(20),
                //   decoration: BoxDecoration(
                //     color: Palette.card,
                //     borderRadius: BorderRadius.circular(16),
                //   ),
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               const Text(
                //                 '0%',
                //                 style: TextStyle(
                //                   color: Palette.themeColor,
                //                   fontSize: 48,
                //                   fontWeight: FontWeight.bold,
                //                   height: 1,
                //                 ),
                //               ),
                //               const SizedBox(height: 16),
                //               const Text(
                //                 'Hydration',
                //                 style: TextStyle(
                //                   color: Palette.white,
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.w500,
                //                 ),
                //               ),
                //               const SizedBox(height: 4),
                //               Text(
                //                 'Log Now',
                //                 style: TextStyle(
                //                   color: Colors.grey[600],
                //                   fontSize: 12,
                //                 ),
                //               ),
                //             ],
                //           ),
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.end,
                //             children: [
                //               Row(
                //                 children: [
                // Text(
                //   '2L',
                //   style: TextStyle(
                //     color: Colors.grey[600],
                //     fontSize: 12,
                //   ),
                // ),
                //                   const SizedBox(width: 8),
                //                   Container(
                //                     width: 3,
                //                     height: 60,
                //                     decoration: BoxDecoration(
                //                       color: Colors.grey[800],
                //                       borderRadius: BorderRadius.circular(2),
                //                     ),
                //                     child: Align(
                //                       alignment: Alignment.bottomCenter,
                //                       child: Container(
                //                         width: 3,
                //                         height: 0,
                //                         decoration: const BoxDecoration(
                //                           color: Palette.themeColor,
                //                           borderRadius: BorderRadius.only(
                //                             bottomLeft: Radius.circular(2),
                //                             bottomRight: Radius.circular(2),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               const SizedBox(height: 8),
                //               Text(
                //                 '0ml',
                //                 style: TextStyle(
                //                   color: Colors.grey[600],
                //                   fontSize: 12,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //       const SizedBox(height: 16),
                //       Container(
                //         width: double.infinity,
                //         padding: const EdgeInsets.symmetric(vertical: 12),
                //         decoration: BoxDecoration(
                //           color: const Color(0xFF2D4A4A),
                //           borderRadius: BorderRadius.circular(8),
                //         ),
                //         child: const Center(
                //           child: Text(
                //             '500 ml added to water log',
                //             style: TextStyle(
                //               color: Palette.themeColor,
                //               fontSize: 12,
                //               fontWeight: FontWeight.w500,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
