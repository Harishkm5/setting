import 'package:flutter/material.dart';

class MobileNetworkScreen extends StatefulWidget {
  const MobileNetworkScreen({super.key});

  @override
  State<MobileNetworkScreen> createState() => _MobileNetworkScreenState();
}

class _MobileNetworkScreenState extends State<MobileNetworkScreen> {
  bool isMobileDataEnabled = true;
  bool isRoamingEnabled = false;
  String selectedNetworkMode = '5G';
  final List<String> networkModes = ['5G', '4G/LTE', '3G', '2G'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Mobile Network'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          _buildNetworkStatusCard(),
          const Divider(color: Colors.grey),
          _buildDataUsageCard(),
          const Divider(color: Colors.grey),
          _buildNetworkSettingsCard(),
        ],
      ),
    );
  }

  Widget _buildNetworkStatusCard() {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Network Status',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Connected to 5G network',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text(
              'Signal Strength',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.signal_cellular_alt,
                  size: 16,
                  color: index < 4 ? Colors.green : Colors.grey[600],
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Carrier',
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              'Example Carrier',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataUsageCard() {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Data Usage',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Billing cycle: 1-30 March',
              style: TextStyle(color: Colors.grey[400]),
            ),
          ),
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.grey[800],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                const SizedBox(height: 8),
                Text(
                  '7.0 GB of 10 GB used',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkSettingsCard() {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          const ListTile(
            title: Text(
              'Network Settings',
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
              'Mobile Data',
              style: TextStyle(color: Colors.white),
            ),
            value: isMobileDataEnabled,
            onChanged: (value) {
              setState(() {
                isMobileDataEnabled = value;
              });
            },
            activeColor: Colors.blue,
          ),
          SwitchListTile(
            title: const Text(
              'Data Roaming',
              style: TextStyle(color: Colors.white),
            ),
            value: isRoamingEnabled,
            onChanged: (value) {
              setState(() {
                isRoamingEnabled = value;
              });
            },
            activeColor: Colors.blue,
          ),
          ListTile(
            title: const Text(
              'Preferred Network Mode',
              style: TextStyle(color: Colors.white),
            ),
            trailing: DropdownButton<String>(
              value: selectedNetworkMode,
              dropdownColor: Colors.grey[900],
              style: const TextStyle(color: Colors.blue),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedNetworkMode = newValue;
                  });
                }
              },
              items: networkModes
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
} 