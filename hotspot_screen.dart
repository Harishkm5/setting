import 'package:flutter/material.dart';

class HotspotScreen extends StatefulWidget {
  const HotspotScreen({super.key});

  @override
  State<HotspotScreen> createState() => _HotspotScreenState();
}

class _HotspotScreenState extends State<HotspotScreen> {
  bool isHotspotEnabled = false;
  bool isUsbTetheringEnabled = false;
  bool isBluetoothTetheringEnabled = false;
  final TextEditingController _ssidController = TextEditingController(text: 'My Hotspot');
  final TextEditingController _passwordController = TextEditingController(text: 'password123');
  String securityType = 'WPA2 PSK';
  final List<String> securityTypes = ['None', 'WPA PSK', 'WPA2 PSK', 'WPA3'];

  @override
  void dispose() {
    _ssidController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Hotspot & Tethering'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          _buildHotspotCard(),
          const Divider(color: Colors.grey),
          _buildTetheringCard(),
          if (isHotspotEnabled) ...[
            const Divider(color: Colors.grey),
            _buildConnectedDevicesCard(),
          ],
        ],
      ),
    );
  }

  Widget _buildHotspotCard() {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text(
              'Wi-Fi Hotspot',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              isHotspotEnabled ? 'Active' : 'Inactive',
              style: TextStyle(color: Colors.grey[400]),
            ),
            value: isHotspotEnabled,
            onChanged: (value) {
              setState(() {
                isHotspotEnabled = value;
              });
            },
            activeColor: Colors.blue,
          ),
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _ssidController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Network name (SSID)',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: securityType,
                  dropdownColor: Colors.grey[900],
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Security',
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[600]!),
                    ),
                  ),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        securityType = newValue;
                      });
                    }
                  },
                  items: securityTypes
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTetheringCard() {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const ListTile(
            title: Text(
              'Other Tethering Options',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(color: Colors.grey),
          SwitchListTile(
            title: const Text(
              'USB Tethering',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Share internet via USB',
              style: TextStyle(color: Colors.grey[400]),
            ),
            value: isUsbTetheringEnabled,
            onChanged: (value) {
              setState(() {
                isUsbTetheringEnabled = value;
              });
            },
            activeColor: Colors.blue,
          ),
          SwitchListTile(
            title: const Text(
              'Bluetooth Tethering',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Share internet via Bluetooth',
              style: TextStyle(color: Colors.grey[400]),
            ),
            value: isBluetoothTetheringEnabled,
            onChanged: (value) {
              setState(() {
                isBluetoothTetheringEnabled = value;
              });
            },
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildConnectedDevicesCard() {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Connected Devices',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '2 devices connected',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            leading: const Icon(Icons.laptop, color: Colors.blue),
            title: const Text(
              'Laptop-ABC',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Connected for 45 minutes',
              style: TextStyle(color: Colors.grey[400]),
            ),
            trailing: Text(
              '2.5 GB',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.tablet, color: Colors.blue),
            title: const Text(
              'Tablet-XYZ',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Connected for 15 minutes',
              style: TextStyle(color: Colors.grey[400]),
            ),
            trailing: Text(
              '0.8 GB',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
        ],
      ),
    );
  }
} 