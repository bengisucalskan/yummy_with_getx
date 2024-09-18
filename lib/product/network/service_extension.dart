enum ServicePathEnum { search, category, random, area }

extension ServiceAdressPath on ServicePathEnum {
  String get rawValue {
    switch (this) {
      case ServicePathEnum.search:
        return "/search.php?s";
      case ServicePathEnum.category:
        return "/list.php?c=list";
      case ServicePathEnum.random:
        return "/random.php";
      case ServicePathEnum.area:
        return "/list.php?a=list";
    }
  }
}
