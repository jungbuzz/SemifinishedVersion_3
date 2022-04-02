void update(){
  allstar_exist=0;//先重置allstar_exist
  allthings_bright=0;//先重置allthings_bright
  //更新玩家目前x座標
  //先判斷玩家位置是否在移動範圍
  if(playerx>=minXSide+person_width/2 && playerx<=maxXSide-person_width/2){
    playerx += walkSpeedx;
    if(walkAccelx!=0){
      //判斷有沒有大於最大速度，如果沒有就加速，否則就不能在加
      if(abs(walkSpeedx)<maxWalkSpeed){
        //要加絕對值以防，負數出現錯誤
        walkSpeedx += walkAccelx; //加速情況
      }
      else{
        if(walkSpeedx>0){
          walkSpeedx=maxWalkSpeed; //已到最大速度，按照原方向，以原速度前進
        }
        else{
          walkSpeedx=-maxWalkSpeed;
        }
      }
    }
    
    //若玩家沒有按著移動鍵 
    else{
      //要是速度的絕對值還比基礎加速度大就繼續減速，若小於基礎加速度就變成0
      if(abs(walkSpeedx)>usualAccel){
        walkSpeedx -= walkAccelxtmp;
      }
      else{
        walkSpeedx=0;
        walkAccelxtmp=0;
      }
    }
  }
  //若在移動範圍外就讓玩家停住並且擋在邊邊
  else{
    if(playerx<minXSide+person_width/2){
      walkSpeedx=0;
      playerx=minXSide+person_width/2;
      walkAccelx=0;    
    }
    if(playerx>maxXSide-person_width/2){
      walkSpeedx=0;
      playerx=maxXSide-person_width/2;
      walkAccelx=0;
    }
  }
  
  //更新玩家目前y座標
  //同x之方式
  if(playery>=minYSide+person_height/2 && playery<=maxYSide-person_height/2){
    //注意:以下兩個程式碼區塊為對單一踏板做各項偵測，若要製作多塊可參考此程式碼
    ///下述這一段是從下面else段提取上來
    if(playery+walkSpeedy<maxYSide-person_height/2){
      playery += walkSpeedy;
      walkSpeedy += gravity;
    }
    else{
      playery=maxYSide-person_height/2;
      walkSpeedy=0;
    } ///到此為止
    //對方塊A的碰撞偵測之反應，即跳躍起點之改變 對x
    if((playery+person_height/2)>(blocky[0]-blockHeight[0]/2)) { 
        if((playerx+person_width/2)>(blockx[0]-blockWidth[0]/2)&& (playerx+person_width/2)<(blockx[0]+blockWidth[0]/2)){
          walkSpeedx=-0.3;
          if(walkSpeedy==0){            
            playerx=blockx[0]-blockWidth[0]/2-person_width/2;
          }
          walkAccelx=0;
        }
        if((playerx-person_width/2)>(blockx[0]-blockWidth[0]/2)&& (playerx-person_width/2)<(blockx[0]+blockWidth[0]/2)){
          walkSpeedx=0.3;
          if(walkSpeedy==0){       
            playerx=blockx[0]+blockWidth[0]/2+person_width/2;
          }
          walkAccelx=0;
        }
    }
    //對方塊A的碰撞偵測之反應，即跳躍起點之改變 對y
     if(((playerx-person_width/2+personWidth_corrected_value)>=(blockx[0]-blockWidth[0]/2) && (playerx-person_width/2+personWidth_corrected_value)<=(blockx[0]+blockWidth[0]/2))||((playerx+person_width/2-personWidth_corrected_value)>=(blockx[0]-blockWidth[0]/2) && (playerx+person_width/2-personWidth_corrected_value)<=(blockx[0]+blockWidth[0]/2))) { 
        if((playery+walkSpeedy+person_height/2)>=(blocky[0]-blockHeight[0]/2)){
          playery=blocky[0]-blockHeight[0]/2-person_height/2;
          walkSpeedy=0; ///經檢測在跳第一個磚時，walkSpeedy會=0.8(重力值)，造成改變圖形的判斷誤判
        }
    }
    
    for(int i=1;i<block_number;i++){
      if(block_visible[i]==1){
        //對其他方塊的碰撞偵測之反應，即跳躍起點之改變 對x
        if((playery+person_height/2)>(blocky[i]-blockHeight[i]/2) && (playery-person_height/2)<(blocky[i]+blockHeight[i]/2-10)) { 
            if((playerx+person_width/2)>(blockx[i]-blockWidth[i]/2)&& (playerx+person_width/2)<(blockx[i]+blockWidth[i]/2)){
              walkSpeedx=-0.3;
              if(walkSpeedy==0){                
                playerx=blockx[i]-blockWidth[i]/2-person_width/2;                
              }
              walkAccelx=0;
            }
            if((playerx-person_width/2)>(blockx[i]-blockWidth[i]/2)&& (playerx-person_width/2)<(blockx[i]+blockWidth[i]/2)){
              walkSpeedx=0.3;
              if(walkSpeedy==0){
                playerx=blockx[i]+blockWidth[i]/2+person_width/2;                
              }
              walkAccelx=0;
            }
        }
        //對其他方塊的碰撞偵測之反應，即跳躍起點之改變 對y
        if(((playerx-person_width/2+personWidth_corrected_value)>=(blockx[i]-blockWidth[i]/2) && (playerx-person_width/2+personWidth_corrected_value)<=(blockx[i]+blockWidth[i]/2))||((playerx+person_width/2-personWidth_corrected_value)>=(blockx[i]-blockWidth[i]/2) && (playerx+person_width/2-personWidth_corrected_value)<=(blockx[i]+blockWidth[i]/2))) { 
            if((playery+walkSpeedy+person_height/2)>=(blocky[i]-blockHeight[i]/2) && (playery+person_height/2)<=(blocky[i]-blockHeight[i]/2)){
              playery=blocky[i]-blockHeight[i]/2-person_height/2;
              walkSpeedy=0;
            }
            if((playery+walkSpeedy+person_height/2)>(blocky[i]-blockHeight[i]/2) && (playery-person_height/2+13)<(blocky[i]+blockHeight[i]/2)){ //y軸格擋 第二句的15為格擋高度修正值
              playery=blocky[i]+blockHeight[i]/2+person_height/2;
              walkSpeedy=-walkSpeedy/2;
            }
            
          }
      }
    }   
    //除了方塊以外其他地方的y判定
    /* ///下述這一段是有問題的
     else{
        if(playery+walkSpeedy<maxYSide-person_height/2){ ///我只把這一段if ... else ... 提到上面#256
          playery += walkSpeedy;
          walkSpeedy += gravity;
        }
        else{
          playery=maxYSide-person_height/2;
          walkSpeedy=0;
        }
   }
   */
  }
  else{
      if(playery+walkSpeedy<maxYSide-person_height/2){
      playery += walkSpeedy;
      walkSpeedy += gravity;
      }
      else{
      playery=maxYSide-person_height/2;
      walkSpeedy=0;
      } ///到此為止
  }
  
  //所有星星的存在值總和才為allstar_gone;若allstar_gone算出來為0即所有星星的存在值為0(消失)
  for(int i=0;i<star_number;i++){
    allstar_exist+=star_visible[i];
  }
  
  //所有星星的存在值總和才為allstar_gone;若allstar_gone算出來為0即所有星星的存在值為0(消失)
  for(int i=0;i<things_number;i++){
    allthings_bright+=things_visible[i];
  }
  
  if(testlevel==true && gamelevel1==false && gamelevel2==false && gamelevel3==false && testtolevel1==true){
    testlevel=false;
    testtolevel1=false;
    gamelevel1=true;
    changelevel_temp=0;
  }
  //第一關是否結束判定
  if(allstar_exist==0 && allthings_bright==0 && gamelevel1==true && gamelevel2==false && gamelevel3==false){
    for(int i=0;i<star_number;i++){
      star_visible[i]=1;
    }
    for(int i=0;i<things_number;i++){
      things_visible[i]=1;
    }
    gamelevel1=false;
    level1to2=true;
    changelevel_temp=0;
  }
  //第二關是否結束判定
  if(allstar_exist==0 && allthings_bright==0 && gamelevel1==false && gamelevel2==true && gamelevel3==false){
    for(int i=0;i<star_number;i++){
      star_visible[i]=1;
    }
    for(int i=0;i<things_number;i++){
      things_visible[i]=1;
    }
    gamelevel2=false;
    level2to3=true;
    changelevel_temp=0;
  }
  //第三關是否結束判定
  if(allstar_exist==0 && allthings_bright==0 && gamelevel1==false && gamelevel2==false && gamelevel3==true){
    gamelevel3=false;
    level3toEnd=true;
    changelevel_temp=0;
  }
  
  //把玩家標出來
  /*noStroke();
  fill(240,220,0);
  ellipse(playerx,playery,ball_diameter,ball_diameter);
  */ //圓球版
  
  imageMode(CENTER);
  //小人版
  if(!squatdown){
    if(walkSpeedx==0 && walkSpeedy==0){
      temp=0;
      walkMusic_play=false;
      image(img_stop,playerx,playery+ground_corrected_value,person_width,person_height);
    }
    if(walkSpeedx<0 && walkSpeedy==0){
      walkMusic_play=true;
      drawperson_left(playerx,playery+ground_corrected_value,person_width,person_height);
    }
    if(walkSpeedx<0 && walkSpeedy!=0){
      temp=0;
      walkMusic_play=false;
      image(img_leftJump,playerx,playery+ground_corrected_value,person_width,person_height);
    }
    if(walkSpeedx>0 && walkSpeedy==0){
      walkMusic_play=true;
      drawperson_right(playerx,playery+ground_corrected_value,person_width,person_height);
    }
    if(walkSpeedx>0 && walkSpeedy!=0){
      temp=0;
      walkMusic_play=false;
      image(img_rightJump,playerx,playery+ground_corrected_value,person_width,person_height);
    }
    if(walkSpeedx==0 && walkSpeedy!=0){
      temp=0;
      walkMusic_play=false;
      image(img_rightJump,playerx,playery+ground_corrected_value,person_width,person_height);
    }
  }
  else{
    if(temp<2*image_time){
      walkSpeedx=0;
      walkAccelx=0;
      walkAccelxtmp=0;
      jump_speed=0;
      walkMusic_play=false;
      image(img_squatdown,playerx,playery+ground_corrected_value,person_width,person_height);
    }
    if(temp>=2*image_time){
      squatdown=false;
      walkMusic_play=false;
      jump_speed=14;
      temp=0;
    }
  }
}
