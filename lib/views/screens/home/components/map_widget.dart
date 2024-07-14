import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/views/screens/home/components/buildLocationRow_widget.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';
import 'package:provider/provider.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _animation = Tween<double>(begin: 30, end: 40).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool fromConfirmed = false;
  bool toConfirmed = false;

  @override
  Widget build(BuildContext context) {
    final googleMapProvider = Provider.of<GoogleMapProvider>(context);
    bool from = googleMapProvider.from;

    // Start the animation whenever 'from' changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _controller.forward(from: 0.0);
      }
    });

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: googleMapProvider.currentPosition,
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
          // markers: googleMapProvider.markers,
          polylines: googleMapProvider.polylines,
        ),
        googleMapProvider.confirmDrop
            ? SizedBox()
            : Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return SvgPicture.asset(
                        from ? AssetPaths.markerFrom : AssetPaths.markerTo,
                        key: ValueKey<bool>(from),
                        color: from ? Colors.black : Colors.green,
                        width: _animation.value,
                      );
                    },
                  ),
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
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  buildLocationRow(
                    context,
                    googleMapProvider,
                    true,
                    googleMapProvider.fromTitle,
                    AssetPaths.circle,
                    from ? Colors.red : Colors.black,
                    fromConfirmed,
                    () {
                      setState(() {
                        fromConfirmed = true;
                      });
                    },
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: fromConfirmed ? 1.0 : 0.0,
                    child: fromConfirmed
                        ? Column(
                            children: [
                              const Divider(
                                indent: 30,
                                endIndent: 30,
                              ),
                              buildLocationRow(
                                context,
                                googleMapProvider,
                                false,
                                googleMapProvider.toTitle,
                                AssetPaths.boxSvg,
                                from ? Colors.black : Colors.green,
                                toConfirmed,
                                () {
                                  setState(() {
                                    toConfirmed = true;
                                  });
                                },
                              ),
                            ],
                          )
                        : Container(),
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
