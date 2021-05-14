import 'package:grpc/grpc.dart';
import 'package:grpc/src/server/call.dart';
import 'package:grpc_simple_example/src/generated/greeting.pbgrpc.dart';

class GreeterService extends GreeterServiceBase{
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async {
    return HelloReply()..message = 'Hello, ${request.name}!';
  }

  @override
  Future<HelloReply> sayHelloAgain(ServiceCall call, HelloRequest request) async {
    return HelloReply()..message = 'Hello again, ${request.name}!';
  }

}

void main() async {
  final server = Server([GreeterService()]);
  await server.serve(port: 5000);
  print('Server listening on port ${server.port}');
}
