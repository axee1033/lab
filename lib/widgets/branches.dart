import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xlab/modals/branches.dart';
import 'package:xlab/widgets/branch_Card.dart';

class BranchesTab extends StatefulWidget {
  @override
  _BranchesTabState createState() => _BranchesTabState();
}

class _BranchesTabState extends State<BranchesTab> {
  List<Branch> branches;
  var isInit = true;
  var isLoading = false;

  @override
  void didChangeDependencies() async {
    if (isInit) {
      setState(() {
        isLoading = true;
      });
      await Provider.of<Branches>(context, listen: false).fetchBranchesAndSet();
      setState(() {
        isLoading = false;
      });
      isInit = false;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            padding: EdgeInsets.all(25),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) => BranchCard(
              branch: Provider.of<Branches>(context).items[index],
            ),
            itemCount: Provider.of<Branches>(context).items.length,
          );
  }
}
