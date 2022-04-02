void gameTalk(){
  imageMode(CORNER);
  background(img_talkbackground);
  tint(255,126);//雲透明度
  image(cloud0,cloud0X,cloud0Y);
  tint(255,255);//雲切回不透明
  image(cloud2,cloud2X,cloud2Y);
  image(boyhappy,100,210,300,450);
  image(board,30,450,950,300);
  if(!setscreen){
      cloud0X = cloud0X + 3;
    if(cloud0X>=1050){
       cloud0X = -1000;
    }
        cloud2X = cloud2X + 2;
    if(cloud2X>=1050){
       cloud2X = -1000;
    }
  }
}
