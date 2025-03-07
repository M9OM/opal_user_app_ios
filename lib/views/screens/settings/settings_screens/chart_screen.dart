import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen>
    with SingleTickerProviderStateMixin {
  final List<UserStatistics> data = [
    UserStatistics('Paid', 20, DateTime(2007, 2, 5)),
    UserStatistics('Paid', 25, DateTime(2011, 2, 5)),
    UserStatistics('Paid', 20, DateTime(2013, 2, 5)),
    UserStatistics('Paid', 15, DateTime(2015, 6, 15)),
    UserStatistics('Paid', 15, DateTime(2019, 6, 15)),
    UserStatistics('Paid', 10, DateTime(2020, 1, 1)),
    UserStatistics('Paid', 10, DateTime(2022, 1, 1)),
    UserStatistics('Paid', 10, DateTime(2022, 1, 1)),
    UserStatistics('Paid', 10, DateTime(2022, 1, 1)),
    UserStatistics('Paid', 15, DateTime(2022, 6, 15)),
    UserStatistics('Paid', 15, DateTime(2022, 6, 15)),
    UserStatistics('Paid', 20, DateTime(2023, 2, 5)),
    UserStatistics('Paid', 25, DateTime(2023, 2, 5)),
    UserStatistics('Paid', 20, DateTime(2023, 2, 5)),
    UserStatistics('Paid', 25, DateTime(2023, 2, 5)),
    UserStatistics('Paid', 30, DateTime(2023, 7, 10)),
    UserStatistics('Paid', 30, DateTime(2023, 7, 10)),
    UserStatistics('Paid', 30, DateTime(2023, 7, 10)),
    UserStatistics('Paid', 35, DateTime(2023, 11, 20)),
    UserStatistics('Paid', 35, DateTime(2023, 11, 20)),
    UserStatistics('Completed Orders', 20, DateTime(2020, 11, 20)),
    UserStatistics('Completed Orders', 30, DateTime(2021, 1, 5)),
    UserStatistics('Completed Orders', 35, DateTime(2022, 1, 5)),
    UserStatistics('Completed Orders', 40, DateTime(2023, 1, 5)),
    UserStatistics('Completed Orders', 25, DateTime(2024, 3, 20)),
    UserStatistics('Completed Orders', 45, DateTime(2024, 5, 15)),
    UserStatistics('Canceled Orders', 15, DateTime(2020, 11, 20)),
    UserStatistics('Canceled Orders', 10, DateTime(2021, 1, 5)),
    UserStatistics('Canceled Orders', 5, DateTime(2022, 1, 5)),
    UserStatistics('Canceled Orders', 0, DateTime(2023, 1, 5)),
    UserStatistics('Canceled Orders', 5, DateTime(2024, 3, 20)),
    UserStatistics('Canceled Orders', 10, DateTime(2024, 5, 15))
  ];

  String _selectedPeriod = 'Yearly';

  List<UserStatistics> getAllTimeData(String category) {
    return data.where((d) => d.category == category).toList();
  }

  List<UserStatistics> getYearlyData(String category) {
    var groupedByYear = <int, int>{};
    for (var item in data.where((d) => d.category == category)) {
      var year = item.timestamp.year;
      if (groupedByYear.containsKey(year)) {
        groupedByYear[year] = groupedByYear[year]! + item.count;
      } else {
        groupedByYear[year] = item.count;
      }
    }
    return groupedByYear.entries
        .map((e) => UserStatistics(category, e.value, DateTime(e.key)))
        .toList();
  }

  List<UserStatistics> getMonthlyData(String category) {
    var groupedByMonth = <String, int>{};
    for (var item in data.where((d) => d.category == category)) {
      var month = DateFormat.yM().format(item.timestamp);
      if (groupedByMonth.containsKey(month)) {
        groupedByMonth[month] = groupedByMonth[month]! + item.count;
      } else {
        groupedByMonth[month] = item.count;
      }
    }
    return groupedByMonth.entries
        .map((e) =>
            UserStatistics(category, e.value, DateFormat.yM().parse(e.key)))
        .toList();
  }

  List<UserStatistics> getWeeklyData(String category) {
    var groupedByWeek = <String, int>{};
    for (var item in data.where((d) => d.category == category)) {
      var week =
          '${item.timestamp.year}-W${item.timestamp.weekOfYear.toString().padLeft(2, '0')}';
      if (groupedByWeek.containsKey(week)) {
        groupedByWeek[week] = groupedByWeek[week]! + item.count;
      } else {
        groupedByWeek[week] = item.count;
      }
    }
    return groupedByWeek.entries.map((e) {
      var year = int.parse(e.key.split('-W')[0]);
      var week = int.parse(e.key.split('-W')[1]);
      return UserStatistics(
          category, e.value, _getDateTimeByWeekNumber(year, week));
    }).toList();
  }

  DateTime _getDateTimeByWeekNumber(int year, int week) {
    var firstDayOfYear = DateTime(year, 1, 1);
    var daysToAdd = (week - 1) * 7;
    var firstMonday = firstDayOfYear.weekday == DateTime.monday
        ? firstDayOfYear
        : firstDayOfYear.add(Duration(days: (8 - firstDayOfYear.weekday)));
    return firstMonday.add(Duration(days: daysToAdd));
  }

  List<UserStatistics> getChartData(String category) {
    switch (_selectedPeriod) {
      case 'Yearly':
        return getYearlyData(category);
      case 'Monthly':
        return getMonthlyData(category);
      case 'Weekly':
        return getWeeklyData(category);
      default:
        return getAllTimeData(category);
    }
  }

  int getTotalOMR(String category) {
    return getChartData(category)
        .map((d) => d.count)
        .reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Statistics'),
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                switch (index) {
                  case 0:
                    _selectedPeriod = 'Yearly';
                    break;
                  case 1:
                    _selectedPeriod = 'Monthly';
                    break;
                  case 2:
                    _selectedPeriod = 'Weekly';
                    break;
                }
              });
            },
            tabs: [
              Tab(text: 'Yearly'),
              Tab(text: 'Monthly'),
              Tab(text: 'Weekly'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Paid Events ($_selectedPeriod) - Total: ${getTotalOMR('Paid')} OMR',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 300,
                      child: SfCartesianChart(
                        tooltipBehavior: TooltipBehavior(enable: true),
                        primaryXAxis: DateTimeAxis(),
                        series: <ChartSeries<UserStatistics, DateTime>>[
                          LineSeries<UserStatistics, DateTime>(
                            dataSource: getChartData('Paid'),
                            color: Colors.red,
                            xValueMapper: (UserStatistics stats, _) =>
                                stats.timestamp,
                            yValueMapper: (UserStatistics stats, _) =>
                                stats.count,
                            name: 'Paid',
                            markerSettings: MarkerSettings(isVisible: true),
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Order Events ($_selectedPeriod)',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 300,
                      child: SfCartesianChart(
                        tooltipBehavior: TooltipBehavior(enable: true),
                        primaryXAxis: DateTimeAxis(),
                        series: <ChartSeries<UserStatistics, DateTime>>[
                          StackedBarSeries<UserStatistics, DateTime>(
                            dataSource: getChartData('Completed Orders'),
                            color: Colors.green,
                            xValueMapper: (UserStatistics stats, _) =>
                                stats.timestamp,
                            yValueMapper: (UserStatistics stats, _) =>
                                stats.count,
                            name: 'Completed Orders',
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true),
                          ),
                          StackedBarSeries<UserStatistics, DateTime>(
                            dataSource: getChartData('Canceled Orders'),
                            color: Colors.red,
                            xValueMapper: (UserStatistics stats, _) =>
                                stats.timestamp,
                            yValueMapper: (UserStatistics stats, _) =>
                                stats.count,
                            name: 'Canceled Orders',
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserStatistics {
  final String category;
  final int count;
  final DateTime timestamp;

  UserStatistics(this.category, this.count, this.timestamp);
}

extension DateTimeExtension on DateTime {
  int get weekOfYear {
    var firstDayOfYear = DateTime(year, 1, 1);
    var dayOfYear = int.parse(DateFormat("D").format(this));
    return ((dayOfYear - firstDayOfYear.weekday + 10) / 7).floor();
  }
}
