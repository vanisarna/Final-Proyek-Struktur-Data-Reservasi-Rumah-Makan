import 'dart:io';
import 'dart:collection';

class Customer {
  String name;
  int numberOfPeople;
  Customer(this.name, this.numberOfPeople);
}

class Table {
  int number;
  int numberOfSeats;
  bool isOccupied;
  Table(this.number, this.numberOfSeats, {this.isOccupied = false});
}

void main() {
  // Inisialisasi daftar meja
  List<Table> availableTables = [
    Table(1, 2),
    Table(2, 4),
    Table(3, 6),
  ];
  
// Inisialisasi queue untuk reservasi
  Queue<Customer> reservations = Queue();

  // Reservasi
  while (true) {
    stdout.write("Masukkan nama: ");
    String name = stdin.readLineSync() ?? "";
    stdout.write("Masukkan jumlah orang: ");
    int numberOfPeople = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
  
    // Periksa ketersediaan meja
    bool tableAvailable = false;
    for (int i = 0; i < availableTables.length; i++) {
      Table table = availableTables[i];
      if (!table.isOccupied && table.numberOfSeats >= numberOfPeople) {
        tableAvailable = true;
        table.isOccupied = true;

    // menambahkan reservasi ke dalam queue
        reservations.add(Customer(name, numberOfPeople));
        print("Reservasi atas nama $name untuk $numberOfPeople orang telah dikonfirmasi di meja ${table.number}.");
        break;
      }
    }

    if (!tableAvailable) {
      print("Maaf, tidak ada meja yang tersedia untuk $numberOfPeople orang.");
    }

    stdout.write("Apakah ingin reservasi lagi? (yes/no): ");
    String answer = stdin.readLineSync() ?? "";
    if (answer.toLowerCase() != "yes") {
      break;
    }
  }

  // Tampilkan daftar reservasi
  print("\nDaftar Reservasi:");
  for (Customer customer in reservations) {
    print("- ${customer.name} (${customer.numberOfPeople} orang)");
  }
}
