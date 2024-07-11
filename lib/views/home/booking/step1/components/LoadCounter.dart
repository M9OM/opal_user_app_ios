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
      _selectedLoads++;
    });
  }

  void _decrementLoads() {
    setState(() {
      if (_selectedLoads > 1) _selectedLoads--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _decrementLoads,
          ),
          Text(
            '$_selectedLoads',
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _incrementLoads,
          ),
        ],
      ),
    );
  }
}
