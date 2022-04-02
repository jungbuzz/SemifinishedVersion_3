void gameLevel3(){
  imageMode(CORNER);
  image(img_level3background,0,0,mapSizex,mapSizey);
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
  /*關卡三之背景*/
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
  /*
  for(int i=0;i<block_number;i++){
    if((i<block_number-2) || (i==block_number-1)){
      block_visible[i]=1;
    }
    else{
      block_visible[i]=0;
    }
  }
  */
  block_number=10;
  for(int i=0;i<maxblock_number;i++){
    if(i<block_number){
      block_visible[i]=1;
    }
    else{
      block_visible[i]=0;
    }
  }
  blockx[0]=mapSizex/2+100;//第三關的方塊1x
  blocky[0]=mapSizey-120;//第三關的方塊1y
  blockWidth[0]=250;
  blockHeight[0]=61;
  blockx[1]=mapSizex-120;//第三關的方塊2x
  blocky[1]=mapSizey-220;//第三關的方塊2y
  blockWidth[1]=250;
  blockHeight[1]=61;
  blockx[2]=mapSizex/2+40;//第三關的方塊3x
  blocky[2]=mapSizey-340;//第三關的方塊3y
  blockWidth[2]=250;
  blockHeight[2]=61;
  blockx[3]=750;//第三關的方塊4x
  blocky[3]=mapSizey-550;//第三關的方塊4y
  blockWidth[3]=200;
  blockHeight[3]=61;
  blockx[4]=125;//第三關的方塊5x
  blocky[4]=mapSizey-250;//第三關的方塊5y
  blockWidth[4]=250;
  blockHeight[4]=61;
  blockx[5]=350;//第三關的方塊6x
  blocky[5]=mapSizey-400;//第三關的方塊6y
  blockWidth[5]=150;
  blockHeight[5]=61;
  blockx[6]=250;//第三關的方塊7x
  blocky[6]=mapSizey-520;//第三關的方塊7y
  blockWidth[6]=100;
  blockHeight[6]=61;
  blockx[7]=mapSizex-100;//第三關的方塊8x
  blocky[7]=mapSizey-600;//第三關的方塊8y
  blockWidth[7]=250;
  blockHeight[7]=61;
  blockx[8]=70;//第三關的方塊9x
  blocky[8]=mapSizey-630;//第三關的方塊9y
  blockWidth[8]=160;
  blockHeight[8]=61;
  blockx[9]=mapSizex/2+100;//第三關的方塊10x
  blocky[9]=mapSizey-500;//第三關的方塊10y
  blockWidth[9]=160;
  blockHeight[9]=61;
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
  starx[1]=blockx[3]-40;//星星2x
  stary[1]=blocky[3]-blockHeight[3]/2-starHeight/2;//星星2y
  starx[2]=blockx[6]+10;//星星3x
  stary[2]=blocky[6]-blockHeight[6]/2-starHeight/2;//星星3y
  starx[3]=blockx[4]+40;//星星4x
  stary[3]=blocky[4]-blockHeight[4]/2-starHeight/2;//星星4y
  
  things_number=5;
  thingsWidth[0]=100;
  thingsHeight[0]=55;
  thingsx[0]=blockx[0]+10;
  thingsy[0]=blocky[0]-blockHeight[0]/10-thingsHeight[0];
  thingsWidth[1]=79;
  thingsHeight[1]=43;
  thingsx[1]=blockx[2]+10;
  thingsy[1]=blocky[2]-blockHeight[2]/10-thingsHeight[1];
  thingsWidth[2]=100;
  thingsHeight[2]=55;
  thingsx[2]=blockx[7]-20;
  thingsy[2]=blocky[7]-blockHeight[7]/10-thingsHeight[2];
  thingsWidth[3]=64;
  thingsHeight[3]=35;
  thingsx[3]=blockx[8]-40;
  thingsy[3]=blocky[8]-blockHeight[8]/10-thingsHeight[3];
  thingsWidth[4]=73;
  thingsHeight[4]=40;
  thingsx[4]=blockx[4]-90;
  thingsy[4]=blocky[4]-blockHeight[4]/10-thingsHeight[4];
  
  for(int i=0;i<things_number;i++){
    imageMode(CORNER);
    if(things_visible[i]==1 && level3toEnd!=true){
      image(img_musicboxNocolor,thingsx[i],thingsy[i],thingsWidth[i],thingsHeight[i]);
    }
    if(things_visible[i]==0 || level3toEnd==true){
      lightupthingFor3(thingsx[i],thingsy[i],thingsWidth[i],thingsHeight[i],i);
      if(!select_whether[i]){
        select_recall[i]=int(random(2*recall_number/3,recall_number));
        select_whether[i]=true;
      }
      textAlign(LEFT);
      textSize(20);
      fill(255);
      text(recall[select_recall[i]], thingsx[i]-20,thingsy[i]-15);
    }
  }
  
  for(int i=0;i<star_number;i++){
    imageMode(CENTER);
    if(star_visible[i]==1 && gameclear!=true){
      image(img_star,starx[i],stary[i],starWidth,starHeight);
    }
    if(star_visible[i]==0 || gameclear==true){
      image(img_star,starboxx[i],starboxy,5*starWidth/2,5*starHeight/2);
    }
  }
  //設定按鈕
  imageMode(CORNER);
  image(img_btnset,btn_setx,btn_sety,set_width,set_height);
}
