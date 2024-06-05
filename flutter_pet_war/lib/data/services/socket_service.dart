// ignore_for_file: library_prefixes, avoid_print

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  // Private constructor
  SocketService._internal();

  // Single instance
  static final SocketService _instance = SocketService._internal();

  // Factory constructor
  factory SocketService() {
    return _instance;
  }

  late IO.Socket _socket;

  // Initialize and connect the Socket.IO client
  void initSocket() {
    _socket = IO.io('http://localhost:8080', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    _socket.on('connect', (_) {
      print('Connected to Socket.IO server');
    });

    _socket.on('disconnect', (_) {
      print('Disconnected from Socket.IO server');
    });

    _socket.on('message', (data) {
      print('Message from server: $data');
    });

    _socket.connect();
  }

  // Getter for the socket
  IO.Socket get socket => _socket;

  // Method to send a message
  void sendMessage(String message) {
    _socket.emit('message', message);
  }
}
