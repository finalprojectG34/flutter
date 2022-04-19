String? validateMobileNum(String? value) {
  Pattern pattern = r"^[0-9]{9}$";
  RegExp regex = RegExp(pattern.toString());
  if (value!.trim().isEmpty) {
    return 'Please enter Mobile Number';
  }
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid Mobile Number';
  } else {
    return null;
  }
}
