import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:triggeo/core/constants/global_config.dart';
import 'package:triggeo/core/services/service_locator.dart';
import 'package:triggeo/data/models/map_place.dart';
import 'package:triggeo/data/repositories/settings_repository.dart';
import 'package:triggeo/features/map/services/search_strategies.dart';
import 'package:triggeo/features/map/widgets/offline_tile_provider.dart';
import 'package:triggeo/features/map/widgets/reminder_edit_dialog.dart';
import 'package:triggeo/l10n/app_localizations.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  List<MapPlace> _searchResults = [];
  bool _isSearching = false;
  bool _hasAutoCentered = false;

  LatLng? _currentLatLng;

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initLocation();
    });
  }

  Future<void> _initLocation() async {
    final locationService = ref.read(locationServiceProvider);
    await locationService.startService();
    final initialPos = await locationService.getCurrentPosition();

    if (initialPos != null && mounted) {
      final latLng = LatLng(initialPos['lat'], initialPos['lng']);
      _updateLocation(latLng, isInitial: true);
    }
  }

  void _updateLocation(LatLng latLng, {bool isInitial = false}) {
    setState(() {
      _currentLatLng = latLng;
      if (!_hasAutoCentered) {
        _hasAutoCentered = true;
        _mapController.move(latLng, 15.0);
      }
    });
  }

  Future<void> _searchPlaces(String query) async {
    if (query.isEmpty) return;
    setState(() => _isSearching = true);
    try {
      final settingsRepo = ref.read(settingsRepositoryProvider);
      final api = settingsRepo.getCurrentSearchApi();
      String? apiKey;
      if (api.needKey) {
        apiKey = settingsRepo.getSearchApiKey(api.name);
        if (apiKey.isEmpty) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                // "Please set API Key for ${api.name}"
                AppLocalizations.of(context)!.needApiKey(api.name))));
          }
          setState(() => _isSearching = false);
          return;
        }
      }
      final strategy = SearchStrategyFactory.getStrategy(api.name);
      final results = await strategy.search(query, api.urlTemplate, apiKey);
      setState(() {
        _searchResults = results;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                AppLocalizations.of(context)!.mapSearchFailed(e.toString()))));
      }
    } finally {
      setState(() => _isSearching = false);
    }
  }

  void _moveToLocation(double lat, double lon) {
    _mapController.move(LatLng(lat, lon), 15.0);
    setState(() {
      _searchResults = [];
      _searchController.clear();
      FocusScope.of(context).unfocus();
    });
  }

  Future<void> _centerToCurrentLocation() async {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.mapLocating)));
    try {
      final locationService = ref.read(locationServiceProvider);
      final pos = await locationService.getCurrentPosition();
      if (pos != null && mounted) {
        final latLng = LatLng(pos['lat'], pos['lng']);
        _updateLocation(latLng);
        _mapController.move(latLng, 15.0);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(AppLocalizations.of(context)!
                .mapLocationFailed(e.toString()))));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final tileUrl = ref.watch(tileUrlProvider);

    ref.listen(currentLocationProvider, (previous, next) {
      if (next.value != null) {
        final newLoc = LatLng(next.value!['lat'], next.value!['lng']);
        if (_currentLatLng == null ||
            newLoc.latitude != _currentLatLng!.latitude ||
            newLoc.longitude != _currentLatLng!.longitude) {
          _updateLocation(newLoc);
        }
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Map Layer
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(39.9042, 116.4074),
              initialZoom: 15.0,
              onLongPress: (_, latlng) {
                showDialog(
                  context: context,
                  builder: (context) => ReminderEditDialog(position: latlng),
                );
              },
              onTap: (_, __) {
                if (_searchResults.isNotEmpty) {
                  setState(() => _searchResults = []);
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: tileUrl,
                userAgentPackageName: 'com.anchialc.triggeo',
                tileProvider:
                    OfflineTileProvider(offlineMapsDir: globalOfflineMapsDir),
              ),
              MarkerLayer(
                markers: [
                  if (_currentLatLng != null)
                    Marker(
                      point: _currentLatLng!,
                      width: 40,
                      height: 40,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                          Icon(
                            Icons.navigation,
                            color: Theme.of(context).colorScheme.primary,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),

          // Search Bar Layer
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: Theme.of(context).colorScheme.surface,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.of(context)!.mapSearchHint,
                            prefixIcon: Consumer(
                              builder: (context, ref, child) {
                                final settingsRepo =
                                    ref.watch(settingsRepositoryProvider);
                                final currentIndex =
                                    settingsRepo.getCurrentSearchApiIndex();
                                return DropdownButton<int>(
                                    value: currentIndex,
                                    icon: const SizedBox.shrink(),
                                    underline: const SizedBox(),
                                    menuMaxHeight: 300,
                                    borderRadius: BorderRadius.circular(12),
                                    onChanged: (int? newIndex) async {
                                      if (newIndex != null) {
                                        await settingsRepo
                                            .setSearchApi(newIndex);
                                        setState(() {}); // Refresh UI
                                        // If the newly selected API needs a key
                                        final api = kSearchApis[newIndex];
                                        if (api.needKey) {
                                          if (context.mounted) {
                                            kSearchApiKeyDialog(
                                                context, api.name);
                                          }
                                        }
                                      }
                                    },
                                    items: List.generate(kSearchApis.length,
                                        (index) {
                                      return DropdownMenuItem<int>(
                                        value: index,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                                kSearchApis[index].assetPath,
                                                width: 20,
                                                height: 20,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                            SizedBox(width: 8),
                                            Text(kSearchApis[index].name),
                                          ],
                                        ),
                                      );
                                    }),
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return kSearchApis
                                          .map<Widget>((SearchApi api) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0, right: 8.0),
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? Colors.grey[200]
                                                    : Colors.grey[800],
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: Alignment.center,
                                          child: SvgPicture.asset(
                                            api.assetPath,
                                            width: 20,
                                            height: 20,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        );
                                      }).toList();
                                    });
                              },
                            ),
                            suffixIcon: _isSearching
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: CircularProgressIndicator(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            strokeWidth: 2)))
                                : IconButton(
                                    icon: Icon(Icons.clear,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                    onPressed: () {
                                      _searchController.clear();
                                      setState(() => _searchResults = []);
                                    },
                                  ),
                            errorText: _searchController.text.isEmpty &&
                                    _searchResults.isNotEmpty &&
                                    !_isSearching
                                ? AppLocalizations.of(context)!
                                    .mapSearchEmptyError
                                : null,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                          ),
                          onSubmitted: _searchPlaces,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.settings,
                          color: Theme.of(context).colorScheme.primary),
                      onPressed: () => context.push('/settings'),
                      style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
                if (_searchController.text.isNotEmpty && !_isSearching)
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    constraints: const BoxConstraints(maxHeight: 200),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 4)
                      ],
                    ),
                    child: _searchResults.isEmpty
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                AppLocalizations.of(context)!
                                    .mapNoSearchResults,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: _searchResults.length,
                            itemBuilder: (context, index) {
                              final place = _searchResults[index];
                              return ListTile(
                                title: Text(place.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface)),
                                subtitle: Text(place.subtitle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant)),
                                leading: Icon(Icons.location_city,
                                    size: 20,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                                onTap: () {
                                  _moveToLocation(
                                      place.latitude, place.longitude);
                                },
                              );
                            },
                          ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // My Location
          FloatingActionButton.small(
            heroTag: 'location_fab',
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
            onPressed: _centerToCurrentLocation,
            child: Icon(
              Icons.my_location,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          // Reminder List
          FloatingActionButton.small(
            heroTag: 'list_fab',
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
            onPressed: () => context.push('/list'),
            child:
                Icon(Icons.list, color: Theme.of(context).colorScheme.primary),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void kSearchApiKeyDialog(BuildContext context, String apiName) {
    final TextEditingController apiKeyController = TextEditingController();
    final settingsRepo = ref.read(settingsRepositoryProvider);
    apiKeyController.text = settingsRepo.getSearchApiKey(apiName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Text('${AppLocalizations.of(context)!.mapApiKeyTitle} ($apiName)'),
        content: TextField(
          controller: apiKeyController,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.mapApiKeyHint,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.mapCancel),
          ),
          TextButton(
            onPressed: () {
              settingsRepo.setSearchApiKey(apiName, apiKeyController.text);
              Navigator.pop(context);
            },
            child: Text(AppLocalizations.of(context)!.mapConfirm),
          ),
        ],
      ),
    );
  }
}
