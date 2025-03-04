enum UserStatus {
  unauthorized,
  authorized;

  bool get isUnauthorized => this == UserStatus.unauthorized;
  bool get isAuthorized => this == UserStatus.authorized;
}
