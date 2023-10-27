import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project4/repository/reservation_repo.dart';

import '../../../repository/hotel_repo.dart';





class resDelete extends StatefulWidget {
  const resDelete({super.key, required this.itemId});
  final String itemId;

  @override
  State<resDelete> createState() => _resDelete();
}

class _resDelete extends State<resDelete> {
  String txtConfirm = "Do you want to delete this item?";
  bool loading = false;
  bool isError = false;
  String errorMsg = "";
  String successMsg = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(Icons.delete),
      content: Container(
        constraints: BoxConstraints(
          maxWidth: 250,
          minWidth: 150,
          maxHeight: 200,
          minHeight: 100,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            loading ? CircularProgressIndicator() : Text(txtConfirm),
            isError
                ? Text(
              "Error: $errorMsg",
              style: TextStyle(color: Colors.red),
            )
                : Text(
              successMsg,
              style: TextStyle(color: Colors.green),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        loading = true;
                        isError = false;
                        errorMsg = "";
                        successMsg = "";
                      });
                      var delRes =
                      await ReservationRepository().deletee(widget.itemId);
                      if (delRes !=true) {
                        setState(() {
                          loading = false;
                          isError = false;
                          successMsg = "Added successfully";
                        });
                        Navigator.of(context).pop(true);
                      } else {
                        setState(() {
                          loading = false;
                          isError = true;
                          errorMsg = "Operation Faild";
                        });
                      }
                    } catch (e) {
                      setState(() {
                        loading = false;
                        isError = true;
                        errorMsg = "Exception: ${e.toString()}";
                      });
                    }
                  },
                  child: Text("Yes"),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop(false);
                  },
                  child: Text("No"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
