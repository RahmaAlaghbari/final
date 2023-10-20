import 'package:flutter/material.dart';
import '../models/hotel_model.dart';
import '../repository/hotel_repo.dart';

class HotelUpdate extends StatefulWidget {
  final String hotelId;

  HotelUpdate({required this.hotelId});

  @override
  _HotelUpdateState createState() => _HotelUpdateState();
}

class _HotelUpdateState extends State<HotelUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _hotelRepository = HotelRepository();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descnmaeController = TextEditingController();
  TextEditingController _avatarController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _roomsController = TextEditingController();

  bool isError = false;
  String errorMsg = "";

  @override
  void initState() {
    super.initState();
    // Load the hotel data by ID when the page is initialized
    _loadHotel();
  }

  void _loadHotel() async {
    try {
      // Retrieve the hotel by ID
      HotelModel? hotel = await _hotelRepository.getById(widget.hotelId);
      if (hotel != null) {
        setState(() {
          _nameController.text = hotel.name ?? "";
          _descnmaeController.text = hotel.name ?? "";
          _avatarController.text = hotel.avatar ?? "";
          _descriptionController.text = hotel.description ?? "";
          _locationController.text = hotel.location ?? "";
          _priceController.text = hotel.price ?? "";
          _roomsController.text = hotel.rooms! as String;

        });
      }
    } catch (e) {
      // Handle any errors
      print('Error loading hotel: $e');
    }
  }

  void _updateHotel() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Create a new HotelModel object with the updated data
        HotelModel updatedHotel = HotelModel(
          id: widget.hotelId,
          name: _nameController.text,
          descnmae: _descnmaeController.text,
          avatar: _avatarController.text,
          description: _descriptionController.text,
          location: _locationController.text,
          price: _priceController.text,
          rooms: int.tryParse(_roomsController.text) ?? 0,


        );

        // Update the hotel
        Object success = await _hotelRepository.editt(updatedHotel);
        if (success!=true) {
          // Hotel updated successfully
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Hotel updated successfully')),
          );
          Navigator.of(context).pop(true);
        } else {
          // Failed to update hotel
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update hotel')),
          );
        }
      } catch (e) {
        // Handle any errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating hotel: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descnmaeController.dispose();
    _avatarController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _priceController.dispose();
    _roomsController.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Hotel'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descnmaeController,
                    decoration: InputDecoration(labelText: 'descName'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a descripe name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _avatarController,
                    decoration: InputDecoration(labelText: 'Image'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an image';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _locationController,
                    decoration: InputDecoration(labelText: 'Location'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a location';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _priceController,
                    decoration: InputDecoration(labelText: 'Price'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a price';
                      }
                      return null;
                    },
                  ),

                  TextFormField(
                    controller: _roomsController,
                    decoration: InputDecoration(labelText: 'rooms'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a price';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Invalid price. Please enter a valid number.';
                      }
                      return null;
                    },
                  ),


                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _updateHotel,
                    child: Text('Update'),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}