import 'package:flutter/material.dart';

enum AppStatus {
  loading('Loading...', Icons.hourglass_empty, Colors.blue),
  success('Success!', Icons.check_circle, Colors.green),
  error('Error occurred!', Icons.error_outline, Colors.red);

  final String description;
  final IconData icon;
  final Color statusColor;

  const AppStatus(this.description, this.icon, this.statusColor);
}

class StatusWidget extends StatefulWidget {
  const StatusWidget({super.key});

  @override
  StatusWidgetState createState() => StatusWidgetState();
}

class StatusWidgetState extends State<StatusWidget> {
  AppStatus _currentStatus = AppStatus.success;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhanced Enum Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _currentStatus.icon,
              size: 100,
              color: _currentStatus.statusColor,
            ),
            const SizedBox(height: 20),
            Text(
              _currentStatus.description,
              style: TextStyle(fontSize: 24, color: _currentStatus.statusColor),
            ),
            const SizedBox(height: 40),

            // Dropdown to switch between different statuses
            DropdownButton<AppStatus>(
              value: _currentStatus,
              items: AppStatus.values.map((status) {
                return DropdownMenuItem<AppStatus>(
                  value: status,
                  child: Text(status.description),
                );
              }).toList(),
              onChanged: (AppStatus? newStatus) {
                setState(() {
                  _currentStatus = newStatus!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
