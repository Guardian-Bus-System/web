import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PaginationWidget extends StatefulWidget {
  const PaginationWidget({super.key});

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  List<String> items = [
    'items1',
    'items2',
    'items3',
    'items4',
    'items5',
    'items6',
    'items7',
    'items8',
    'items9',
    'items10'
  ];
  int currentPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });

    // 데이터를 초기화하고 새로운 데이터로 채우는 예시 코드입니다.
    await Future.delayed(Duration(seconds: 2)); // 데이터를 가져오는 동안 딜레이를 추가합니다.
    setState(() {
      items = List.generate(
          8, (index) => 'item ${index + 1 + (currentPage - 1) * 10}');
      isLoading = false;
    });
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
      fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Text('${index + 1 + (currentPage - 1) * 10} : '),
                        Expanded(child: Text(items[index]))
                      ],
                    ).p8();
                  },
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed:
                  currentPage > 1 ? () => changePage(currentPage - 1) : null,
            ),
            for (int i = 1; i <= 5; i++)
              TextButton(
                onPressed: currentPage != i ? () => changePage(i) : null,
                child: Text(
                  '$i',
                  style: TextStyle(
                    fontWeight:
                        currentPage == i ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ).pSymmetric(h: 4),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed:
                  currentPage < 5 ? () => changePage(currentPage + 1) : null,
            ),
          ],
        ).p16(),
      ],
    );
  }
}

class DefaultLayoutWidget extends StatelessWidget {
  final Widget child;

  const DefaultLayoutWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DefaultLayoutWidget(child: PaginationWidget()),
  ));
}
