import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData({required String fullName, required String email}) async {
    try {
      await _firestore.collection('users').doc(email).set({
        'fullName': fullName,
        'email': email,
      });
    } catch (e) {
      throw Exception('Error saving user data: $e');
    }
  }
}
