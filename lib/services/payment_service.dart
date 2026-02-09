// DELETE
static Future<void> deleteOrder(String id) async {
  await http.delete(
    Uri.parse("${AppConstants.baseUrl}/order/$id"),
  );
}

// UPDATE
static Future<void> updateOrder(String id, Map<String, dynamic> data) async {
  await http.put(
    Uri.parse("${AppConstants.baseUrl}/order/$id"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(data),
  );
}
