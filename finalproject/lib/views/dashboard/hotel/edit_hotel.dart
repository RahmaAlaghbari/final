import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../CustomPages/appbar.dart';
import '../../../models/hotel_model.dart';
import '../../../repository/hotel_repo.dart';


String? selectedCat;
final catList = ['Luxury Hotels', 'Business Hotels','Resort Hotels'];

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
  TextEditingController _catController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

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
          _catController.text = hotel.cat ?? "";
          _priceController.text = hotel.price ?? "";

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
          cat: _catController.text,
          price: _priceController.text,


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
    _catController.dispose();
    _priceController.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,'Edit Hotel'),
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



                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedCat,
                      onChanged: (newValue) {
                        setState(() {
                          selectedCat = newValue; // Update the selected permission value
                          _catController.text = newValue ?? ''; // Assign the selected permission to the _perController
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Category',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      items: catList.map((Category) {
                        return DropdownMenuItem<String>(
                          value: Category,
                          child: Text(Category),
                        );
                      }).toList(),
                    ),
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