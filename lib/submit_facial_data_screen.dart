import 'package:flutter/material.dart';
import 'package:flutter_document_picker/flutter_document_picker.dart';
import 'package:permission_handler/permission_handler.dart'; // Import the permission handler
import 'dart:io';

class SubmitFacialDataScreen extends StatefulWidget {
  const SubmitFacialDataScreen({super.key});

  @override
  _SubmitFacialDataScreenState createState() => _SubmitFacialDataScreenState();
}

class _SubmitFacialDataScreenState extends State<SubmitFacialDataScreen> {
  File? _file; // To store the selected file

  // Function to request storage permission and pick a file
  Future<void> _pickFile() async {
    // Request permission to access external storage
    PermissionStatus status = await Permission.storage.request();

    if (status.isGranted) {
      // If permission is granted, pick a file
      final result = await FlutterDocumentPicker.openDocument(
        allowMultiSelection: false, // You can allow multi-selection if needed
        // You can filter for specific file types if needed
        // type: DocumentPickerType.image,
      );

      if (result != null) {
        setState(() {
          _file = File(result); // Store the picked file
        });
      }
    } else {
      // If permission is not granted, show an alert
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission denied! Cannot pick file.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Facial Data'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Show either a placeholder or the selected file
            _file == null
                ? const Icon(
                    Icons.upload_file,
                    size: 120,
                    color: Colors.deepPurple,
                  )
                : Column(
                    children: [
                      Icon(
                        Icons.file_present,
                        size: 100,
                        color: Colors.deepPurple,
                      ),
                      Text(
                        _file!.path.split('/').last, // Display file name
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 20),
            const Text(
              'Upload Facial Data',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 30),
            // Pick file button
            ElevatedButton(
              onPressed: _pickFile,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
              ),
              child: const Text('Pick File'),
            ),
            const SizedBox(height: 30),
            // Button to submit the file (could lead to the next screen)
            ElevatedButton(
              onPressed: _file == null
                  ? null
                  : () {
                      // Navigate to the next screen with the selected file
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => SubmissionResultScreen(file: _file),
                      //   ),
                      // );
                    },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
              ),
              child: const Text('Submit Facial Data'),
            ),
          ],
        ),
      ),
    );
  }
}
