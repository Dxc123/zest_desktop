mixin TfValidators {
  String? validatePIN(String? value) {
    if (value!.length != 4) {
      return "PIN must be 4 digits";
    } else if (value.isEmpty) {
      return "PIN can't be empty";
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return "Enter your username";
    } else if (value.length < 4) {
      return "Username should be more than 3 characters";
    }
    return null;
  }
}
