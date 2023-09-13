// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/firebase_storage/storage.dart';
import 'package:http/http.dart' as http;

Future<Uint8List?> getUint8ListFromBlobUrl(String? blobUrl) async {
  if (blobUrl == null) {
    return null;
  }

  try {
    final response = await http.get(Uri.parse(blobUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download the file');
    }
  } catch (e) {
    print('Error downloading file: $e');
    return null;
  }
}

Future uploadAudioToFirebase(String? myAudioPath) async {
  // Add your function code here!

  Uint8List? bytes = await getUint8ListFromBlobUrl(myAudioPath);

  if (bytes != null) {
    // Get the current date and time
    final now = DateTime.now();

    // Format the date and time as a string
    final formattedDateTime =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}-${now.minute.toString().padLeft(2, '0')}-${now.second.toString().padLeft(2, '0')}';

    // Set the file name to the formatted date and time string together with the file extension
    final fileName = '$formattedDateTime.opus';

    // Set the directory where you want to store the file (e.g., a folder named 'files' in your storage)
    String directoryPath = '/users/' + currentUserUid + '/audio-recordings';

    // Combine the directory path and file name to create the full storage path
    final storagePath = '$directoryPath/$fileName';

    // Save the file to Firebase storage
    await uploadData(storagePath, bytes);
  }
}
