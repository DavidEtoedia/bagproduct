import 'package:bag_product/products/products.dart';
import 'package:bag_product/responsiveness/size_config.dart';
import 'package:flutter/material.dart';

// class StarDisplayWidget extends StatelessWidget {
//   final int value;
//   final Widget filledStar;
//   final Widget unfilledStar;

//   const StarDisplayWidget({
//     Key key,
//     this.value = 0,
//     @required this.filledStar,
//     @required this.unfilledStar,
//   })  : assert(value != null),
//         super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(5, (index) {
//         return index < value ? filledStar : unfilledStar;
//       }),
//     );
//   }
// }

// class StarDisplay extends StarDisplayWidget {
//   const StarDisplay({Key key, int value = 0})
//       : super(
//           key: key,
//           value: value,
//           filledStar: const Icon(Icons.star),
//           unfilledStar: const Icon(Icons.star_border),
//         );
// }

class StatefulStarRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int rating = 0;
    return StatefulBuilder(
      builder: (context, setState) {
        return StarRating(
          onChanged: (index) {
            setState(() {
              rating = index;
            });
          },
          value: rating,
        );
      },
    );
  }
}

class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final Color color;
  final IconData filledStar;
  final IconData unfilledStar;

  const StarRating({
    Key key,
    this.onChanged,
    this.value = 0,
    this.filledStar,
    this.unfilledStar,
    this.color = Colors.yellow,
  })  : assert(value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.yellow;
    final size = SizeConfig.blockSizeHorizontal * 8.6;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 3.5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(5, (index) {
          return InkWell(
              onTap: onChanged != null
                  ? () {
                      onChanged(value == index + 1 ? index : index + 1);
                    }
                  : null,
              focusColor: index < value ? color : null,
              child: Icon(
                index < value
                    ? filledStar ?? Icons.star
                    : unfilledStar ?? Icons.star_border,
                color: color,
                size: size,
              ));
          // return IconButton(
          //   onPressed: onChanged != null
          //       ? () {
          //           onChanged(value == index + 1 ? index : index + 1);
          //         }
          //       : null,
          //   color: index < value ? color : null,
          //   iconSize: size,
          //   icon: Icon(
          //     index < value
          //         ? filledStar ?? Icons.star
          //         : unfilledStar ?? Icons.star_border,
          //     color: color,
          //   ),
          //   padding: EdgeInsets.zero,
          //   tooltip: "${index + 1} of 5",
          // );
        }),
      ),
    );
  }
}
