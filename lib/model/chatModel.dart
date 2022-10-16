class chatAdmin {
  String? chatCode, from, to, chat, createAt;

  chatAdmin({
    this.chatCode,
    this.from,
    this.to,
    this.chat,
    this.createAt,
  });

  factory chatAdmin.fromJson(Map<String, dynamic> json) => chatAdmin(
        chatCode: json['chatCode'].toString(),
        from: json['from'].toString(),
        to: json['to'].toString(),
        chat: json['chat'].toString(),
        createAt: json['createAt'].toString(),
      );
}
