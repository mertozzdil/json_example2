class LoadData {
  final String username;
  final String email;

  LoadData(this.username, this.email);

  //JSON dosyadan çekmek için factory kullanılır.

  factory LoadData.fromJson(Map<String, dynamic> json) {
    return LoadData(json["username"], json["email"]);
  }
}
