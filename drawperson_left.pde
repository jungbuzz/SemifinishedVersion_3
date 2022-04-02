//人物左移時之動畫
void drawperson_left(float x, float y, int personWidth, int personHeight){
  if(temp<image_time){
    image(img_left0,x,y,personWidth,personHeight);
  }
  if(temp>=image_time && temp<2*image_time){
    image(img_left1,x,y,personWidth,personHeight);
  }
  if(temp>=2*image_time && temp<3*image_time){
    image(img_left2,x,y,personWidth,personHeight);
  }
  if(temp>=3*image_time){
    temp=0;
  }
}
