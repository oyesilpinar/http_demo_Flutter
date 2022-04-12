class Product{

  int id;
  int categoryID;
  String productName;
  String quantityPerUnit;
  double unitPrice;
  int unitsInStock;


  Product(this.id,this.categoryID,this.productName,this.quantityPerUnit,
      this.unitPrice,this.unitsInStock);


  Product.fromJson(Map json){
    id= json["id"];
    categoryID= json["categoryID"];
    productName=json["productName"];
    quantityPerUnit=json["quantityPerUnit"];
    unitPrice=double.tryParse(json["unitPrice"].toString()) ;
    unitsInStock=json["unitsInStock"];
  }

  Map toJson(){
    return {"id":id,"categoryID":categoryID,"productName":productName,
      "quantityPerUnit":quantityPerUnit,"unitPrice":unitPrice,
      "unitsInStock":unitsInStock};
  }


}