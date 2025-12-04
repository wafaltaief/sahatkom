// lib/widgets/simple_date_picker.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SimpleDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final DateTime? initialDate;

  const SimpleDatePicker({
    super.key,
    required this.onDateSelected,
    this.initialDate,
  });

  @override
  State<SimpleDatePicker> createState() => _SimpleDatePickerState();
}

class _SimpleDatePickerState extends State<SimpleDatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // أيام الأسبوع
          _buildWeekDays(),
          const SizedBox(height: 10),
          
          // أيام الشهر
          _buildDaysGrid(),
          const SizedBox(height: 20),
          
          // تاريخ مختار
          _buildSelectedDate(),
          const SizedBox(height: 20),
          
          // أزرار
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildWeekDays() {
    final weekDays = ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven', 'Sam', 'Dim'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: weekDays
          .map(
            (day) => Expanded(
              child: Center(
                child: Text(
                  day,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDaysGrid() {
    final now = DateTime.now();
    final days = <Widget>[];
    
    // إضافة 30 يومًا قادمًا
    for (int i = 0; i < 30; i++) {
      final date = now.add(Duration(days: i));
      final isSelected = _selectedDate.day == date.day &&
          _selectedDate.month == date.month &&
          _selectedDate.year == date.year;
      final isToday = i == 0;

      days.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
            },
            child: Container(
              margin: const EdgeInsets.all(2),
              height: 40,
              decoration: BoxDecoration(
                color: isSelected ? Colors.teal : Colors.transparent,
                shape: BoxShape.circle,
                border: isToday
                    ? Border.all(color: Colors.teal)
                    : null,
              ),
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected
                        ? Colors.white
                        : isToday
                            ? Colors.teal
                            : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Wrap(
      children: days,
    );
  }

  Widget _buildSelectedDate() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.calendar_today, color: Colors.teal, size: 20),
          const SizedBox(width: 10),
          Text(
            DateFormat('EEEE d MMMM y', 'fr').format(_selectedDate),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            widget.onDateSelected(_selectedDate);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
          ),
          child: const Text('OK'),
        ),
      ],
    );
  }
}