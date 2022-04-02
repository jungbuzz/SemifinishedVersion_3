void mouseClicked(){
  ///* 若空白鍵失效，可用滑鼠點擊介面重啟遊戲
  if(gameclear == true){
    if(mouseY>=(mapSizey-15-30) && mouseY<=mapSizey){
      score=0;
      gameclear=false;
      gametalk=false;
      endgametalk=false;
      endgameparentstalk=false;
      level_where=0;
      minim.stop();
      introduction_play=false;
      talk_play=false;
      theme_play=true;
      frameCount=0;
      setup();
      redraw();
    }
  }
  //*/
  if(level_where==0 && gametalk==false){
    if(mouseX>=(floor(5*mapSizex/7)-150) && mouseX<=(floor(5*mapSizex/7)+150) && mouseY>=(floor(mapSizey/3)-50) && mouseY<=(floor(mapSizey/3)+50)){
      gametalk=true;
      endgametalk=false;
      endgameparentstalk=false;
    }
    if(mouseX>=(floor(5*mapSizex/7)-150) && mouseX<=(floor(5*mapSizex/7)+150) && mouseY>=(floor(mapSizey/3)+150-50) && mouseY<=(floor(mapSizey/3)+150+50)){
      gametalk=false;
      endgametalk=false;
      endgameparentstalk=false;
      introducescreen=false;
      level_where=1;
      selectscreen=true;
    }
    if(mouseX>=(floor(5*mapSizex/7)-150) && mouseX<=(floor(5*mapSizex/7)+150) && mouseY>=(floor(mapSizey/3)+300-50) && mouseY<=(floor(mapSizey/3)+300+50)){
      gametalk=false;
      endgametalk=false;
      endgameparentstalk=false;
      selectscreen=false;
      level_where=2;
      introducescreen=true;
    }
  }
  
  if(selectscreen==true){
    if(mouseX>=(floor(mapSizex/5)-levelbtn_width/2) && mouseX<=(floor(mapSizex/5)+levelbtn_width/2) && mouseY>=(levelbtny-levelbtn_height/2) && mouseY<=(levelbtny+levelbtn_height/2)){
      selectscreen=false;
      introducescreen=false;
      gametalk=false;
      endgametalk=false;
      endgameparentstalk=false;
      level_where=4;
      gamelevel1=true;
      changelevel_temp=0;
      for(int i=0;i<star_number;i++){
        select_whether[i]=false;
      }
    }
    if(mouseX>=(mapSizex/2-levelbtn_width/2) && mouseX<=(mapSizex/2+levelbtn_width/2) && mouseY>=(levelbtny-levelbtn_height/2) && mouseY<=(levelbtny+levelbtn_height/2)){
      selectscreen=false;
      introducescreen=false;
      gametalk=false;
      endgametalk=false;
      endgameparentstalk=false;
      level_where=5;
      gamelevel2=true;
      changelevel_temp=0;
      for(int i=0;i<star_number;i++){
        select_whether[i]=false;
      }
    }
    if(mouseX>=(mapSizex-floor(mapSizex/5)-levelbtn_width/2) && mouseX<=(mapSizex-floor(mapSizex/5)+levelbtn_width/2) && mouseY>=(levelbtny-levelbtn_height/2) && mouseY<=(levelbtny+levelbtn_height/2)){
      selectscreen=false;
      introducescreen=false;
      gametalk=false;
      endgametalk=false;
      endgameparentstalk=false;
      level_where=6;
      gamelevel3=true;
      changelevel_temp=0;
      for(int i=0;i<star_number;i++){
        select_whether[i]=false;
      }
    }
    if(mouseX>=(mapSizex-50-del_width/2) && mouseX<=(mapSizex-50+del_width/2) && mouseY>=(50-del_height/2) && mouseY<=(50+del_height/2)){
      selectscreen=false;
      gametalk=false;
      endgametalk=false;
      endgameparentstalk=false;
      level_where=0;
      minim.stop();
      introduction_play=false;
      talk_play=false;
      theme_play=true;
      frameCount=0;
      setup();
      redraw();
    }
  }
  if(introducescreen==true){
    if(mouseX>=(mapSizex-order_width-order_width/2) && mouseX<=(mapSizex-order_width+order_width/2) && mouseY>=(mapSizey-order_height-order_height/2) && mouseY<=(mapSizey-order_height+order_height/2) && story_order>=1 && story_order<4){
       story_order+=1;
      if(story_order>4){
        story_order=4;
      }
    }
    if(mouseX>=(order_width-order_width/2) && mouseX<=(order_width+order_width/2) && mouseY>=(mapSizey-order_height-order_height/2) && mouseY<=(mapSizey-order_height+order_height/2) && story_order>1 && story_order<=4){
      story_order-=1;
      if(story_order<1){
        story_order=1;
      }
    }
    if(mouseX>url1_x-88 && mouseX<url1_x+88 && mouseY>url1_y-15/2 && mouseY<url1_y+15/2){
      link(url1);
    }
    if(mouseX>url2_x-123 && mouseX<url2_x+123 && mouseY>url2_y-15/2 && mouseY<url2_y+15/2){
      link(url2);
    }
    if(mouseX>url3_x-130 && mouseX<url3_x+130 && mouseY>url3_y-15/2 && mouseY<url3_y+15/2){
      link(url3);
    }
    if(mouseX>=(mapSizex-50-del_width/2) && mouseX<=(mapSizex-50+del_width/2) && mouseY>=(50-del_height/2) && mouseY<=(50+del_height/2)){
      introducescreen=false;
      gametalk=false;
      endgametalk=false;
      endgameparentstalk=false;
      level_where=0;
      minim.stop();
      introduction_play=false;
      talk_play=false;
      theme_play=true;
      frameCount=0;
      setup();
      redraw();
    }
  }
  
  if(mouseX>=btn_setx && mouseX<=(btn_setx+set_width) && mouseY>=btn_sety && mouseY<=(btn_sety+set_height) && level_where>2){
    setscreen=true;
  }
  
  if(setscreen){
    if(mouseX>=btn_delx && mouseX<=(btn_delx+del_width) && mouseY>=btn_dely && mouseY<=(btn_dely+del_height)){
      setscreen=false;
    }
    if (mouseX > btn_volumex && mouseX < btn_volumex+volumebtn_width && mouseY > btn_volumey && mouseY < btn_volumey+volumebtn_height) {
      //音量靜音
      if (theme.isMuted()){
        volume_mute=false;
        volume_wherex=tempvolume_wherex;
        walk.unmute();
      }
      else{
        volume_mute=true;
        tempvolume_wherex=volume_wherex;
        volume_wherex=minX;
        theme.mute();
      }
    }
    if (mouseX > btn_soundeffectx && mouseX < btn_soundeffectx+volumebtn_width && mouseY > btn_soundeffecty && mouseY < btn_soundeffecty+volumebtn_height) {
      //音效靜音
      if (walk.isMuted()){
        soundeffect_mute=false;
        soundeffect_wherex=tempsoundeffect_wherex;
        walk.unmute();
      }
      else{
        soundeffect_mute=true;
        tempsoundeffect_wherex=soundeffect_wherex;
        soundeffect_wherex=minX;
        walk.mute();
      }
    }
    if(mouseX>=btn_homex && mouseX<=(btn_homex+home_width) && mouseY>=btn_homey && mouseY<=(btn_homey+home_height)){
      setscreen=false;
      gametalk=false;
      endgametalk=false;
      endgameparentstalk=false;
      testlevel=false;
      testtolevel1=false;
      gamelevel1=false;
      level1to2=false;
      gamelevel2=false;
      level2to3=false;
      gamelevel3=false;
      level3toEnd=false;
      gameclear=false;
      minim.stop();
      level_where=0;
      score=0;
      introduction_play=false;
      talk_play=false;
      theme_play=true;
      frameCount=0;
      setup();
      redraw();
    }
  }
  
  if(testlevel){
    if(mouseX>=btn_gox && mouseX<=(btn_gox+go_width) && mouseY>=btn_goy && mouseY<=(btn_goy+go_height)){
      gametalk=false;
      cloud0X = -100;//下面的雲x、y軸
      cloud0Y = 210;
      cloud2X = -850;//上面的雲x、y軸
      cloud2Y = -50;
      //人物起始位置
      playerx=floor(mapSizex/6);
      playery=maxYSide-person_height/2;
      
      //先重置設定，防止重新遊戲時人物亂動
      walkSpeedx=0;
      walkSpeedy=0;
      walkAccelx=0;
      walkAccelxtmp=0;
      testtolevel1=true;
      for(int i=0;i<star_number;i++){
        select_whether[i]=false;
      }
    }
  }
  
  if(level1to2){
    if(mouseX>=btn_gox && mouseX<=(btn_gox+go_width) && mouseY>=btn_goy && mouseY<=(btn_goy+go_height)){
      level1to2=false;
      level_where=5;
      //人物起始位置
      playerx=floor(mapSizex/6);
      playery=mapSizey-sideDistance-person_height/2;
      
      //先重置設定，防止重新遊戲時人物亂動
      walkSpeedx=0;
      walkSpeedy=0;
      walkAccelx=0;
      walkAccelxtmp=0;
      gamelevel2=true;
      for(int i=0;i<star_number;i++){
        select_whether[i]=false;
      }
      squatdown=false;
      jump_speed=14;
      temp=0;
    }
  }
  
  if(level2to3){
    if(mouseX>=btn_gox && mouseX<=(btn_gox+go_width) && mouseY>=btn_goy && mouseY<=(btn_goy+go_height)){
      level2to3=false;
      level_where=6;
      //人物起始位置
      playerx=floor(mapSizex/6);
      playery=mapSizey-sideDistance-person_height/2;
      
      //先重置設定，防止重新遊戲時人物亂動
      walkSpeedx=0;
      walkSpeedy=0;
      walkAccelx=0;
      walkAccelxtmp=0;
      gamelevel3=true;
      for(int i=0;i<star_number;i++){
        select_whether[i]=false;
      }
      squatdown=false;
      jump_speed=14;
      temp=0;
    }
  }
  
  if(level3toEnd){
    if(mouseX>=btn_gox && mouseX<=(btn_gox+go_width) && mouseY>=btn_goy && mouseY<=(btn_goy+go_height)){
      level3toEnd=false;
      level_where=7;
      //人物起始位置
      playerx=floor(mapSizex/6);
      playery=mapSizey-sideDistance-person_height/2;
      
      //先重置設定，防止重新遊戲時人物亂動
      walkSpeedx=0;
      walkSpeedy=0;
      walkAccelx=0;
      walkAccelxtmp=0;
      endgametalk=true;
      for(int i=0;i<star_number;i++){
        select_whether[i]=false;
      }
      squatdown=false;
      jump_speed=14;
      temp=0;
    }
  }
  
  if(gametalk){
    if (count==0) {
      board = loadImage("bg_dialog1.png");
      count++;
      println("count="+count);
    } 
    else if (count==1){
      board = loadImage("bg_dialog2.png");
      count++;
      println("count="+count);
    }
    else if (count==2){
      board = loadImage("bg_dialog3.png");
      count++;
      println("count="+count);
    }
    else if (count==3){
      board = loadImage("bg_dialog4.png");
      count++;
      println("count="+count);
    }
    else if (count==4){
      board = loadImage("bg_dialog5.png");
      count++;
      println("count="+count);
    }
    else if (count==5){
      board = loadImage("bg_dialog6.png");
      count++;
      println("count="+count);
    }
    else if (count==6){
      board = loadImage("bg_dialog7.png");
      count++;
      println("count="+count);
    }
    else if (count==7){
      board = loadImage("bg_dialog8.png");
      count++;
      println("count="+count);
    }
    else if (count==8){
      board = loadImage("bg_dialog9.png");
      count++;
      println("count="+count);
    }
    else if (count==9){
      board = loadImage("bg_dialog10.png");
      count++;
      println("count="+count);
    }
    else if (count==10){
      board = loadImage("bg_dialog11.png");
      count++;
      println("count="+count);
    }
    else if (count==11){
      board = loadImage("bg_dialog12.png");
      count++;
      println("count="+count);
    }
    else if (count==12){
      board = loadImage("bg_dialog13.png");
      count++;
      println("count="+count);
    }
    else if (count==13){
      board = loadImage("bg_dialog14.png");
      count++;
      println("count="+count);
    }
    else if (count==14){
      gametalk=false;
      level_where=3;
      cloud0X = -100;//下面的雲x、y軸
      cloud0Y = 210;
      cloud2X = -850;//上面的雲x、y軸
      cloud2Y = -50;
      //人物起始位置
      playerx=floor(mapSizex/6);
      playery=maxYSide-person_height/2;
      
      //先重置設定，防止重新遊戲時人物亂動
      walkSpeedx=0;
      walkSpeedy=0;
      walkAccelx=0;
      walkAccelxtmp=0;
      testlevel=true;
      for(int i=0;i<star_number;i++){
        select_whether[i]=false;
      }
      count=0;
    }//接測試關
    else{
      count=13;
    }
  }
  if (endgametalk){
    if (endcount==0) {
       board = loadImage("bg_end_dialog1.png");
       endcount++;
       println("endcount="+endcount);
      } 
    else if (endcount==1){
      board = loadImage("bg_end_dialog2.png");
      endcount++;
      println("endcount="+endcount);
    }
    else if (endcount==2){
      board = loadImage("bg_end_dialog3.png");
      endcount++;
      println("endcount="+endcount);
    }
    else if (endcount==3){
      board = loadImage("bg_end_dialog4.png");
      endcount++;
      println("endcount="+endcount);
    }
    else if (endcount==4){
      board = loadImage("bg_end_dialog5.png");
      endcount++;
      println("endcount="+endcount);
    }
    else if (endcount==5){
      endgametalk = false;
      endgameparentstalk=true;
      endcount=0;
    }
    else{
      endcount=4;
    }  
    
  }
  if (endgameparentstalk){
    if (endcount2==0) {
        parentstalk = loadImage("bg_end_dialog7.png");
        endcount2++;
        textSize(48);
        fill(#FF0303);
        text("Click!", 500, 730);
        println("endcount2="+endcount2);
      } 
      else if (endcount2==1) {
        textSize(48);
        fill(#FFFFFF);
        text("Click!", 500, 730);
        parentstalk_x1 = 200;
        parentstalk_y1 = 205;
        parentstalk = loadImage("bg_end_dialog8.png");
        endcount2++;
        textSize(48);
        fill(#FF0303);
        text("Click!", 500, 730);
        println("endcount2="+endcount2);
      } 
      else if (endcount2==2) {
        textSize(48);
        fill(#FFFFFF);
        text("Click!", 500, 730);
        parentstalk_x1 = 60;
        parentstalk_y1 = 320;
        parentstalk_width = 300;
        parentstalk = loadImage("bg_end_dialog9.png");    
        endcount2++;
        textSize(48);
        fill(#FF0303);
        text("Click!", 500, 730);
        println("endcount2="+endcount2);
      } 
      else if (endcount2==3) {
        textSize(48);
        fill(#FFFFFF);
        text("Click!", 500, 730);
        parentstalk_x1 = 200;
        parentstalk_y1 = 420;
        parentstalk_width = 500;
        parentstalk = loadImage("bg_end_dialog10.png");
        endcount2++;
        textSize(48);
        fill(#FF0303);
        text("Click!", 500, 730);
        println("endcount2="+endcount2);
      } 
      else if (endcount2==4) {
        endgameparentstalk=false;
        gameclear=true;
        endcount2=0;
        parentstalk_x1 = 30;
        parentstalk_y1 = 140;
        parentstalk_width = 300;
      }
      else{
        endcount2=3;
      }      
  }
}
