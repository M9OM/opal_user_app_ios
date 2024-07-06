import 'package:flutter/material.dart';

class LoadCounter extends StatefulWidget {
  const LoadCounter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadCounterState createState() => _LoadCounterState();
}

class _LoadCounterState extends State<LoadCounter> {
  int _selectedLoads = 1;

  void _incrementLoads() {
    setState(() {
      if (_selectedLoads < 24) _selectedLoads++;
    });
  }

  void _decrementLoads() {
    setState(() {
      if (_selectedLoads > 1) _selectedLoads--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _decrementLoads,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 1, color: Colors.white),
          ),
          child: Text(
            '$_selectedLoads',
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _incrementLoads,
        ),
      ],
    );
  }
}
