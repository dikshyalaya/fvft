

class Validator {

  static String ? fullNameValidator(String ? value) {
    if (value!.isEmpty) {
      return 'Please enter the full name';
    }
    if (value.trim().length < 8) {
      return 'Please enter the full name';
    }
    return null;
  }
  

  static String ? _tempPassword;

  static String ? passwordValidator( String ? value) {
    if (value!.isEmpty) {
      return 'Please enter the password';
    }
    if (value.trim().length < 8) {
      return 'Password must contain min.8 digits';
    }
    _tempPassword = value;
    return null;
  }

  static String ?  confirmPasswordValidator( String ? value) {
    if (value!.isEmpty) {
      return 'Please enter the confirm password';
    }
    if (value.trim().length < 8) {
      return 'Confirm password must contain min.8 digits';
    }
    if (value != _tempPassword) {
      return 'Password and confirm password does not match';
    }
    return null;
  }

  static String ?  dobValidator( String ? value) {
    if (value!.isEmpty || value.trim().length < 10) {
      return 'Please add your DOB.';
    }
    return null;
  }

  static String ?  emailValidator( String ? value) {
    if (value!.isEmpty) {
      return 'Please enter the email';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Email is not valid';
    }
    return null;
  }

  static String ?  bioValidator( String ?  value) {
    if (value!.isNotEmpty && value.trim().length < 15) {
      return 'Please enter bio of at least 15 characters';
    }
    return null;
  }

  static String ?  permanentAddressValidator(  String ? value) {
    if (value!.isEmpty) {
      return 'Please enter the address name';
    }
    if (value.trim().length < 8) {
      return 'Please enter the address name with min. 8 characters.';
    }
    return null;
  }

  static   String ? temporaryAddressValidator( String ? value) {
    if (value!.isNotEmpty && value.trim().length < 8) {
      return 'Please enter the address name with min. 8 characters.';
    }
    return null;
  }

  static String? mobileValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the mobile number';
    }
    if (value.length < 10) {
      return 'Mobile number is not valid';
    }
    return null;
  }

  static String? optionalMobileValidator(String? value) {
    if (value!.isNotEmpty && value.length < 10) {
      return 'Mobile number is not valid';
    }
    return null;
  }

  static String? passportNoValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the passport no.';
    }
    if (value.length < 10) {
      return 'Passport no. is not valid';
    }
    return null;
  }

  static String? documentNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the document name';
    }
    if (value.length < 5) {
      return 'Please enter document name with min. of 5 characters';
    }
    return null;
  }

  static String? additionalInfoValidator(String? value) {
    if (value!.isNotEmpty && value.length < 15) {
      return 'Please enter additional information of min. 15 characters';
    }
    return null;
  }

  static String? skillNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the skill name';
    }
    if (value.length < 3) {
      return 'Please enter skill name with min. of 3 characters';
    }
    return null;
  }

  static String? languageNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the language';
    }
    if (value.length < 5) {
      return 'Please enter language with min. of 5 characters';
    }
    return null;
  }

  static String? jobTitleValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the job title';
    }
    if (value.length < 5) {
      return 'Please enter job title with min. of 5 characters';
    }
    return null;
  }

  static String? jobPositionValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the job position';
    }
    if (value.length < 5) {
      return 'Please enter job position with min. of 5 characters';
    }
    return null;
  }

  static String? employmentTypeValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the job employment type';
    }
    if (value.length < 5) {
      return 'Please enter job employment type';
    }
    return null;
  }

  static String? companyNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the company name';
    }
    if (value.length < 5) {
      return 'Please enter company name with min. of 5 characters';
    }
    return null;
  }

  static String? companyAddressValidator(String? value) {
    if (value!.isNotEmpty && value.length < 5) {
      return 'Please enter the company address with min. 5 characters';
    }
    return null;
  }

  static String? startDateValidator(String? value) {
    if (value!.isEmpty || value.trim().length < 10) {
      return 'Please add your job start date';
    }
    return null;
  }

  static String? jobStartDateValidator(String? value) {
    if (value!.isEmpty || value.trim().length < 10) {
      return 'Please add your job start date';
    }
    return null;
  }

  static String? jobEndDateValidator(String? value) {
    if (value!.isEmpty || value.trim().length < 10) {
      return 'Please add your job end date';
    }
    return null;
  }

  static String? jobDescription(String? value) {
    if (value!.isNotEmpty && value.length < 5) {
      return 'Please enter job description with min. 5 characters';
    }
    return null;
  }

  static String? schoolNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the school name';
    }
    if (value.length < 5) {
      return 'Please enter school name with min. of 5 characters';
    }
    return null;
  }

  static String? levelValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the level';
    }
    if (value.length < 3) {
      return 'Please enter level with min. of 3 characters';
    }
    return null;
  }

  static String? courseNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the course name';
    }
    if (value.length < 3) {
      return 'Please enter course name with min. of 3 characters';
    }
    return null;
  }

  static String? gpaValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the GPA';
    }
    return null;
  }

  static String? trainingTitleValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the course name';
    }
    if (value.length < 5) {
      return 'Please enter course name with min. of 5 characters';
    }
    return null;
  }

  static String? instituteNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the institute name';
    }
    if (value.length < 5) {
      return 'Please enter institute with min. of 5 characters';
    }
    return null;
  }

  static String? durationValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the duration';
    }
    if (value.length < 2) {
      return 'Please enter course name with min. of 2 characters';
    }
    return null;
  }

  static String? countryNameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter the country name';
    }
    if (value.length < 4) {
      return 'Please enter country name with min. of 4 characters';
    }
    return null;
  }

  static String? selectJobCategoryValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select the job category';
    }
    return null;
  }

  static String? selectCountryNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select the country name';
    }
    return null;
  }

  static String? cvTitleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the title of cv';
    }
    return null;
  }
}
