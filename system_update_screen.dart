import 'package:flutter/material.dart';
import '../../models/device_info.dart';

class SystemUpdateScreen extends StatelessWidget {
  final SystemUpdateInfo updateInfo;

  const SystemUpdateScreen({
    super.key,
    required this.updateInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('System Update'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildUpdateStatusCard(),
          if (updateInfo.updateAvailable) ...[
            const SizedBox(height: 16),
            _buildUpdateDetailsCard(),
          ],
        ],
      ),
    );
  }

  Widget _buildUpdateStatusCard() {
    return Card(
      color: Colors.grey[900],
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              updateInfo.updateAvailable
                  ? Icons.system_update
                  : Icons.check_circle,
              color: updateInfo.updateAvailable ? Colors.blue : Colors.green,
              size: 48,
            ),
            title: Text(
              updateInfo.updateAvailable
                  ? 'Update Available'
                  : 'System is Up to Date',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Last checked: ${updateInfo.lastChecked}',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text(
              'Current Version',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              updateInfo.currentVersion,
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateDetailsCard() {
    return Card(
      color: Colors.grey[900],
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Update Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Size: ${updateInfo.updateSize}',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              updateInfo.updateDescription,
              style: TextStyle(color: Colors.grey[300]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle update installation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text('Download and Install'),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 