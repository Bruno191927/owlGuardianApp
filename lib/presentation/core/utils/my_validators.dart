class MyValidators {
  static String? validateEmail(String text) {
    if (text.isEmpty) {
      return 'Ingrese un correo electrónico';
    }
    const _pattern =
        r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.)*[a-zA-Z0-9][a-zA-Z0-9-]{0,253}\.[a-zA-Z0-9]{2,}$";
    if (!RegExp(_pattern).hasMatch(text)) {
      return 'Ingrese un correo electrónico válido';
    }
    return null;
  }

  static String? validatePassword(String text) {
    if (text.isEmpty) {
      return 'Ingrese una contraseña';
    }
    if (text.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    // if (text.contains(RegExp(r'[A-Z]'))) {
    //   return 'La contraseña debe tener al menos 1 mayúscula';
    // }
    // if (text.contains(RegExp(r'[a-z]'))) {
    //   return 'La contraseña debe tener al menos 1 minúscula';
    // }
    // if (text.contains(RegExp(r'[0-9]'))) {
    //   return 'La contraseña debe tener al menos 1 dígito';
    // }
    // if (text.contains(RegExp(r'[#?!@/$%^&*-]'))) {
    //   return 'La contraseña debe tener algún caracter especial';
    // }
    return null;
  }

  static String? validateFullName(String text) {
    if (text.isEmpty) {
      return 'Ingrese un nombre';
    }
    // if (text.length < 3) {
    //   return 'El nombre debe ser mayor a 2 letras';
    // }
    // if (text.length > 27) {
    //   return 'El nombre no puede exceder de 27 caracteres';
    // }
    return null;
  }

  static String? validatePhoneNumber(String text) {
    if (text.isEmpty) {
      return 'Ingrese un número de celular';
    }
    if (text.length != 9) {
      return 'El número de celular debe tener 9 dígitos';
    }
    return null;
  }
}
