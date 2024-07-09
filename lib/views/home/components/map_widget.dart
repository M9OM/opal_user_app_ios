import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:opal_user_app/config/api_keys.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/service/map_service.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key, required this.onTapDr}) : super(key: key);
  final VoidCallback onTapDr;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

const CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(23.51112595829606, 58.45158196985722),
  zoom: 14.4746,
);

class _MapWidgetState extends State<MapWidget> {
  bool isSearchVisible = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final googleMapService = Provider.of<GoogleMapService>(context);
    final pageProvider = context.watch<PageViewProvider>();
    final googleMapProvider = context.watch<GoogleMapProvider>();
    final orderDetailsProvider = context.watch<OrderDetailsProvider>();

    bool isOnFirstPage = pageProvider.currentPage == 0;

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _kGooglePlex,
          myLocationButtonEnabled: false,
          markers: Set<Marker>.from(orderDetailsProvider.markers),
          polylines: Set<Polyline>.from(orderDetailsProvider.polylines),
          onMapCreated: (GoogleMapController controller) {
            googleMapService.controller.complete(controller);
            googleMapService.mapController = controller;
          },
          onCameraMove: (CameraPosition position) {
            googleMapProvider.updateCurrentPosition(position.target);
          },
        ),
        _buildTopBar(context,googleMapService),
        if (isOnFirstPage) _buildCenterIcon(AppColors.primaryColor, AssetPaths.circle),
        if (pageProvider.currentPage != 2) _buildCenterIcon(Colors.green, AssetPaths.boxSvg),
      ],
    );
  }

  Widget _buildTopBar(BuildContext context, GoogleMapService googleMapService) {
    return Positioned(
      top: 60,
      left: 10,
      right: 10,
      child: Row(
        children: [
          IconButton(
            icon: IconWidget(
              bgColor: Colors.black,
              iconSvg: 'assets/icon/bars-sort.svg',
            ),
            onPressed: widget.onTapDr,
          ),
          Expanded(
            child: AnimatedOpacity(
              opacity: isSearchVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildSearchResults(context, googleMapService)
              ),
            ),
          ),
          IconButton(
            icon: IconWidget(
              bgColor: Colors.black,
              iconSvg: isSearchVisible
                  ? "assets/icon/circle-xmark.svg"
                  : "assets/icon/search (1).svg",
            ),
            onPressed: _toggleSearchVisibility,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context, GoogleMapService googleMapService) {
    return Positioned(
      top: 120,
      left: 10,
      right: 10,
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: searchController,
        googleAPIKey: ApiKeys.googleApiKey,  // Replace with your API key
        inputDecoration: InputDecoration(
          hintText: "Search location",
          filled: true,
          fillColor: Colors.grey.withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        getPlaceDetailWithLatLng: (prediction) {
          _onSearchResultTap(prediction, googleMapService);
        },
        itemClick: (prediction) {
          setState(() {
            searchController.text = prediction.description!;
                      _onSearchResultTap(prediction, googleMapService);

          });
        },
      ),
    );
  }

  void _onSearchResultTap(Prediction prediction, GoogleMapService googleMapService) async {
    final details = await googleMapService.getPlaceDetails(prediction.placeId!);
    if (details != null) {
      final lat = details.geometry.location.lat;
      final lng = details.geometry.location.lng;

      final cameraPosition = CameraPosition(target: LatLng(lat, lng), zoom: 14.4746);
      setState(() {
        
      });
      googleMapService.mapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  void _toggleSearchVisibility() {
    setState(() {
      isSearchVisible = !isSearchVisible;
    });
  }

  Widget _buildCenterIcon(Color color, String assetPath) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconWidget(
            bgColor: color,
            iconSvg: assetPath,
          ),
          Container(
            width: 2,
            height: 40,
            color: color,
          ),
        ],
      ),
    );
  }
}