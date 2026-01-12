class Alert {
  final int id;
  final String title;
  final String message;
  final String type; // 'info', 'warning', 'error', 'success'
  final DateTime createdAt;
  bool isRead;

  Alert({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.createdAt,
    this.isRead = false,
  });
}

final List<Alert> alertList = [
  Alert(
    id: 1,
    title: 'Happy New Year',
    message: 'A new year has been added to your saved collection',
    type: 'info',
    createdAt: DateTime.now(),
  ),
  Alert(
    id: 2,
    title: 'Book Due Soon',
    message:
        'buku "clean code" anda mau jatuh tempo, cepat baca dan kembalikan',
    type: 'warning',
    createdAt: DateTime.now().subtract(Duration(hours: 1)),
  ),
];

// Function untuk menambah alert baru
int _nextAlertId = 3;

void addAlert({
  required String title,
  required String message,
  String type = 'info',
}) {
  final newAlert = Alert(
    id: _nextAlertId++,
    title: title,
    message: message,
    type: type,
    createdAt: DateTime.now(),
    isRead: false,
  );
  alertList.insert(0, newAlert); // Insert di awal list
}
