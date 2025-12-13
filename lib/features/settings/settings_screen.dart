import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:triggeo/core/services/service_locator.dart';
import 'package:triggeo/features/settings/offline_map_screen.dart';
import 'package:triggeo/features/settings/theme_controller.dart';
import 'package:triggeo/data/repositories/settings_repository.dart';
import 'package:triggeo/l10n/app_localizations.dart';

enum GlobalReminderType { ringtone, vibration, both }

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late Box _settingsBox;

  GlobalReminderType _reminderType = GlobalReminderType.both;
  String? _customRingtonePath;
  int _distanceFilter = 10;
  String _vibrationPatternString = "0, 1000, 500, 1000, 500, 1000";
  final TextEditingController _patternController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _settingsBox = Hive.box('settings_box');
    setState(() {
      int typeIndex = _settingsBox.get('reminder_type', defaultValue: 2);
      _reminderType = GlobalReminderType.values[typeIndex];
      _customRingtonePath = _settingsBox.get('custom_ringtone_path');
      _distanceFilter = _settingsBox.get('distance_filter', defaultValue: 10);
      _vibrationPatternString = _settingsBox.get('vibration_pattern',
          defaultValue: "0, 1000, 500, 1000, 500, 1000");
      _patternController.text = _vibrationPatternString;
    });
  }

  Future<void> _saveReminderType(GlobalReminderType type) async {
    setState(() => _reminderType = type);
    await _settingsBox.put('reminder_type', type.index);
  }

  Future<void> _saveDistanceFilter(int value) async {
    setState(() => _distanceFilter = value);
    await _settingsBox.put('distance_filter', value);
    // update distance filter in location service
    final locationService = ref.read(locationServiceProvider);
    await locationService.updateDistanceFilter(value);
  }

  Future<void> _saveVibrationPattern(String patternString) async {
    setState(() => _vibrationPatternString = patternString);
    await _settingsBox.put('vibration_pattern', patternString);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)!
                .settingsVibrationPatternSaved(patternString))),
      );
    }
  }

  Future<void> _pickAndSaveRingtone() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.audio, allowMultiple: false);

    if (result != null && result.files.single.path != null) {
      final sourceFile = File(result.files.single.path!);
      final appDir = await getApplicationDocumentsDirectory();

      final fileName =
          'ringtone_${DateTime.now().millisecondsSinceEpoch}${path.extension(sourceFile.path)}';
      final savedFile = await sourceFile.copy('${appDir.path}/$fileName');

      setState(() {
        _customRingtonePath = savedFile.path;
      });

      await _settingsBox.put('custom_ringtone_path', savedFile.path);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(AppLocalizations.of(context)!
                  .settingsRingtoneSaved(result.files.single.name))),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch(themeControllerProvider);
    final themeNotifier = ref.read(themeControllerProvider.notifier);
    final audioService = ref.read(audioServiceProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.settingsTitle)),
      body: ListView(
        children: [
          // Notification
          _buildSectionHeader(
              context, AppLocalizations.of(context)!.settingsReminderSection),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                RadioListTile<GlobalReminderType>(
                  title: Text(
                      AppLocalizations.of(context)!.settingsReminderRingtone),
                  value: GlobalReminderType.ringtone,
                  groupValue: _reminderType,
                  onChanged: (val) => _saveReminderType(val!),
                ),
                RadioListTile<GlobalReminderType>(
                  title: Text(
                      AppLocalizations.of(context)!.settingsReminderVibration),
                  value: GlobalReminderType.vibration,
                  groupValue: _reminderType,
                  onChanged: (val) => _saveReminderType(val!),
                ),
                RadioListTile<GlobalReminderType>(
                  title:
                      Text(AppLocalizations.of(context)!.settingsReminderBoth),
                  value: GlobalReminderType.both,
                  groupValue: _reminderType,
                  onChanged: (val) => _saveReminderType(val!),
                ),
              ],
            ),
          ),

          const Divider(),

          // Custom Ringtone
          ListTile(
            leading: const Icon(Icons.music_note),
            title: Text(AppLocalizations.of(context)!.settingsCustomRingtone),
            subtitle: Text(_customRingtonePath != null
                ? path.basename(_customRingtonePath!)
                : AppLocalizations.of(context)!.settingsPickRingtone),
            trailing: const Icon(Icons.chevron_right),
            onTap: _pickAndSaveRingtone,
          ),

          // Custom Vibration Pattern
          ListTile(
            leading: const Icon(Icons.vibration),
            title: Text(
                AppLocalizations.of(context)!.settingsCustomVibrationPattern),
            subtitle: Text(_vibrationPatternString),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(AppLocalizations.of(context)!
                        .settingsEditVibrationPattern),
                    content: TextField(
                      controller: _patternController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!
                            .settingsVibrationPatternHint,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(AppLocalizations.of(context)!
                                    .settingsVibrationPatternHelp),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text(AppLocalizations.of(context)!.cancel),
                        onPressed: () {
                          Navigator.of(context).pop();
                          _patternController.text = _vibrationPatternString;
                        },
                      ),
                      TextButton(
                        child: Text(AppLocalizations.of(context)!.save),
                        onPressed: () {
                          _saveVibrationPattern(_patternController.text);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.play_circle_fill),
            title: Text(AppLocalizations.of(context)!.settingsTestSetting),
            onTap: () async {
              if ((_reminderType == GlobalReminderType.ringtone ||
                      _reminderType == GlobalReminderType.both) &&
                  _customRingtonePath != null) {
                audioService.playCustomFile(_customRingtonePath!, context);
              }
              if (_reminderType == GlobalReminderType.vibration ||
                  _reminderType == GlobalReminderType.both) {
                final pattern = _patternController.text
                    .split(',')
                    .map((e) => int.tryParse(e.trim()) ?? -1)
                    .where((e) => e >= 0)
                    .toList();
                audioService.vibrate(
                  context,
                  pattern: pattern.isNotEmpty ? pattern : null,
                );
              }
            },
          ),

          // Theme Section
          const Divider(),
          _buildSectionHeader(
              context, AppLocalizations.of(context)!.settingsThemeSection),
          SwitchListTile(
            title: Text(AppLocalizations.of(context)!.settingsDynamic),
            subtitle: Text(
                AppLocalizations.of(context)!.settingsSystemWallpaperColor),
            value: themeState.useDynamicColor,
            onChanged: (val) => themeNotifier.toggleDynamicColor(val),
          ),
          if (!themeState.useDynamicColor)
            ListTile(
              title:
                  Text(AppLocalizations.of(context)!.settingsCustomThemeColor),
              subtitle: Wrap(
                spacing: 8,
                children: [
                  Colors.blue,
                  Colors.red,
                  Colors.green,
                  Colors.orange,
                  Colors.purple
                ]
                    .map((color) => GestureDetector(
                          onTap: () => themeNotifier.setCustomSeedColor(color),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: themeState.customSeedColor == color
                                    ? Colors.black
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settingsDarkMode),
            trailing: DropdownButton<AppThemeMode>(
              value: themeState.mode,
              onChanged: (AppThemeMode? newValue) {
                if (newValue != null) themeNotifier.setThemeMode(newValue);
              },
              items: [
                DropdownMenuItem(
                    value: AppThemeMode.system,
                    child: Text(
                        AppLocalizations.of(context)!.settingsThemeSystem)),
                DropdownMenuItem(
                    value: AppThemeMode.light,
                    child:
                        Text(AppLocalizations.of(context)!.settingsThemeLight)),
                DropdownMenuItem(
                    value: AppThemeMode.dark,
                    child:
                        Text(AppLocalizations.of(context)!.settingsThemeDark)),
              ],
            ),
          ),

          // DistanceFilter
          const Divider(),
          _buildSectionHeader(
              context, AppLocalizations.of(context)!.settingsLocationUpdate),
          ListTile(
            title: Text(AppLocalizations.of(context)!
                .settingsDistanceFilter(_distanceFilter)),
            subtitle: Slider(
              value: _distanceFilter.toDouble(),
              min: 5,
              max: 100,
              divisions: 19, // (100-5)/5 = 19
              label: '$_distanceFilter' 'm',
              onChanged: (value) =>
                  setState(() => _distanceFilter = value.toInt()),
              onChangeEnd: (value) => _saveDistanceFilter(value.toInt()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              AppLocalizations.of(context)!.settingsDistanceFilterHint,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),

          // Map Data Section
          const Divider(),
          _buildSectionHeader(
              context, AppLocalizations.of(context)!.settingsMapDataSection),
          // Offline Map
          ListTile(
            leading: const Icon(Icons.download_for_offline),
            title: Text(AppLocalizations.of(context)!.settingsOfflineMap),
            subtitle:
                Text(AppLocalizations.of(context)!.settingsManageOfflineMap),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const OfflineMapScreen()),
              );
            },
          ),

          const Divider(),
          Consumer(
            builder: (context, ref, child) {
              final settingsRepo = ref.watch(settingsRepositoryProvider);
              final currentIndex = settingsRepo.getCurrentTileSourceIndex();
              Theme.of(context);

              return ListTile(
                // TODO 搜索源 高德/百度
                title: Text(AppLocalizations.of(context)!.settingsTileSource),
                subtitle: Text(kTileSources[currentIndex].name),
                trailing: PopupMenuButton<int>(
                  initialValue: currentIndex,
                  onSelected: (index) async {
                    await settingsRepo.setTileSource(index);
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(AppLocalizations.of(context)!
                              .settingsTileSourceRestart)),
                    );
                  },
                  itemBuilder: (context) =>
                      List.generate(kTileSources.length, (index) {
                    return PopupMenuItem(
                      value: index,
                      child: Text(kTileSources[index].name),
                    );
                  }),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
