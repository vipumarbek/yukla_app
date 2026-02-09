// lib/services/api_service.dart

class ApiService {
  /// Backendni tekshirish (hozircha fake)
  static Future<String> testBackend() async {
    // server yo‘qligi uchun vaqtincha kutish
    await Future.delayed(const Duration(seconds: 1));
    return "API Service ishlayapti ✅";
  }

  /// Fake orderlar (keyin backenddan keladi)
  static Future<List<Map<String, dynamic>>> getOrders() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      {
        "id": 1,
        "from": "Toshkent",
        "to": "Samarqand",
        "cargo": "Meva",
        "truck": "Tentli",
        "price": 100000,
        "phone": "+998901234567",
      },
      {
        "id": 2,
        "from": "Andijon",
        "to": "Buxoro",
        "cargo": "Qurilish material",
        "truck": "Refrijerator",
        "price": 200000,
        "phone": "+998931112233",
      },
    ];
  }

  /// Yangi order qo‘shish (hozircha fake)
  static Future<bool> createOrder({
    required String from,
    required String to,
    required String cargo,
    required String truck,
    required String phone,
    required int price,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    // Hozircha har doim true qaytaramiz
    return true;
  }
}
