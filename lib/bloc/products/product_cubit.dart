import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grpc/grpc.dart';
import 'package:shopproto/pkg/product.pbgrpc.dart';
import 'package:shopprotoflutter/bloc/products/product_event.dart';

class ProductCubit extends Cubit<ProductEvent> {
  final ClientChannel channel;
  ProductCubit({required this.channel}) : super(const ProductEvent.initial());

  void loadProduct() async {
    emit(const ProductEvent.loading());
    final channelProduct = ProductServiceClient(channel);

    var response =
        await channelProduct.getProduct(ProductPagination(page: 1, limit: 100));

    print(response.status);
    if (response.status == 200) {
      emit(ProductEvent.loaded(response.products));
    } else {
      emit(ProductEvent.error(response.message));
    }
  }
}
