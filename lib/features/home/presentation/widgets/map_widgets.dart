import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_2s_app/core/constants/constants.dart';
import 'package:test_2s_app/features/home/presentation/bloc/app_bloc/bloc.dart';
import 'package:app_settings/app_settings.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with WidgetsBindingObserver {
  late GoogleMapController googleMapController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void _onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      context.read<MapBloc>().add(MapLoaded());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        context.read<MapBloc>().add(MapLoaded());
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              child: _buildMap(state, context),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMap(MapState state, BuildContext context) {
    return switch (state.appGeoConnection) {
      AppGeoConnection.connection => _buildMapLoading(),
      AppGeoConnection.successful => _buildMapSuccessful(state),
      AppGeoConnection.error => _buildMapError(context),
    };
  }

  Widget _buildMapLoading() {
    return Stack(
      children: [
        const Positioned.fill(
          child: Image(
            image: AssetImage('assets/map.png'),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: CupertinoColors.black.withOpacity(0.7),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: CupertinoActivityIndicator(),
        ),
      ],
    );
  }

  Widget _buildMapSuccessful(
    MapState state,
  ) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      compassEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(state.latitude, state.longitude),
        zoom: 10.0,
      ),
    );
  }

  Widget _buildMapError(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: Image(
            image: AssetImage('assets/map.png'),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: CupertinoColors.black.withOpacity(0.7),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    color: kSmallCardColor,
                  ),
                  child: const Icon(
                    Icons.wifi_off_rounded,
                    color: kGreenMainColor,
                    size: 40,
                  ),
                ),
                const Text(
                  'Відсутній зв\'язок',
                  style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Відсутність доступу до геолокації. Переконайтеся, що у додатку увімкнено геолокацію та перевірте з\'єднання з Інтернетом.',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                CupertinoButton(
                  child: const Text(
                    'Налаштування геолокації >',
                    style: TextStyle(
                      color: kGreenMainColor,
                      fontSize: 13.0,
                    ),
                  ),
                  onPressed: () {
                    AppSettings.openAppSettings(
                      type: AppSettingsType.location,
                    );
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
