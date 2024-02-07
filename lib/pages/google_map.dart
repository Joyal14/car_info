import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ork_app/models/location_services.dart';

class GoogleMapWithSearchScreen extends StatefulWidget {
  const GoogleMapWithSearchScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapWithSearchScreen> createState() =>
      _GoogleMapWithSearchScreenState();
}

class _GoogleMapWithSearchScreenState extends State<GoogleMapWithSearchScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];
  bool _listVisible = false; // Flag to track list visibility
  bool _itemSelected = false;
  final Set<Marker> _markers = <Marker>{};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() async {
    // Fetch suggestions based on the current search query
    List<String> newSuggestions =
        await LocationService().getSuggestions(_searchController.text);
    setState(() {
      _suggestions = newSuggestions;
      _listVisible = !_itemSelected &&
          _suggestions
              .isNotEmpty; // Show the list when new suggestions are available
    });
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.clear();
      _markers.add(Marker(markerId: const MarkerId('marker'), position: point));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Google Maps",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(hintText: 'Search by City'),
                  onChanged:
                      _onTextChanged, // Call _onTextChanged when text changes
                ),
              ),
              IconButton(
                onPressed: () async {
                  var place =
                      await LocationService().getPlace(_searchController.text);
                  _goToPlace(place);
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          Visibility(
            visible: _listVisible,
            child: Expanded(
              child: ListView.builder(
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_suggestions[index]),
                    onTap: () async {
                      var place =
                          await LocationService().getPlace(_suggestions[index]);
                      _goToPlace(place);
                      _searchController.text =
                          _suggestions[index]; // Update the TextField text
                      setState(() {
                        _itemSelected = true;
                        _listVisible = false; // Hide the list
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: _markers,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 15),
      ),
    );
    _setMarker(LatLng(lat, lng));

    setState(() {
      _listVisible = false;
      _itemSelected = true; // Hide the list after a suggestion is selected
    });
  }

  void _onTextChanged(String newText) {
    setState(() {
      _itemSelected = false; // Reset item selection flag when text changes
    });
  }
}
