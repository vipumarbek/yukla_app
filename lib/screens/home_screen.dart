import 'package:flutter/material.dart';
import '../widgets/truck_card.dart';
import 'map_screen.dart';
import 'payment_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LatLng? fromLocation;
  LatLng? toLocation;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedTruck;

  Future pickFrom() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MapScreen()),
    );
    if (result != null) setState(() => fromLocation = result);
  }

  Future pickTo() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MapScreen()),
    );
    if (result != null) setState(() => toLocation = result);
  }

  Future pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (date != null) setState(() => selectedDate = date);
  }

  Future pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) setState(() => selectedTime = time);
  }

  void calculate() {
    if (fromLocation == null ||
        toLocation == null ||
        selectedDate == null ||
        selectedTime == null ||
        selectedTruck == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Barcha ma'lumotlarni to‘ldiring")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const PaymentScreen(amount: 10000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yuk Buyurtma")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            ElevatedButton(onPressed: pickFrom, child: const Text("Qayerdan (Xarita)")),
            ElevatedButton(onPressed: pickTo, child: const Text("Qayerga (Xarita)")),
            ElevatedButton(onPressed: pickDate, child: const Text("Sana tanlash")),
            ElevatedButton(onPressed: pickTime, child: const Text("Vaqt tanlash")),

            const SizedBox(height: 20),
            const Text("Mashina tanlang", style: TextStyle(fontSize: 18)),

            TruckCard(
              title: "Labo",
              size: "2.5 x 1.5 x 1.3",
              image: "assets/trucks/labo.png",
              selected: selectedTruck == "Labo",
              onTap: () => setState(() => selectedTruck = "Labo"),
            ),

            TruckCard(
              title: "Bongo",
              size: "3 x 1.7 x 1.7",
              image: "assets/trucks/bongo.png",
              selected: selectedTruck == "Bongo",
              onTap: () => setState(() => selectedTruck = "Bongo"),
            ),

            TruckCard(
              title: "Isuzu 5T",
              size: "5.2 x 2.2 x 2.2",
              image: "assets/trucks/isuzu5.png",
              selected: selectedTruck == "Isuzu 5T",
              onTap: () => setState(() => selectedTruck = "Isuzu 5T"),
            ),

            TruckCard(
              title: "Isuzu 10T",
              size: "7.0 x 2.4 x 2.4",
              image: "assets/trucks/isuzu10.png",
              selected: selectedTruck == "Isuzu 10T",
              onTap: () => setState(() => selectedTruck = "Isuzu 10T"),
            ),

            TruckCard(
              title: "Fura",
              size: "13.6 x 2.45 x 2.7",
              image: "assets/trucks/fura.png",
              selected: selectedTruck == "Fura",
              onTap: () => setState(() => selectedTruck = "Fura"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: calculate,
              child: const Text("Hisoblash (10 000 so‘m)"),
            )
          ],
        ),
      ),
    );
  }
}
