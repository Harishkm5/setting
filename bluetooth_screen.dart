import 'package:flutter/material.dart';

class BluetoothScreen extends StatefulWidget {
  const BluetoothScreen({super.key});

  @override
  State<BluetoothScreen> createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  bool isBluetoothEnabled = false;
  bool isScanning = false;
  final List<BluetoothDevice> pairedDevices = [
    BluetoothDevice(
      name: 'Galaxy Buds Pro',
      type: BluetoothDeviceType.audio,
      isPaired: true,
      isConnected: true,
      batteryLevel: 85,
    ),
    BluetoothDevice(
      name: 'Car Stereo',
      type: BluetoothDeviceType.audio,
      isPaired: true,
    ),
  ];

  final List<BluetoothDevice> availableDevices = [
    BluetoothDevice(
      name: 'BT Speaker',
      type: BluetoothDeviceType.audio,
    ),
    BluetoothDevice(
      name: 'Wireless Mouse',
      type: BluetoothDeviceType.peripheral,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Bluetooth'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text(
              'Bluetooth',
              style: TextStyle(color: Colors.white),
            ),
            value: isBluetoothEnabled,
            onChanged: (value) {
              setState(() {
                isBluetoothEnabled = value;
                isScanning = value;
              });
            },
            activeColor: Colors.blue,
          ),
          if (isBluetoothEnabled) ...[
            const Divider(color: Colors.grey),
            _buildDeviceSection('Paired Devices', pairedDevices),
            if (isScanning) ...[
              const Divider(color: Colors.grey),
              _buildDeviceSection('Available Devices', availableDevices),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildDeviceSection(String title, List<BluetoothDevice> devices) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
            ),
          ),
        ),
        ...devices.map((device) => _buildDeviceTile(device)),
      ],
    );
  }

  Widget _buildDeviceTile(BluetoothDevice device) {
    return ListTile(
      leading: Icon(
        _getDeviceIcon(device.type),
        color: Colors.blue,
        size: 24,
      ),
      title: Text(
        device.name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        device.isPaired ? 'Paired' : 'Available',
        style: TextStyle(color: Colors.grey[600]),
      ),
      trailing: device.isConnected
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (device.batteryLevel != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      '${device.batteryLevel}%',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                const Text(
                  'Connected',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            )
          : null,
      onTap: () {
        // Connect to device
      },
    );
  }

  IconData _getDeviceIcon(BluetoothDeviceType type) {
    switch (type) {
      case BluetoothDeviceType.audio:
        return Icons.headphones;
      case BluetoothDeviceType.peripheral:
        return Icons.mouse;
      case BluetoothDeviceType.phone:
        return Icons.phone_android;
      default:
        return Icons.bluetooth;
    }
  }
}

enum BluetoothDeviceType {
  audio,
  peripheral,
  phone,
  other,
}

class BluetoothDevice {
  final String name;
  final BluetoothDeviceType type;
  final bool isPaired;
  final bool isConnected;
  final int? batteryLevel;

  BluetoothDevice({
    required this.name,
    this.type = BluetoothDeviceType.other,
    this.isPaired = false,
    this.isConnected = false,
    this.batteryLevel,
  });
} 