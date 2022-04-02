void keyPressed(){
  if(!setscreen){
    switch(keyCode){
      case LEFT:
      walkAccelx=-usualAccel;
      walkAccelxtmp=0;
      break;
      case RIGHT:
      walkAccelx=usualAccel;
      walkAccelxtmp=0;
      break;
      case UP:
      for(int i=0;i<block_number;i++){
        if(playery == maxYSide-person_height/2 || playery == blocky[i]-blockHeight[i]/2-person_height/2){
          walkSpeedy=-jump_speed;
        }
      }
      break;
    }
  }
}

void keyReleased(){
  if(!setscreen){
    switch(keyCode){
      case LEFT:
      walkAccelxtmp=walkAccelx;
      walkAccelx=0;
      break;
      case RIGHT:
      walkAccelxtmp=walkAccelx;
      walkAccelx=0;
      break;
    ///* 按空白鍵遊戲結束重置用
      case ' ':
      if(gameclear == true){
        score=0;
        gameclear=false;
        level_where=0;
        minim.stop();
        frameCount=0;
        setup();
        redraw();
      }
      if(testlevel==true || gamelevel1==true || gamelevel2==true || gamelevel3==true){
        squatdown=true;
      }
      //星星判定
      for(int i=0;i<star_number;i++){
        if(playerx>=(starx[i]-starWidth/2) && playerx<=(starx[i]+starWidth/2) && star_visible[i]==1 && level1to2==false && level2to3==false && level3toEnd==false && gameclear==false) { 
            if((playery+person_height/2)>(stary[i]-starHeight/2) && (playery-person_height/2)<(stary[i]+starHeight/2)){
            star_visible[i]=0;
            score = score + 5;
            }
          }
      }
      //物品判定
      for(int i=0;i<things_number;i++){
        if(playerx>=thingsx[i] && playerx<=(thingsx[i]+thingsWidth[i]) && things_visible[i]==1 && level1to2==false && level2to3==false && level3toEnd==false && gameclear==false) { 
            if((playery+person_height/2)>thingsy[i] && (playery-person_height/2)<(thingsy[i]+thingsHeight[i])){
            things_visible[i]=0;
            score = score + 5;
            }
          }
      }
      break;
     //*/
    }
  }
}
