import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  Future<void> saveUserData(String uid, String fullName, String phoneNumber) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      // Add more fields as needed
    });
  }
}
