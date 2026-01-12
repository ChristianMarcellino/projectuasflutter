import 'package:flutter/material.dart';
import 'package:projectuas/data/alert_data.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> with WidgetsBindingObserver {
  late List<Alert> alerts;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    alerts = List.from(alertList);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshAlerts();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _refreshAlerts() {
    setState(() {
      alerts = List.from(alertList);
    });
  }

  void markAsRead(int id) {
    setState(() {
      final index = alerts.indexWhere((a) => a.id == id);
      if (index != -1) {
        alerts[index].isRead = true;
      }
    });
  }

  void deleteAlert(int id) {
    setState(() {
      alerts.removeWhere((a) => a.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Alert deleted'),
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFF111827),
      ),
    );
  }

  void markAllAsRead() {
    setState(() {
      for (var alert in alerts) {
        alert.isRead = true;
      }
    });
  }

  void clearAllAlerts() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF111827),
        title: Text('Clear All Alerts?', style: TextStyle(color: Colors.white)),
        content: Text(
          'This action cannot be undone',
          style: TextStyle(color: Color(0xFF9CA3AF)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Color(0xFFC084FC))),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                alerts.clear();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('All alerts cleared'),
                  backgroundColor: Color(0xFF111827),
                ),
              );
            },
            child: Text('Clear', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Color getAlertColor(String type) {
    switch (type) {
      case 'success':
        return Colors.green;
      case 'warning':
        return Colors.orange;
      case 'error':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  IconData getAlertIcon(String type) {
    switch (type) {
      case 'success':
        return Icons.check_circle;
      case 'warning':
        return Icons.warning;
      case 'error':
        return Icons.error;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final unreadCount = alerts.where((a) => !a.isRead).length;

    return Scaffold(
      backgroundColor: Color(0xFF030712),
      appBar: AppBar(
        backgroundColor: Color(0xFF111827),
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.sizeOf(context).height / 5,
        title: Container(
          alignment: AlignmentDirectional.topStart,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xFFC084FC)),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Alerts",
                        style: TextStyle(
                          color: Color(0xFFD1D5DB),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  if (alerts.isNotEmpty)
                    PopupMenuButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      color: Color(0xFF111827),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(
                            'Mark all as read',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: markAllAsRead,
                        ),
                        PopupMenuItem(
                          child: Text(
                            'Clear all',
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: clearAllAlerts,
                        ),
                      ],
                    ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Notifications",
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
      body: alerts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none,
                    size: 64,
                    color: Color(0xFF6B7280),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No alerts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'You\'re all caught up!',
                    style: TextStyle(color: Color(0xFF9CA3AF)),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                if (unreadCount > 0)
                  Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFF1F2937),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFFC084FC)),
                    ),
                    child: Text(
                      'You have $unreadCount unread alert${unreadCount > 1 ? 's' : ''}',
                      style: TextStyle(color: Color(0xFFC084FC), fontSize: 14),
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: alerts.length,
                    itemBuilder: (context, index) {
                      final alert = alerts[index];
                      return GestureDetector(
                        onTap: () => markAsRead(alert.id),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 12),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: alert.isRead
                                ? Color(0xFF111827)
                                : Color(0xFF1F2937),
                            border: Border(
                              left: BorderSide(
                                color: getAlertColor(alert.type),
                                width: 4,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    getAlertIcon(alert.type),
                                    color: getAlertColor(alert.type),
                                    size: 20,
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                alert.title,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            if (!alert.isRead)
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  color: Colors.purple,
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          alert.message,
                                          style: TextStyle(
                                            color: Color(0xFF9CA3AF),
                                            fontSize: 14,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              _formatTime(alert.createdAt),
                                              style: TextStyle(
                                                color: Color(0xFF6B7280),
                                                fontSize: 12,
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.close,
                                                size: 18,
                                                color: Color(0xFF6B7280),
                                              ),
                                              padding: EdgeInsets.zero,
                                              constraints: BoxConstraints(),
                                              onPressed: () =>
                                                  deleteAlert(alert.id),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
