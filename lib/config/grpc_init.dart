import 'package:grpc/grpc.dart';

class GrpcInit {
  static ClientChannel clientChannel() {
    return ClientChannel(
      '192.168.38.1',
      port: 2500,
      options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          connectTimeout: Duration(seconds: 10)),
    );
  }
}
