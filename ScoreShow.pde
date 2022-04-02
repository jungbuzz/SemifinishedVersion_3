//分數制度及結束畫面
void scoreShow(){
  if(gameclear){
    imageMode(CORNER);
    image(img_gameEnd,0,0,mapSizex,mapSizey);
    
    imageMode(CORNER);
    //設定按鈕
    image(img_btnset,btn_setx,btn_sety,set_width,set_height);
    textAlign(LEFT);
    textSize(75);
    fill(255);
    text("感謝遊玩", mapSizex/8, floor(4*mapSizey/7));
    textSize(30);
    fill(255);
    text("Your Score: "+score, floor(2*mapSizex/5), floor(3*mapSizey/7));
    textSize(30);
    fill(#235519);
    text("點擊下方此區域或按空白鍵", floor(mapSizex/3), mapSizey-13);
  }
}
//*/
