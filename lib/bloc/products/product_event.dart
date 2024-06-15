import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopproto/pkg/product.pb.dart';
import 'package:shopprotoflutter/models/product_model.dart';

part 'product_event.freezed.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.initial() = Initial;
  const factory ProductEvent.loading() = Loading;
  const factory ProductEvent.loaded(List<ProductRequest> data) = Loaded;
  const factory ProductEvent.error(String message) = Error;
}
