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

String? validatePassword(String? value) {
  // Pattern pattern = r"^[0-9]{9}$";
  // RegExp regex = RegExp(pattern.toString());
  if (value!.trim().isEmpty) {
    return 'Please enter password';
  }
  if (value.length < 4) {
    return 'Password length < 4 character';
  } else {
    return null;
  }
}

String? validateName(String? value) {
  if (value!.trim().isEmpty) {
    return 'Please enter name';
  }
  if (value.length < 2) {
    return 'Password length < 2 character';
  } else {
    return null;
  }
}
