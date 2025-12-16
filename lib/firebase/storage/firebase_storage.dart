// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';

// export 'package:firebase_storage/firebase_storage.dart';

// class StorageMethods {
//   static Future<String> uploadFileToStorage(File? file, String path) async {
//     try {
//       if (file != null) {
//         // String fileName = basename(file.path);
//         // Reference storageRef = FirebaseStorage.instance.ref().child(
//         //     '$path/${DateTime.now().millisecondsSinceEpoch}-${fileName.replaceAll(' ', '-')}');
//         // UploadTask uploadTask = storageRef.putFile(file);
//         // TaskSnapshot snapshot = await uploadTask;
//         // String downloadURL = await snapshot.ref.getDownloadURL();
//         // return downloadURL;
//         return "https://public.bnbstatic.com/image/cms/article/body/202407/480803b725a57587e052bde02b08ee59.png";
//       } else {
//         return "";
//       }
//     } catch (error) {
//       return "";
//     }
//   }

//   static Future<List<String>> uploadMultipleFilesToStorage(
//       List<File>? files, String path) async {
//     List<String> downloadUrls = [];
//     try {
//       if (files != null && files.isNotEmpty) {
//         for (File file in files) {
//           String fileName = basename(file.path);
//           Reference storageRef = FirebaseStorage.instance.ref().child(
//               '$path/${DateTime.now().millisecondsSinceEpoch}-${fileName.replaceAll(' ', '-')}');
//           UploadTask uploadTask = storageRef.putFile(file);
//           TaskSnapshot snapshot = await uploadTask;
//           String downloadURL = await snapshot.ref.getDownloadURL();
//           downloadUrls.add(downloadURL);
//         }
//       }
//       return downloadUrls;
//     } catch (error) {
//       return [];
//     }
//   }
// }
