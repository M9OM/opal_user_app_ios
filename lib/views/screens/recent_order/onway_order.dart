import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';

class LiveTrackPage extends StatefulWidget {
  @override
  _LiveTrackPageState createState() => _LiveTrackPageState();
}

class _LiveTrackPageState extends State<LiveTrackPage> {
  GoogleMapController? mapController;

  final LatLng _initialPosition =
      const LatLng(-6.175110, 106.865036); // Jakarta position
  final LatLng _destinationPosition =
      const LatLng(-6.121435, 106.774124); // Jakarta destination
  final Set<Marker> _markers = {};
  final List<LatLng> _polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId('source'),
        position: _initialPosition,
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('destination'),
        position: _destinationPosition,
      ),
    );
    _polylineCoordinates.add(_initialPosition);
    _polylineCoordinates.add(_destinationPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order tracking"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: GoogleMap(
                  myLocationButtonEnabled: false,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 10.0,
                  ),
                  markers: _markers,
                  polylines: {
                    Polyline(
                      polylineId: PolylineId('route'),
                      points: _polylineCoordinates,
                      color: Colors.blue,
                      width: 5,
                    ),
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Estimated:',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('18 July, 8:20 PM'),
                Divider(),
                ListTile(
                  leading: IconWidget(
                    isbgColor: true,
                      bgColor: Colors.orange,
                      iconPath: 'assets/icon/pending.svg'),
                  title: Text('10-15 h'),
                  subtitle: Text('Delivery time'),
                ),
                ListTile(
                  leading: IconWidget(                    isbgColor: true,

                      bgColor: Colors.green, iconPath: AssetPaths.boxSvg),
                  title: Text('Muscat, Al amirat'),
                  subtitle: Text('Your Adress'),
                ),
                Divider(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(50)),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://runawayjuno.com/wp-content/uploads/2014/04/Oman-Muscat-Omani-man.jpg'),
                ),
                title: Text(
                  'Mohammed Ali',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Driver',
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                trailing: IconButton(
                  icon: IconWidget(                    isbgColor: true,

                      bgColor: Colors.white,
                      iconPath: 'assets/icon/comment.svg'),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
