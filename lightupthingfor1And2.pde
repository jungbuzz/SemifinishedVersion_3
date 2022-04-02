//第一關及第二關點亮物動畫
void lightupthingFor1And2(PImage image1,PImage image2,PImage image3,int x,int y,int things_width, int things_height,int levelWhere,int which){
  lightupthing_temp[which]++;
  imageMode(CORNER);
  if(lightupthing_temp[which]<lightupthing_imagetime){
    image(image1,x,y,things_width,things_height);
  }
  if(lightupthing_temp[which]>=lightupthing_imagetime && lightupthing_temp[which]<2*lightupthing_imagetime){
    if(levelWhere==1){
      image(image2,x-things_width/12,y-2*things_height/13,7*things_width/6,15*things_height/13);
    }
    else{
      image(image2,x,y,things_width,things_height);
    }
  }
  if(lightupthing_temp[which]>=2*lightupthing_imagetime && lightupthing_temp[which]<3*lightupthing_imagetime){
      image(image3,x,y,things_width,things_height);
  }
  
  if(lightupthing_temp[which]>=3*lightupthing_imagetime){
    lightupthing_temp[which]=0;
  }
}
