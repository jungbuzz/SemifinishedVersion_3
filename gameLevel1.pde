void gameLevel1(){
  imageMode(CORNER);
  image(img_level1background,0,0,mapSizex,mapSizey);
  stroke(50);
  /*邊界線
  line(minXSide,minYSide,mapSizex,minYSide);
  line(maxXSide,minYSide,maxXSide,maxYSide);
  line(maxXSide,maxYSide,minXSide,maxYSide);
  line(minXSide,maxYSide,minXSide,minYSide);
  */
  for(int i=0;i<=4;i++){
    image(img_grass,245*i-5,maxYSide,250,sideDistance);
  }
  
  /*方塊版
  rectMode(CENTER);
  rect(blockx,blocky,blockWidth,blockHeight);
  */
  /*關卡一之背景*/
  tint(255,126);//雲朵半透明
  image(img_cloudSlender1,floor(2*mapSizex/5),floor(6*mapSizey/13),260,30);
  image(img_cloudSlender2,-floor(mapSizex/8),floor(3*mapSizey/5),550,100);
  image(img_cloudSlender2,floor(3*mapSizex/4),floor(3*mapSizey/22),380,75);
  image(img_cloudSlender1_rev,floor(mapSizex/8),floor(3*mapSizey/11),310,30);
  image(img_cloudSlender1_rev,floor(5*mapSizex/8),floor(1*mapSizey/5),300,50);
  image(img_cloudSlender1_rev,floor(2*mapSizex/5),floor(3*mapSizey/4),230,30);
  image(img_cloudSlender2,floor(3*mapSizex/5),floor(5*mapSizey/6),380,40);
  image(img_cloudSlender2_cut1,0,floor(mapSizey/12),160,100);
  image(img_cloudSlender2_cut2,floor(5*mapSizex/7),floor(14*mapSizey/29),300,40);
  noTint();//取消透明度
  //踩踏物
  block_number=8;
  for(int i=0;i<maxblock_number;i++){
    if(i<block_number){
      block_visible[i]=1;
    }
    else{
      block_visible[i]=0;
    }
  }
  blockx[0]=mapSizex/2+20;//第一關的方塊1x
  blocky[0]=mapSizey-100;//第一關的方塊1y
  blockWidth[0]=250;
  blockHeight[0]=61;
  blockx[1]=mapSizex/2+350;//第一關的方塊2x
  blocky[1]=mapSizey-200;//第一關的方塊2y
  blockWidth[1]=250;
  blockHeight[1]=61;
  blockx[2]=mapSizex/2+25;//第一關的方塊3x
  blocky[2]=mapSizey-320;//第一關的方塊3y
  blockWidth[2]=150;
  blockHeight[2]=61;
  blockx[3]=400;//第一關的方塊4x
  blocky[3]=mapSizey-400;//第一關的方塊4y
  blockWidth[3]=250;
  blockHeight[3]=61;
  blockx[4]=125;//第一關的方塊5x
  blocky[4]=mapSizey-500;//第一關的方塊5y
  blockWidth[4]=250;
  blockHeight[4]=61;
  blockx[5]=250;//第一關的方塊6x
  blocky[5]=mapSizey-500;//第一關的方塊6y
  blockWidth[5]=250;
  blockHeight[5]=61;
  blockx[6]=600;//第一關的方塊7x
  blocky[6]=mapSizey-600;//第一關的方塊7y
  blockWidth[6]=250;
  blockHeight[6]=61;
  blockx[7]=900;//第一關的方塊8x
  blocky[7]=mapSizey-450;//第一關的方塊8y
  blockWidth[7]=160;
  blockHeight[7]=61;
  imageMode(CENTER);
  for(int i=0;i<block_number;i++){
    if(block_visible[i]==1){
      image(img_grass,blockx[i],blocky[i],blockWidth[i],blockHeight[i]);
    }
  }
  //星星框，星星及點亮物品
  star_number=4;
  starboxx[0]=mapSizex/5;
  for(int i=1;i<star_number;i++){
    starboxx[i]=starboxx[0]+i*(starboxWidth+20);
  }
  for(int i=0;i<star_number;i++){
    image(img_starbox,starboxx[i],starboxy,starboxWidth,starboxHeight);
  }
  starx[0]=blockx[1]+50;//星星1x
  stary[0]=blocky[1]-blockHeight[1]/2-starHeight/2;//星星1y
  starx[1]=blockx[4]+20;//星星2x
  stary[1]=blocky[4]-blockHeight[4]/2-starHeight/2;//星星2y
  starx[2]=blockx[6]+10;//星星3x
  stary[2]=blocky[6]-blockHeight[6]/2-starHeight/2;//星星3y
  starx[3]=blockx[7]+20;//星星4x
  stary[3]=blocky[7]-blockHeight[7]/2-starHeight/2;//星星4y
  
  things_number=4;
  thingsWidth[0]=36;
  thingsHeight[0]=50;
  thingsx[0]=blockx[4]-80;
  thingsy[0]=blocky[4]-blockHeight[4]/10-thingsHeight[0];
  thingsWidth[1]=57;
  thingsHeight[1]=80;
  thingsx[1]=blockx[3]+40;
  thingsy[1]=blocky[3]-blockHeight[3]/10-thingsHeight[1];
  thingsWidth[2]=57;
  thingsHeight[2]=80;
  thingsx[2]=blockx[6]+50;
  thingsy[2]=blocky[6]-blockHeight[6]/10-thingsHeight[2];
  thingsWidth[3]=57;
  thingsHeight[3]=80;
  thingsx[3]=blockx[1]-40;
  thingsy[3]=blocky[1]-blockHeight[1]/10-thingsHeight[3];
  
  for(int i=0;i<things_number;i++){
    imageMode(CORNER);
    if(things_visible[i]==1 && level1to2!=true){
      image(img_windmillNocolor,thingsx[i],thingsy[i],thingsWidth[i],thingsHeight[i]);
    }
    if(things_visible[i]==0 || level1to2==true){
      lightupthingFor1And2(img_windmillcolor_1,img_windmillcolor_2,img_windmillcolor_3,thingsx[i],thingsy[i],thingsWidth[i],thingsHeight[i],1,i);
      if(!select_whether[i]){
        select_recall[i]=int(random(0,recall_number/3));
        select_whether[i]=true;
      }
      textAlign(LEFT);
      textSize(25);
      fill(255);
      text(recall[select_recall[i]], thingsx[i]-20,thingsy[i]-15);
    }
  }
  for(int i=0;i<star_number;i++){
    imageMode(CENTER);
    if(star_visible[i]==1 && level1to2!=true){
      image(img_star,starx[i],stary[i],starWidth,starHeight);
    }
    if(star_visible[i]==0 || level1to2==true){
      image(img_star,starboxx[i],starboxy,5*starWidth/2,5*starHeight/2);
    }
  }
  //設定按鈕
  imageMode(CORNER);
  image(img_btnset,btn_setx,btn_sety,set_width,set_height);
  
}
