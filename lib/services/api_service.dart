static Future<String?> googleLogin(String name, String email) async {
  final response = await http.post(
    Uri.parse("http://10.0.2.2:5000/google-login"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "name": name,
      "email": email,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data["role"];
  }

  return null;
}
