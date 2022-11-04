import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_manager/components/Transaction.dart';
import 'package:money_manager/components/TransactionContentWidget.dart';

class ListTransactionWidget extends StatelessWidget {
  final Future<List<TransactionDetails>> transactions;

  ListTransactionWidget({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.0.w,
      height: 310.0.h,
      child: FutureBuilder<List<TransactionDetails>>(
        future: this.transactions,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TransactionContentWidget(
                    transaction: snapshot.data![index],
                  );
                });
          } else if (snapshot.hasError) {
            return Text("Error");
          } else {
            return CircularProgressIndicator();
            ;
          }
        },
      ),
    );
  }
}
