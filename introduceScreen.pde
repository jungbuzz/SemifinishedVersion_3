void introduceScreen(){
  imageMode(CORNER);
  if(story_order==1){
    background(img_story1);
  }
  else if(story_order==2){
    background(img_story2);
  }
  else if(story_order==3){
    background(img_story3);
  }
  else{
    background(img_story4);
  }
  imageMode(CENTER);
  if(story_order==1){
    image(img_forward,mapSizex-order_width,mapSizey-order_height,order_width,order_height);
  }
  else if(story_order==4){
    image(img_backward,order_width,mapSizey-order_height,order_width,order_height);
  }
  else{
    image(img_backward,order_width,mapSizey-order_height,order_width,order_height);
    image(img_forward,mapSizex-order_width,mapSizey-order_height,order_width,order_height);
  }
  image(img_del,mapSizex-50,50,del_width,del_height);
}
