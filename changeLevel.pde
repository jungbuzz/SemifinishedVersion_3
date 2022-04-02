/*關卡過渡動畫*/
void changeLevel(){
  background(0);
  imageMode(CENTER);
  image(bg_changelevel,width/2,height/2);
  if(changelevel_temp<changelevel_imagetime){
    changelevel_temp++;
    tint(255,255);//圖片不透明
  }
  if(changelevel_temp>=changelevel_imagetime && changelevel_temp<2*changelevel_imagetime){
    changelevel_temp++;
    tint(255,230);
  }
  if(changelevel_temp>=2*changelevel_imagetime && changelevel_temp<3*changelevel_imagetime){
    changelevel_temp++;
    tint(255,215);
  }
  if(changelevel_temp>=3*changelevel_imagetime && changelevel_temp<4*changelevel_imagetime){
    changelevel_temp++;
    tint(255,200);
  }
  if(changelevel_temp>=4*changelevel_imagetime && changelevel_temp<5*changelevel_imagetime){
    changelevel_temp++;
    tint(255,180);
  }
  if(changelevel_temp>=5*changelevel_imagetime && changelevel_temp<6*changelevel_imagetime){
    changelevel_temp++;
    tint(255,150);//幾近半透明
  }
  if(changelevel_temp>=6*changelevel_imagetime && changelevel_temp<7*changelevel_imagetime){
    changelevel_temp++;
    tint(255,120);
  }
  if(changelevel_temp>=7*changelevel_imagetime && changelevel_temp<8*changelevel_imagetime){
    changelevel_temp++;
    tint(255,90);//全透明
  }
  if(changelevel_temp>=8*changelevel_imagetime && changelevel_temp<9*changelevel_imagetime){
    changelevel_temp++;
    tint(255,60);//全透明
  }
  if(changelevel_temp>=9*changelevel_imagetime && changelevel_temp<10*changelevel_imagetime){
    changelevel_temp++;
    tint(255,30);//全透明
  }
  if(changelevel_temp>=10*changelevel_imagetime && changelevel_temp<11*changelevel_imagetime){
    changelevel_temp++;
    tint(255,0);//全透明
  }
}
