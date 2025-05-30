import 'package:flutter/material.dart';

class WiFiScreen extends StatefulWidget {
  const WiFiScreen({super.key});

  @override
  State<WiFiScreen> createState() => _WiFiScreenState();
}

class _WiFiScreenState extends State<WiFiScreen> {
  bool isWifiEnabled = false;
  final List<WiFiNetwork> availableNetworks = [
    WiFiNetwork(
      ssid: 'Home Network',
      strength: 4,
      isSecured: true,
      isConnected: true,
    ),
    WiFiNetwork(
      ssid: 'Neighbor\'s WiFi',
      strength: 3,
      isSecured: true,
    ),
    WiFiNetwork(
      ssid: 'Coffee Shop',
      strength: 2,
      isSecured: false,
    ),
    WiFiNetwork(
      ssid: 'Guest Network',
      strength: 1,
      isSecured: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Wi-Fi'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text(
              'Wi-Fi',
              style: TextStyle(color: Colors.white),
            ),
            value: isWifiEnabled,
            onChanged: (value) {
              setState(() {
                isWifiEnabled = value;
              });
            },
            activeColor: Colors.blue,
          ),
          const Divider(color: Colors.grey),
          if (isWifiEnabled) ...[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Available Networks',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ),
            ...availableNetworks.map((network) => _buildNetworkTile(network)),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add network manually
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildNetworkTile(WiFiNetwork network) {
    return ListTile(
      leading: const Icon(
        Icons.wifi,
        color: Colors.blue,
        size: 24,
      ),
      title: Text(
        network.ssid,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Row(
        children: [
          ...List.generate(
            4,
            (index) => Icon(
              Icons.signal_wifi_4_bar,
              size: 14,
              color: index < network.strength
                  ? Colors.blue
                  : Colors.grey[600],
            ),
          ),
          const SizedBox(width: 8),
          if (network.isSecured)
            Icon(Icons.lock, size: 14, color: Colors.grey[600]),
        ],
      ),
      trailing: network.isConnected
          ? const Text(
              'Connected',
              style: TextStyle(color: Colors.blue),
            )
          : null,
      onTap: () {
        // Connect to network
      },
    );
  }
}

class WiFiNetwork {
  final String ssid;
  final int strength; // 1-4
  final bool isSecured;
  final bool isConnected;

  WiFiNetwork({
    required this.ssid,
    required this.strength,
    required this.isSecured,
    this.isConnected = false,
  });
} 