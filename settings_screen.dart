import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: ListView(
                children: [
                  _buildSettingsSection([
                    const SettingsItem(
                      icon: Icons.phone_android,
                      iconColor: Colors.grey,
                      title: 'About phone',
                      subtitle: 'Device name, IMEI, Android version',
                    ),
                    const SettingsItem(
                      icon: Icons.system_update,
                      iconColor: Colors.deepOrange,
                      title: 'System update',
                      subtitle: 'System version, security updates',
                    ),
                  ]),
                  const Divider(color: Colors.grey),
                  _buildSettingsSection([
                    const SettingsItem(
                      icon: Icons.wifi,
                      iconColor: Colors.blue,
                      title: 'Wi-Fi',
                      trailing: 'Off',
                    ),
                    const SettingsItem(
                      icon: Icons.bluetooth,
                      iconColor: Colors.blue,
                      title: 'Bluetooth',
                      trailing: 'Off',
                    ),
                    const SettingsItem(
                      icon: Icons.network_cell,
                      iconColor: Colors.green,
                      title: 'Mobile network',
                      subtitle: 'SIM cards, data usage, 5G',
                    ),
                    const SettingsItem(
                      icon: Icons.wifi_tethering,
                      iconColor: Colors.blue,
                      title: 'Hotspot & tethering',
                      trailing: 'On',
                    ),
                    const SettingsItem(
                      icon: Icons.airplanemode_active,
                      iconColor: Colors.orange,
                      title: 'Airplane mode',
                      trailing: 'Off',
                    ),
                    const SettingsItem(
                      icon: Icons.vpn_key,
                      iconColor: Colors.purple,
                      title: 'VPN',
                      trailing: 'Off',
                    ),
                  ]),
                  const Divider(color: Colors.grey),
                  _buildSettingsSection([
                    const SettingsItem(
                      icon: Icons.notifications,
                      iconColor: Colors.red,
                      title: 'Notifications',
                      subtitle: 'App notifications, Do Not Disturb',
                    ),
                    const SettingsItem(
                      icon: Icons.volume_up,
                      iconColor: Colors.blue,
                      title: 'Sound & vibration',
                      subtitle: 'Volume, ringtone, system sounds',
                    ),
                    const SettingsItem(
                      icon: Icons.display_settings,
                      iconColor: Colors.amber,
                      title: 'Display',
                      subtitle: 'Brightness, dark mode, font size',
                    ),
                  ]),
                  const Divider(color: Colors.grey),
                  _buildSettingsSection([
                    const SettingsItem(
                      icon: Icons.lock,
                      iconColor: Colors.deepOrange,
                      title: 'Security',
                      subtitle: 'Screen lock, fingerprint, face unlock',
                    ),
                    const SettingsItem(
                      icon: Icons.privacy_tip,
                      iconColor: Colors.green,
                      title: 'Privacy',
                      subtitle: 'Permissions, passwords, autofill',
                    ),
                    const SettingsItem(
                      icon: Icons.location_on,
                      iconColor: Colors.cyan,
                      title: 'Location',
                      trailing: 'On',
                    ),
                  ]),
                  const Divider(color: Colors.grey),
                  _buildSettingsSection([
                    const SettingsItem(
                      icon: Icons.battery_charging_full,
                      iconColor: Colors.green,
                      title: 'Battery',
                      subtitle: '85% - About 4h until full',
                    ),
                    const SettingsItem(
                      icon: Icons.storage,
                      iconColor: Colors.blue,
                      title: 'Storage',
                      subtitle: '64% used - 72.5 GB free',
                    ),
                    const SettingsItem(
                      icon: Icons.memory,
                      iconColor: Colors.purple,
                      title: 'Memory',
                      subtitle: '4.2 GB available',
                    ),
                  ]),
                  const Divider(color: Colors.grey),
                  _buildSettingsSection([
                    const SettingsItem(
                      icon: Icons.person,
                      iconColor: Colors.blue,
                      title: 'Users & accounts',
                      subtitle: 'Add account, emergency info',
                    ),
                    const SettingsItem(
                      icon: Icons.accessibility,
                      iconColor: Colors.green,
                      title: 'Accessibility',
                      subtitle: 'TalkBack, display, interaction',
                    ),
                    const SettingsItem(
                      icon: Icons.backup,
                      iconColor: Colors.amber,
                      title: 'Backup',
                      subtitle: 'Google Drive backup',
                    ),
                    const SettingsItem(
                      icon: Icons.language,
                      iconColor: Colors.deepPurple,
                      title: 'System',
                      subtitle: 'Languages, time, backup, reset',
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(List<Widget> items) {
    return Column(
      children: items,
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final String? trailing;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.subtitle,
    this.trailing,
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
    );
  }
} 