void testLevel(){
  imageMode(CORNER);
  image(img_testbackground,0,0,mapSizex,mapSizey);
  tint(255,126);//雲透明度
  image(cloud0,cloud0X,cloud0Y);
  tint(255,255);//雲切回不透明
  image(cloud2,cloud2X,cloud2Y);
  for(int i=0;i<=4;i++){
    image(img_grass,245*i-5,maxYSide,250,sideDistance);
  }
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
  image(img_arrowkeys,board_arrowx,board_arrowy,board_width,board_height);
  image(img_btnpickup,board_pickupx,board_pickupy,board_width,board_height);
  image(img_btngo,btn_gox,btn_goy,go_width,go_height);
  //設定按鈕
  image(img_btnset,btn_setx,btn_sety,set_width,set_height);
  //移除所有障礙物及目標物
  for(int i=0;i<maxblock_number;i++){
    blockx[i]=mapSizex+500;
    blocky[i]=mapSizey+500;
  }
  for(int i=0;i<maxstar_number;i++){
    starx[i]=mapSizex+500;
    stary[i]=mapSizey+500;
  }
  
  for(int i=0;i<maxthings_number;i++){
    thingsx[i]=mapSizex+500;
    thingsy[i]=mapSizey+500;
  }
}
