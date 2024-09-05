enum ServicePathEnum { posts }

extension ServiceAdressPath on ServicePathEnum {
  String get rawValue {
    switch (this) {
      case ServicePathEnum.posts:
        return "/api/character";
    }
  }
}
