import 'package:flutter/material.dart';
import 'package:test_task/config/colors.dart';
import 'package:test_task/models/workout/workout_model.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}



class _PlanScreenState extends State<PlanScreen> {
  late Map<int, List<Workout>> scheduledWorkouts;

  @override
  void initState() {
    super.initState();
    scheduledWorkouts = {
      8: [
        Workout(
          id: '1',
          name: 'Arm Blaster',
          tag: "Arm Workout",
          duration: '25m - 30m',
          color: const Color(0xFF4CAF50),
          bgColor: const Color(0xFF2A3A2A),
          icon: Icons.fitness_center,
        )
      ],
      11: [
        Workout(
          id: '2',
          name: 'Leg Day Blitz',
          tag: "Leg Workout",
          duration: '25m - 30m',
          color: const Color(0xFF9C27B0),
          bgColor: const Color(0xFF3A2A3A),
          icon: Icons.fitness_center,
        )
      ],
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildWeek(),
                  _buildCalendarDays(),
                ],
              ),
            ),
                  _buildWeek(bottom: true),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Training Calendar',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildWeek({
    bool bottom = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration:  BoxDecoration(
        color: Palette.card,
        border: Border(
          top: BorderSide(
              color: bottom ? const Color(0xff2EAA99) : const Color(0xff4855DF), width: 2),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Week 2/8',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'December 8 - 14',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                'Total 60 min',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarDays() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final dates = [8, 9, 10, 11, 12, 13, 14];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: List.generate(7, (index) {
          final day = dates[index];
          final workouts = scheduledWorkouts[day] ?? [];

          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(days[index],
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey)),
                        Text(day.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: DragTarget<Workout>(
                      onWillAccept: (_) => true,
                      onAcceptWithDetails: (details) {
                        setState(() {
                          final workout = details.data;

                          int? fromDay;
                          scheduledWorkouts.forEach((key, list) {
                            if (list.any((w) => w.id == workout.id)) {
                              fromDay = key;
                            }
                          });

                          if (fromDay == null || fromDay == day) return;

                          scheduledWorkouts[fromDay]!
                              .removeWhere((w) => w.id == workout.id);

                          scheduledWorkouts.putIfAbsent(day, () => []);
                          scheduledWorkouts[day]!.add(workout);
                        });
                      },
                      builder: (context, candidate, rejected) {
                        return Container(
                          constraints: const BoxConstraints(minHeight: 70),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: candidate.isNotEmpty
                                ? Colors.white.withOpacity(0.05)
                                : Colors.transparent,
                            border: Border.all(
                              color: candidate.isNotEmpty
                                  ? Colors.cyan
                                  : Colors.transparent,
                            ),
                          ),
                          child: workouts.isNotEmpty
                              ? Column(
                                  children: workouts
                                      .map((w) => _buildWorkoutCard(w))
                                      .toList(),
                                )
                              : const SizedBox(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildWorkoutCard(Workout workout) {
    return LongPressDraggable<Workout>(
      data: workout,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      hapticFeedbackOnStart: true,
      feedback: Material(
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: _buildCard(workout),
        ),
      ),
      childWhenDragging: Opacity(opacity: 0.3, child: _buildCard(workout)),
      child: _buildCard(workout),
    );
  }

  Widget _buildCard(Workout workout) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.card,
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            left: BorderSide(color: Colors.white, width: 4),
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Icon(Icons.drag_indicator, size: 18, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: workout.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      workout.tag,
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    workout.name,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Text(
              workout.duration,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
