import 'package:flutter/material.dart';

class GraduatingYearDropdown extends StatefulWidget {
  @override
  _GraduatingYearDropdownState createState() => _GraduatingYearDropdownState();
}

class _GraduatingYearDropdownState extends State<GraduatingYearDropdown> {
  // Starting year for the dropdown
  int startYear = 2023;

  // List of graduating years from 2023 to 2030
  List<int> graduatingYears = List.generate(8, (index) => 2023 + index);

  // Selected year
  int selectedYear = 2023;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: selectedYear,
      onChanged: (int? year) {
        setState(() {
          selectedYear = year!;
        });
      },
      items: graduatingYears.map((int year) {
        return DropdownMenuItem<int>(
          value: year,
          child: Text(year.toString()),
        );
      }).toList(),
    );
  }
}
