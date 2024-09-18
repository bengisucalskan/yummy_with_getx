enum ServicePathEnum { search, filter }

extension ServiceAdressPath on ServicePathEnum {
  String get rawValue {
    switch (this) {
      case ServicePathEnum.search:
        return "/search.php?s";
      case ServicePathEnum.filter:
        return "/search.php?s";
    }
  }
}
