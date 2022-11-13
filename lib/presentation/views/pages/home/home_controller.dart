import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show ChangeNotifier, Offset;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackathon_app/presentation/core/routes/image_to_bytes.dart';
import 'package:hackathon_app/presentation/core/shared_widgets/modal_bottom_sheet_widget.dart';
import 'package:hackathon_app/presentation/core/styles/map/map_styles.dart';
import 'package:hackathon_app/presentation/views/pages/incidence/incidence_page.dart';

class HomeController with ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};

  final initialCameraPosition =
      const CameraPosition(target: LatLng(-11.925617, -76.674504), zoom: 15);

  final _iconMap = Completer<BitmapDescriptor>();

  bool _loading = true;
  bool get loading => _loading;

  bool _dialogEnabled = false;
  bool get dialogEnabled => _dialogEnabled;

  late bool _gpsEnabled;
  bool get gpsEnable => _gpsEnabled;

  StreamSubscription? _gpsSuscription;

  HomeController() {
    _init();
  }

  void changeDialogEnabled(bool value) {
    _dialogEnabled = value;
    notifyListeners();
  }

  Future<void> _init() async {
    final value = await imageToBytes('assets/icon.png');
    final bitmap = BitmapDescriptor.fromBytes(value);
    _iconMap.complete(bitmap);

    _gpsEnabled = await Geolocator.isLocationServiceEnabled();

    _loading = false;

    _gpsSuscription = Geolocator.getServiceStatusStream().listen((status) {
      _gpsEnabled = status == ServiceStatus.enabled;
      notifyListeners();
    });
    notifyListeners();
  }

  Set<Marker> get markers => _markers.values.toSet();

  final _markersController = StreamController<String>.broadcast();

  Stream<String> get onMarkerTap => _markersController.stream;

  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void incidence(BuildContext context) {
    Navigator.pushNamed(context, IncidencePage.routeName);
  }

  Future<void> turnOnGps() => Geolocator.openLocationSettings();

  void onTap(LatLng position, BuildContext context) async {
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
    final icon = await _iconMap.future;
    final marker = Marker(
        markerId: markerId,
        position: position,
        draggable: true,
        anchor: const Offset(0.5, 1),
        icon: icon,
        onTap: () {
          _markersController.sink.add(id);
          showModalBottomSheet(
            context: context,
            builder: (context) => const ModalBottomSheet(),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.85),
            isScrollControlled: true,
          );
        },
        onDragEnd: (newPosition) {
          //print(newPosition);
        });
    _markers[markerId] = marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _markersController.close();
    _gpsSuscription?.cancel();
    super.dispose();
  }
}
