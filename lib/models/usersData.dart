class userData {
 late dynamic subscriptionNumber;
 late dynamic iDNumber;
 late dynamic currentBillValue;
 late dynamic arrearsValue;
 late dynamic month1;
 late dynamic month2;

  userData(
      {
      required this.subscriptionNumber,
      required this.iDNumber,
      required this.currentBillValue,
      required this.arrearsValue,
      required this.month1,
      required this.month2});

  userData.fromMap(Map<String, dynamic> json) {
    subscriptionNumber = json['subscriptionNumber'];
    iDNumber = json['idNumber'];
    currentBillValue = json['currentBillValue'];
    arrearsValue = json['arrearsValue'];
    month1 = json['month1'];
    month2 = json['month2'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subscriptionNumber'] = this.subscriptionNumber;
    data['idNumber'] = this.iDNumber;
    data['currentBillValue'] = this.currentBillValue;
    data['arrearsValue'] = this.arrearsValue;
    data['month1'] = this.month1;
    data['month2'] = this.month2;
    return data;
  }
}