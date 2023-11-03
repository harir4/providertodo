class Datas {
  String Text;
  bool checkitem;

  Datas({required this.Text, required this.checkitem});

  void togglecomplete() {
    checkitem = !checkitem;
  }
}
