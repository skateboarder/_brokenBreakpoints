part of myapp;

class LineChartCard extends Card {
  final data;
  LineChartCard(Map<String, Map<String, int>> this.data);

  @override
  Widget build(BuildContext context) => Card(
      color: Colors.white,
      child:
          SizedBox(width: 200, height: 300, child: LineGraph.withSampleData()));
}

class DayPose {
  final int day;
  final int reps;
  DayPose(this.day, this.reps);
}

class MonthPose_DailyData {
  final String name;
  final String month;
  final int year;
  final List<int> data;

  //TODO: Maybe create a test for the following assert ?
  MonthPose_DailyData(this.name, this.month, this.data, this.year);

  charts.Series<DayPose, int> as_chartsSeries(Palette color) {
    print('breakpoint! 2'); //This breakpoint does not work
    final _days = data
        .asMap()
        .map((int k, int v) => MapEntry(k, DayPose(k, v)))
        .values
        .toList();

    final colorShades = color.makeShades(7);
    print('breakpoint! 3'); //This breakpoint does not work

    return charts.Series<DayPose, int>(
      id: name,
      //Abcissa and ordinate
      domainFn: (DayPose day, _) => day.day,
      measureFn: (DayPose day, _) => day.reps,
      //Calculate which dot pattern to display
      dashPatternFn: (DayPose day, _) => day.reps == 0 ? [1] : null,

      //? This will take some work, calculate the strokewidth
      //? Maybe include this in the [DayPose] class instead ??
      colorFn: (DayPose day, _) => colorShades[0],
      data: _days,
    );
  }

  MonthPose_DailyData.random()
      : this("PoseName", "Month", [1, 2, 3, 4, 5, 6, 7, 1, 2, 6, 7], 1600);
}

class LineGraph extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  LineGraph(this.seriesList, {this.animate = true});

  @override
  Widget build(BuildContext context) {
    print('breakpoint! 4'); //This breakpoint does not work
    return charts.LineChart(seriesList,
        defaultRenderer:
            charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: animate);
  }

  /// Creates a [LineChart] with sample data and no transition.
  factory LineGraph.withSampleData() {
    print('breakpoint! 5'); //This breakpoint does not work
    return LineGraph(_mySampleData(), animate: true);
  }

  static List<charts.Series<DayPose, int>> _mySampleData() => [
        MonthPose_DailyData.random()
            .as_chartsSeries(charts.MaterialPalette.lime)
      ];
}

const daysInMonth = {
  'January': 31,
  'March': 31,
  'April': 30,
  'May': 31,
  'June': 30,
  'July': 31,
  'August': 31,
  'September': 30,
  'October': 31,
  'November': 30,
  'December': 31
};
