import 'package:carousel_slider/carousel_slider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional/conditional.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/home_layout/cubit/home_cuibt.dart';
import 'package:shop_app/modules/home_layout/cubit/home_states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    var productCount = homeCubit.homeModel!.data.products.length;
    print('${HomeCubit.count}');

    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Conditional(
            condition: state is HomeLoadingState,
            onConditionTrue: Center(child: CircularProgressIndicator()),
            onConditionFalse: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CarouselSlider(
                      items: homeCubit.homeModel?.data.banners
                          .map((e) => Image(
                                image: NetworkImage('${e['image']}'),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ))
                          .toList(),
                      options: CarouselOptions(
                          height: 250.0,
                          reverse: false,
                          autoPlay: true,
                          viewportFraction: 1,
                          autoPlayAnimationDuration: Duration(seconds: 1),
                          initialPage: 0,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    color: Colors.grey[300],
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.53,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          productCount != null ? productCount : 0,
                          (index) => Container(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      alignment:
                                          AlignmentDirectional.bottomStart,
                                      children: [
                                        Image(
                                          image: NetworkImage(
                                              '${homeCubit.homeModel?.data.products[index]['image']}'),
                                          width: double.infinity,
                                          height: 200.0,
                                        ),
                                        if (homeCubit.homeModel?.data
                                                .products[index]['discount'] !=
                                            0)
                                          Container(
                                            color: Colors.red,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Text(
                                              'Discount',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${homeCubit.homeModel?.data.products[index]['name']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${homeCubit.homeModel?.data.products[index]['price']}',
                                                style: TextStyle(
                                                    color: Colors.lightBlue),
                                              ),
                                              SizedBox(width: 5.0),
                                              if (homeCubit.homeModel?.data
                                                          .products[index]
                                                      ['discount'] !=
                                                  0)
                                                Text(
                                                  '${homeCubit.homeModel?.data.products[index]['old_price']}',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      decoration: TextDecoration
                                                          .lineThrough),
                                                ),
                                              Spacer(),
                                              IconButton(
                                                  onPressed: () {},
                                                  padding: EdgeInsets.zero,
                                                  icon: (Icon(
                                                      Icons.favorite_border)))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  )
                ],
              ),
            ), //HomeCubit.get(context).homeModel),
          );
        });
  }
}
