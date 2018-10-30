class user (
  String $username,
  String $password,
) {
  contain user::modify
}
