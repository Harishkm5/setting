import 'package:flutter/material.dart';
import 'screens/device_info/about_phone_screen.dart';
import 'screens/device_info/system_update_screen.dart';
import 'screens/network/wifi_screen.dart';
import 'screens/network/bluetooth_screen.dart';
import 'screens/network/mobile_network_screen.dart';
import 'screens/network/hotspot_screen.dart';
import 'models/device_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchBar(
                hintText: 'Search settings',
                backgroundColor: WidgetStateProperty.all(Colors.grey[900]),
                hintStyle: WidgetStateProperty.all(
                  TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingsSection(
              context,
              'Device',
              [
                SettingsItem(
                  icon: Icons.phone_android,
                  iconColor: Colors.grey,
                  title: 'About phone',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutPhoneScreen(
                          deviceInfo: DeviceInfo(
                            deviceName: 'My Phone',
                            imei: '123456789012345',
                            androidVersion: 'Android 14',
                            model: 'Example Phone',
                            serialNumber: 'SN123456789',
                            ipAddress: '192.168.1.100',
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SettingsItem(
                  icon: Icons.system_update,
                  iconColor: Colors.deepOrange,
                  title: 'System update',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SystemUpdateScreen(
                          updateInfo: SystemUpdateInfo(
                            currentVersion: 'Android 14',
                            lastChecked: 'March 15, 2024',
                            updateAvailable: true,
                            updateSize: '1.2 GB',
                            updateDescription:
                                'Security patch and performance improvements',
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const Divider(color: Colors.grey),
            _buildSettingsSection(
              context,
              'Network & Internet',
              [
                SettingsItem(
                  icon: Icons.wifi,
                  iconColor: Colors.blue,
                  title: 'Wi-Fi',
                  trailing: 'Off',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WiFiScreen(),
                      ),
                    );
                  },
                ),
                SettingsItem(
                  icon: Icons.bluetooth,
                  iconColor: Colors.blue,
                  title: 'Bluetooth',
                  trailing: 'Off',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BluetoothScreen(),
                      ),
                    );
                  },
                ),
                SettingsItem(
                  icon: Icons.network_cell,
                  iconColor: Colors.green,
                  title: 'Mobile network',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MobileNetworkScreen(),
                      ),
                    );
                  },
                ),
                SettingsItem(
                  icon: Icons.wifi_tethering,
                  iconColor: Colors.blue,
                  title: 'Hotspot & tethering',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HotspotScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context,
    String title,
    List<SettingsItem> items,
  ) {
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
        ...items,
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final String? trailing;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: iconColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(color: Colors.grey[600]),
            )
          : null,
      trailing: trailing != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  trailing!,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            )
          : const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
