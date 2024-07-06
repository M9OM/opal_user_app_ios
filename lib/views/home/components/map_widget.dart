import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';
import 'package:provider/provider.dart';
import '../../../service/map_service.dart';

class MapWidget extends StatefulWidget {
   MapWidget({Key? key, required this.onTapDr}) : super(key: key);
final Function onTapDr;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}
const CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(23.51112595829606, 58.45158196985722),
  zoom: 14.4746,
);

class _MapWidgetState extends State<MapWidget> {
  bool isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    final pageProvider = context.watch<PageViewProvider>();
    final googleMapProvider = context.watch<GoogleMapProvider>();
    final orderDetailsProvider = context.watch<OrderDetailsProvider>();
    final googleMapService = context.read<GoogleMapService>();

    bool isOnFirstPage = pageProvider.currentPage == 0;

    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: GoogleMap(
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
            ),
          ],
        ),
        Positioned(
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
                onPressed: () {
widget.onTapDr();                },
              ),
              Expanded(
                child: AnimatedOpacity(
                  opacity: isSearchVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: googleMapService.controllerSearch,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.2),
                        hintText: 'Search',
                      ),
                    ),
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
                onPressed: () {
                  setState(() {
                    isSearchVisible = !isSearchVisible;
                  });
                },
              ),
            ],
          ),
        ),
        if (isOnFirstPage)
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconWidget(
                      bgColor: AppColors.primaryColor,
                      iconSvg: AssetPaths.circle,
                    ),
                    Container(
                      width: 2,
                      height: 40,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          )
        else if (pageProvider.currentPage != 2)
          Center(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconWidget(
                      bgColor: Colors.green,
                      iconSvg: AssetPaths.boxSvg,
                    ),
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }
}
