class DeviceInfo {
  final String deviceName;
  final String imei;
  final String androidVersion;
  final String model;
  final String serialNumber;
  final String ipAddress;

  DeviceInfo({
    required this.deviceName,
    required this.imei,
    required this.androidVersion,
    required this.model,
    required this.serialNumber,
    required this.ipAddress,
  });
}

class SystemUpdateInfo {
  final String currentVersion;
  final String lastChecked;
  final bool updateAvailable;
  final String updateSize;
  final String updateDescription;

  SystemUpdateInfo({
    required this.currentVersion,
    required this.lastChecked,
    required this.updateAvailable,
    required this.updateSize,
    required this.updateDescription,
  });
} 