String? validateEmail(String email) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (email.isEmpty) {
    return 'Email is required';
  } else if (!emailRegex.hasMatch(email)) {
    return 'Enter a valid email';
  }
  return null;
}
class ValidEmail {
  bool validate(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
}
