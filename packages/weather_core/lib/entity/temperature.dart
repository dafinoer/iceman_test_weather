import 'package:equatable/equatable.dart';

class Temperature extends Equatable {
  final double tempMin;
  final double tempMax;

  Temperature({
    required this.tempMax,
    required this.tempMin,
  });

  @override
  List<Object?> get props => [tempMin, tempMax];
}
