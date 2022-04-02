//人物右移時之動畫
void drawperson_right(float x, float y, int personWidth, int personHeight){
  if(temp<image_time){
    image(img_right0,x,y,personWidth,personHeight);
  }
  if(temp>=image_time && temp<2*image_time){
    image(img_right1,x,y,personWidth,personHeight);
  }
  if(temp>=2*image_time && temp<3*image_time){
    image(img_right2,x,y,personWidth,personHeight);
  }
  if(temp>=3*image_time){
    temp=0;
  }
}
