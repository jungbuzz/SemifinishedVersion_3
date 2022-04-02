//第三關點亮物動畫
void lightupthingFor3(int x,int y,int things_width, int things_height,int which){
  int model_height,modely;
  lightupthing_temp[which]++;
  imageMode(CORNER);
  if(lightupthing_temp[which]<lightupthing_imagetime){
    model_height=53*things_height/53;//77/52為音樂盒高的修正比例
    
    image(img_musicboxcolor_1,x,y,things_width,model_height);
  }
  if(lightupthing_temp[which]>=lightupthing_imagetime && lightupthing_temp[which]<2*lightupthing_imagetime){
    model_height=77*things_height/53;//77/52為音樂盒高的修正比例
    modely=y-22*things_height/53;
    image(img_musicboxcolor_2,x,modely,things_width,model_height);
  }
  if(lightupthing_temp[which]>=2*lightupthing_imagetime && lightupthing_temp[which]<3*lightupthing_imagetime){
    model_height=79*things_height/53;//77/52為音樂盒高的修正比例
    modely=y-things_height/2;
    image(img_musicboxcolor_3,x,modely,things_width,model_height);
  }
  if(lightupthing_temp[which]>=3*lightupthing_imagetime && lightupthing_temp[which]<4*lightupthing_imagetime){
    model_height=81*things_height/53;//77/52為音樂盒高的修正比例
    modely=y-things_height/2;
    image(img_musicboxcolor_4,x,modely,things_width,model_height);
  }
  if(lightupthing_temp[which]>=4*lightupthing_imagetime && lightupthing_temp[which]<5*lightupthing_imagetime){
    model_height=81*things_height/53;//77/52為音樂盒高的修正比例
    modely=y-things_height/2;
    image(img_musicboxcolor_5,x,modely,things_width,model_height);
  }
  if(lightupthing_temp[which]>=5*lightupthing_imagetime && lightupthing_temp[which]<6*lightupthing_imagetime){
    model_height=81*things_height/53;//77/52為音樂盒高的修正比例
    modely=y-things_height/2;
    image(img_musicboxcolor_6,x,modely,things_width,model_height);
  }
  if(lightupthing_temp[which]>=6*lightupthing_imagetime && lightupthing_temp[which]<7*lightupthing_imagetime){
    model_height=81*things_height/53;//77/52為音樂盒高的修正比例
    modely=y-things_height/2;
    image(img_musicboxcolor_7,x,modely,things_width,model_height);
  }
  if(lightupthing_temp[which]>=7*lightupthing_imagetime){
    lightupthing_temp[which]=0;
  }
}
