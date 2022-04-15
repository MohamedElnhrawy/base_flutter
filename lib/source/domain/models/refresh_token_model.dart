class RefreshTokenModel {
  final String accessToken;
  final int expireInSeconds;

  RefreshTokenModel(
    this.accessToken,
    this.expireInSeconds,
  );
}
