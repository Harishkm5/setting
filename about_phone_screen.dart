import 'package:flutter/material.dart';
import '../../models/device_info.dart';

class AboutPhoneScreen extends StatelessWidget {
  final DeviceInfo deviceInfo;

  const AboutPhoneScreen({
    super.key,
    required this.deviceInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('About Phone'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildDeviceInfoCard(),
          const SizedBox(height: 16),
          _buildHardwareInfoCard(),
          const SizedBox(height: 16),
          _buildSoftwareInfoCard(),
        ],
      ),
    );
  }

  Widget _buildDeviceInfoCard() {
    return Card(
      color: Colors.grey[900],
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Device Information',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Basic device details',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          const Divider(color: Colors.grey),
          _buildInfoTile('Device name', deviceInfo.deviceName),
          _buildInfoTile('Model', deviceInfo.model),
          _buildInfoTile('IMEI', deviceInfo.imei),
          _buildInfoTile('Serial number', deviceInfo.serialNumber),
        ],
      ),
    );
  }

  Widget _buildHardwareInfoCard() {
    return Card(
      color: Colors.grey[900],
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Hardware',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Hardware specifications',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          const Divider(color: Colors.grey),
          _buildInfoTile('Processor', 'Snapdragon 8 Gen 2'),
          _buildInfoTile('RAM', '8 GB'),
          _buildInfoTile('Storage', '256 GB'),
          _buildInfoTile('Screen size', '6.7 inches'),
        ],
      ),
    );
  }

  Widget _buildSoftwareInfoCard() {
    return Card(
      color: Colors.grey[900],
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Software',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Software information',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          const Divider(color: Colors.grey),
          _buildInfoTile('Android version', deviceInfo.androidVersion),
          _buildInfoTile('Security patch', 'March 1, 2024'),
          _buildInfoTile('Build number', 'QKQ1.200114.002'),
          _buildInfoTile('IP address', deviceInfo.ipAddress),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: Text(
        value,
        style: TextStyle(color: Colors.grey[400]),
      ),
    );
  }
} 