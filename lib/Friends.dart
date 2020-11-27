class Friend {
  String ipAddress, name;

  Friend(this.ipAddress, this.name);

  Friend.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        ipAddress = json['ip'];

  Map<String, dynamic> toJson() {
    return {
      'name' : name,
      'ip' : ipAddress
    };
  }
}