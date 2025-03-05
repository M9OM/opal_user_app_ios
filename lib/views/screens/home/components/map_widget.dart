import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/views/screens/home/components/buildLocationRow_widget.dart';
import 'package:provider/provider.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  LatLng? _center;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final googleMapProvider = Provider.of<GoogleMapProvider>(context);
    bool from = googleMapProvider.from;

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _center!,
                  zoom: 14.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  googleMapProvider.mapController = controller;
                },
                onCameraMove: (CameraPosition position) {
                  googleMapProvider.confirmDrop
                      ? null
                      : googleMapProvider.updateCurrentPosition(
                          position.target, googleMapProvider.from);
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                polylines: googleMapProvider.polylines,
              ),
              googleMapProvider.confirmDrop
                  ? const SizedBox()
                  : Center(
                      child: SvgPicture.asset(
                        from ? AssetPaths.markerFrom : AssetPaths.markerTo,
                        color: from ? Colors.black : Colors.green,
                        width: 30, // Set a fixed width
                      ),
                    ),
              Positioned(
                top: 90,
                left: 10,
                right: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        buildLocationRow(
                          context,
                          googleMapProvider,
                          true,
                          googleMapProvider.fromTitle,
                          AssetPaths.circle,
                          from ? Colors.red : Colors.black,
                          true, // Always show this row
                          () {},
                        ),
                        buildLocationRow(
                          context,
                          googleMapProvider,
                          false,
                          googleMapProvider.toTitle,
                          AssetPaths.boxSvg,
                          from ? Colors.black : Colors.green,
                          true, // Always show this row
                          () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
