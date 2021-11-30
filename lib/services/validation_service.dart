class ValidationService {
  String? validateFirstLastName(String value) {
    if (value.isEmpty) {
      return 'Must not be left blank.';
    }
    const String pattern = r"^[A-Za-z]$";
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Invalid Firstname or Last-Name";
    }
    return null;
  }

  String? validateNum(String value) {
    if (value.isEmpty) {
      return 'Must not be left blank.';
    }
    const String pattern = r"^(0|[1-9][0-9]*)$";
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Invalid Entry. Enter digits 0 -9";
    }
    return null;
  }

  String? validateAplhaNum(String value) {
    if (value.isEmpty) {
      return 'Must not be left blank.';
    }
    const String pattern = r"[A-Za-z0-9_]";
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Invalid Entry. Enter number or Letter";
    }
    return null;
  }
}
