class Items_data {
  String? itemId;
  String? itemDate;
  String? itemStatus;
  String? itemSessionid;
  String? itemComments;
  String? itemHistory;
  String? itemDeptid;
  String? itemStore;
  String? itemInstore;
  String? itemSupplier;
  String? itemType;
  String? itemCurrency;
  String? itemBrand;
  String? itemAuthor;
  String? itemCupboard;
  String? itemGender;
  String? itemSeason;
  String? itemSize;
  String? itemColor;
  String? itemDetails;
  String? itemStrength;
  String? itemName;
  String? itemRate;
  String? itemPrice;
  String? itemVat;
  String? itemDiscount;
  String? itemPhoto1;
  String? itemPhoto2;
  String? itemPhoto3;
  String? itemPhoto4;
  String? itemVideo;
  String? itemWarranty;
  String? itemStock;
  String? itemUnit;
  String? itemQtyperpack;
  String? itemMonthlyconsumption;
  String? itemNumberofptreated;
  String? itemFeatured;
  String? itemBestseller;

  Items_data(
      {this.itemId,
      this.itemDate,
      this.itemStatus,
      this.itemSessionid,
      this.itemComments,
      this.itemHistory,
      this.itemDeptid,
      this.itemStore,
      this.itemInstore,
      this.itemSupplier,
      this.itemType,
      this.itemCurrency,
      this.itemBrand,
      this.itemAuthor,
      this.itemCupboard,
      this.itemGender,
      this.itemSeason,
      this.itemSize,
      this.itemColor,
      this.itemDetails,
      this.itemStrength,
      this.itemName,
      this.itemRate,
      this.itemPrice,
      this.itemVat,
      this.itemDiscount,
      this.itemPhoto1,
      this.itemPhoto2,
      this.itemPhoto3,
      this.itemPhoto4,
      this.itemVideo,
      this.itemWarranty,
      this.itemStock,
      this.itemUnit,
      this.itemQtyperpack,
      this.itemMonthlyconsumption,
      this.itemNumberofptreated,
      this.itemFeatured,
      this.itemBestseller});

  Items_data.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemDate = json['item_date'];
    itemStatus = json['item_status'];
    itemSessionid = json['item_sessionid'];
    itemComments = json['item_comments'];
    itemHistory = json['item_history'];
    itemDeptid = json['item_deptid'];
    itemStore = json['item_store'];
    itemInstore = json['item_instore'];
    itemSupplier = json['item_supplier'];
    itemType = json['item_type'];
    itemCurrency = json['item_currency'];
    itemBrand = json['item_brand'];
    itemAuthor = json['item_author'];
    itemCupboard = json['item_cupboard'];
    itemGender = json['item_gender'];
    itemSeason = json['item_season'];
    itemSize = json['item_size'];
    itemColor = json['item_color'];
    itemDetails = json['item_details'];
    itemStrength = json['item_strength'];
    itemName = json['item_name'];
    itemRate = json['item_rate'];
    itemPrice = json['item_price'];
    itemVat = json['item_vat'];
    itemDiscount = json['item_discount'];
    itemPhoto1 = json['item_photo1'];
    itemPhoto2 = json['item_photo2'];
    itemPhoto3 = json['item_photo3'];
    itemPhoto4 = json['item_photo4'];
    itemVideo = json['item_video'];
    itemWarranty = json['item_warranty'];
    itemStock = json['item_stock'];
    itemUnit = json['item_unit'];
    itemQtyperpack = json['item_qtyperpack'];
    itemMonthlyconsumption = json['item_monthlyconsumption'];
    itemNumberofptreated = json['item_numberofptreated'];
    itemFeatured = json['item_featured'];
    itemBestseller = json['item_bestseller'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['item_date'] = itemDate;
    data['item_status'] = itemStatus;
    data['item_sessionid'] = itemSessionid;
    data['item_comments'] = itemComments;
    data['item_history'] = itemHistory;
    data['item_deptid'] = itemDeptid;
    data['item_store'] = itemStore;
    data['item_instore'] = itemInstore;
    data['item_supplier'] = itemSupplier;
    data['item_type'] = itemType;
    data['item_currency'] = itemCurrency;
    data['item_brand'] = itemBrand;
    data['item_author'] = itemAuthor;
    data['item_cupboard'] = itemCupboard;
    data['item_gender'] = itemGender;
    data['item_season'] = itemSeason;
    data['item_size'] = itemSize;
    data['item_color'] = itemColor;
    data['item_details'] = itemDetails;
    data['item_strength'] = itemStrength;
    data['item_name'] = itemName;
    data['item_rate'] = itemRate;
    data['item_price'] = itemPrice;
    data['item_vat'] = itemVat;
    data['item_discount'] = itemDiscount;
    data['item_photo1'] = itemPhoto1;
    data['item_photo2'] = itemPhoto2;
    data['item_photo3'] = itemPhoto3;
    data['item_photo4'] = itemPhoto4;
    data['item_video'] = itemVideo;
    data['item_warranty'] = itemWarranty;
    data['item_stock'] = itemStock;
    data['item_unit'] = itemUnit;
    data['item_qtyperpack'] = itemQtyperpack;
    data['item_monthlyconsumption'] = itemMonthlyconsumption;
    data['item_numberofptreated'] = itemNumberofptreated;
    data['item_featured'] = itemFeatured;
    data['item_bestseller'] = itemBestseller;
    return data;
  }
}
