void selectScreen(){
  imageMode(CORNER);
  background(img_talkbackground);
  imageMode(CENTER);
  image(img_level1screen,floor(mapSizex/6),levelscreeny,levelscreen_width,levelscreen_height);
  image(img_level2screen,mapSizex/2,levelscreeny,levelscreen_width,levelscreen_height);
  image(img_level3screen,mapSizex-floor(mapSizex/6),levelscreeny,levelscreen_width,levelscreen_height);
  image(img_level1btn,floor(mapSizex/6),levelbtny,levelbtn_width,levelbtn_height);
  image(img_level2btn,mapSizex/2,levelbtny,levelbtn_width,levelbtn_height);
  image(img_level3btn,mapSizex-floor(mapSizex/6),levelbtny,levelbtn_width,levelbtn_height);
  image(img_del,mapSizex-50,50,del_width,del_height);
}
