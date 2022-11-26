// NOTE: In a good way, a converter from Json would be useful here, but we will skip this point for now.
// We will use generics, since the data can be of different types.
class RadarChartData<T> {
  RadarChartData({
    required this.name,
    required this.value,
  });

  final String name;
  T value;
}
