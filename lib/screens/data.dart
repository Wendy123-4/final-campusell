import 'package:flutter/material.dart';


class SliderModel{

  String logo;
  String imageAssetPath;
  String desc;


  SliderModel({ this.imageAssetPath, this.desc, this.logo});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setlogo(String getlogo){
    logo = getlogo;
  }
  void setdesc(String getdesc){
    desc = getdesc;
  }


  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getdesc(){
    return desc;
  }


  String getlogo(){
    return logo;
  }

}


List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>.empty(growable: true);
  SliderModel sliderModel = new SliderModel(desc: '', imageAssetPath: '', logo: '');

  //1
  sliderModel.setlogo('images/logo.png');
  sliderModel.setImageAssetPath('images/image1.png');
  sliderModel.setdesc("Buy household items at affordable prices from your colleagues!");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imageAssetPath: '', desc: '', logo: '');

  //2
  sliderModel.setlogo('images/logo.png');
  sliderModel.setImageAssetPath('images/image2.png');
  sliderModel.setdesc("Make money!" "\n \n Sell your non-essential house items");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imageAssetPath: '', logo: '', desc: '');

  //3
  sliderModel.setlogo('images/logo.png');
  sliderModel.setImageAssetPath('images/image3.png');
  sliderModel.setdesc("It's a cylcle!" + "\n \n Buy when needed and sell when not needed");
  slides.add(sliderModel);

  sliderModel = new SliderModel(imageAssetPath: '', logo: '', desc: '');

  return slides;
}