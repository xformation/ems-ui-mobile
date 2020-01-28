import 'package:graphql/client.dart';

class GraphQLClientAPI {
  static client() => GraphQLClient(
        cache: InMemoryCache(),
        link: HttpLink(
          uri: 'http://100.81.5.26:8080/graphql',
        ),
      );
}
