enum HiveBoxName {
  /// [country] : only store list of country via. pagination [deprecated]
  country,

  /// [jobCategory] : only store list of job category via. pagination [deprecated]
  jobCategory,

  /// [userToken] : store logged in user token
  userToken,

  /// [userData] : store logged in user data
  userData,

  /// [selectedLanCode] : store user prefs. language in application
  selectedLanCode,

  /// [userCV] : store user uploaded cv in application
  userCV,

  /// [banner] : store job banners
  banner,

  /// [countryPrefs] : only store list of country name
  countryPrefs,

  /// [jobCategoryPrefs] : only store list of job category name
  jobCategoryPrefs,

  /// [allCountry] : hold total list of countries
  allCountry,

  /// [allJobCategory] : hold total list of job category
  allJobCategory
}

extension HiveBoxNameInString on HiveBoxName {
  String get stringValue {
    switch (this) {
      case HiveBoxName.country:
        return 'Country';
      case HiveBoxName.jobCategory:
        return 'JobCategory';
      case HiveBoxName.userToken:
        return 'UserToken';
      case HiveBoxName.userData:
        return 'UserData';
      case HiveBoxName.userCV:
        return 'UserCV';
      case HiveBoxName.selectedLanCode:
        return 'LanguageCode';
      case HiveBoxName.banner:
        return 'Banner';
      case HiveBoxName.countryPrefs:
        return 'CountryPrefs';
      case HiveBoxName.jobCategoryPrefs:
        return 'JobCategoryPrefs';
      case HiveBoxName.allCountry:
        return 'AllCountry';
      case HiveBoxName.allJobCategory:
        return 'AllJobCategory';
      default:
        return '-';
    }
  }
}

enum JobStatus { applyNow, onProcess, accepted, rejected }

extension JobStatusString on JobStatus {
  String get stringValue {
    switch (this) {
      case JobStatus.onProcess:
        return 'Applied';
      case JobStatus.accepted:
        return 'Accepted';
      case JobStatus.rejected:
        return 'Pending';
      default:
        return 'Apply Now';
    }
  }
}

