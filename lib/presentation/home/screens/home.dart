import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopprotoflutter/bloc/products/product_cubit.dart';
import 'package:shopprotoflutter/bloc/products/product_event.dart';
import 'package:shopprotoflutter/config/font_style_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().loadProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "Product",
                style: FontPoppins.font24.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<ProductCubit, ProductEvent>(
                builder: (context, state) {
                  return state.when(
                      initial: () {
                        return const SizedBox();
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      loaded: (data) {
                        return SingleChildScrollView(
                          child: Row(
                            children: data.map((e) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22.0),
                                child: SizedBox(
                                  width: 100,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.memory(
                                        Uri.parse(e.productImage)
                                            .data!
                                            .contentAsBytes(),
                                        gaplessPlayback: true,
                                      ),
                                      Text(e.nama)
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                      error: (msg) => Center(
                            child: Text(msg),
                          ));
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
