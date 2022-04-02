/*
撰寫者:40973007H 洪子鈞
參考網址:https://belleaya.pixnet.net/blog/post/31860741
此程式為一簡易小遊戲
具開始介面切至遊戲界面之功能，此遊戲目前僅作為移動小人(光點)及限制行動範圍之功能
目前移動小人(光點)是具有慣性的且具重力，也就是說並不會立刻停下，而是會逐漸減緩速度至停下
目前關閉之功能為計分數功能，及遊戲結束畫面之功能
                                                2021/10/20
已改為小人跳躍期末專題版
                                                2021/11/05
1.加了校正數
2.對邊界進行調整，對草地鋪製優化
3.關卡一背景製作基礎完成     
4.開始畫面雛形構成即開始按鈕之設置
                                                2021/11/06
1.添加第二個踩踏物，目前規劃y軸跳躍格擋
2.添加第三個踩踏物，目前規劃y軸跳躍格擋
3.添加雲朵透明度
4.統一圖片間隔時間為image_time
5.添加星星判定
6.關卡結束之判定及切換分數畫面
7.具重新開始功能(在分數頁面點擊畫面或按空白鍵)
                                                2021/11/07
1.整合了開頭對話
2.具對話後銜接第一關之功能
3.添加第二，三關，且只有在按下頁面才跳轉
4.添加測試關卡
5.將方塊之座標改為陣列
6.將星星座標改為陣列
7.修正角色正面圖片
                                                2021/11/08
1.將星星的存在值設為整數陣列(0為消失，1為存在)
2.添加星星總存在值(若為0，則意為所有星星消失)
3.將關卡結束判定內部星星存在值之元素改為星星總存在值
4.添加設定模式
5.添加選擇關卡功能
6.添加返回主選單功能
7.修正結局圖
                                                2021/11/09
1.添加關卡預告圖
2.修復按在第三關選擇按鈕與選擇關卡按鈕重複的區域，自動跳轉至第三關之bug
3.開頭對話人物之畫質修復
                                                2021/11/11
1.添加各方塊存在值設為整數陣列(0為不存在，1為存在)
2.添加各方塊寬及高的客製化，改設為整數陣列
3.縮小人物大小
                                                2021/11/14
1.修改對話第四周之文字錯誤(「玩家」改成「你」)
2.修改對話圖片順序，因為之前跳到對話框時會少出現第一張，直接跳到第二張
3.更改星星判定為按下空白鍵拾取
4.新增星星框，在拾取後會收集到框框裡
                                                2021/11/18
1.新增按下空白鍵進行蹲下動作
2.修正主畫面按鈕判斷時機
3.加入觸發隨機對話(有機率重複)
4.新增風箏
                                                2021/11/19
1.新增第二,三關的點亮物品
2.修改點亮物品的排版方式為CORNER
3.新增各物品寬及高的客製化功能
4.精簡化點亮物品判定的程式碼
5.新增故事簡介按鈕
                                                2021/11/21
1.修復結尾對話切換bug
2.修改主畫面點選按鈕bug(在分頁中能點選主畫面的按鈕)
3.新增變數最多星星數及最多點亮物品數
                                                2021/11/22
1.新增過場動畫
2.新增風箏及向日葵動畫
3.新增故事簡介及切換按鈕
                                                2021/11/26
1.新增變數最多方塊數
2.將程式拆分為個別標籤頁
3.完成各關卡編排
4.修改碰撞偵測中撞到時的反應
5.修改結局背景配置
6.修改關卡預告圖為最新版本
                                                2021/11/27
1.新增八音盒動畫
2.修改風箏及向日葵動畫
                                                2021/11/28
1.加入走路音效與主題曲(隨意選的)
2.加入音量及音效控制
                                                2021/12/02
1.加入所有配樂除音效外
2.加入網站連結功能
                                                2021/12/03
*/
/*以下為開頭對話及結尾對話之相關定義*/
int mapSizex=1024; //地圖x軸寬度
int mapSizey=768; //地圖y軸寬度
PImage img_talkbackground,board,boyhappy,cloud0,cloud2;//背景、對話框、主角、雲

int cloud0X = -100;//下面的雲x、y軸
int cloud0Y = 210;
int cloud2X = -850;//上面的雲x、y軸
int cloud2Y = -50;

int count = 0;//開頭切換板子內文字及是否跳至第一關
int endcount = 0;//結尾切換板子內文字及是否跳至與爸媽對話
int endcount2 =0;//結尾與爸媽對話切換對話文字及是否跳至顯示分數

/*以下為故事簡介相關定義*/
PImage img_story1,img_story2,img_story3,img_story4,img_forward,img_backward;
int story_order=1;//第幾頁
int order_width=60;//切換頁面按鈕寬
int order_height=93;//切換頁面按鈕高
String url1 = "https://www.fact.org.tw/";
String url2 = "https://www.kanner.org.tw/about.aspx?type=3";
String url3 = "https://www.facebook.com/TAFSAORG/";
float url1_x=mapSizex/2;
float url2_x=mapSizex/2;
float url3_x=mapSizex/2;
float url1_y=mapSizey/2-75;
float url2_y=mapSizey/2+62;
float url3_y=mapSizey/2+200;

/*以下為音樂之相關定義*/
import ddf.minim.*;
Minim minim;//宣告
AudioPlayer theme;//宣告
AudioPlayer introduction;//宣告
AudioPlayer talk;//宣告
AudioPlayer walk;//宣告
boolean theme_play=true;
boolean introduction_play=false;
boolean talk_play=false;
boolean walkMusic_play=false;
float volume_gain;//最大6.0207，建議最小-30
float soundeffect_gain;//最大6.0207，建議最小-30
boolean volume_mute=false;
boolean soundeffect_mute=false;

/*以下為測試關之基本定義*/
PImage img_testbackground,img_arrowkeys,img_btnpickup,img_btngo;
PImage img_btnset,img_del,img_setboard,img_home,img_volumeline,img_volumewhere,img_volumeBtnON,img_volumeBtnOFF,
       img_mute,img_maxvolume;//設定板相關圖片
int del_width=30;//del button之x
int del_height=30;//del button之y
int board_arrowx=50;
int board_arrowy=mapSizey/2-120;
int board_width=427;//提示板寬
int board_height=333;//提示板高
int board_pickupx=mapSizex-board_width-50;
int board_pickupy=mapSizey/2-120;
int go_width=215;//go button之x
int go_height=100;//go button之y
int btn_gox=mapSizex-go_width-50;
int btn_goy=mapSizey-go_height-50;
int set_width=35;//set button之x
int set_height=35;//set button之y
int btn_setx=mapSizex-set_width-50;
int btn_sety=50;
int boardset_width=502;//設定板寬
int boardset_height=600;//設定板高
int board_setx=mapSizex/2-boardset_width/2;
int board_sety=80;
int btn_delx=board_setx+boardset_width-50;
int btn_dely=board_sety+50;
int home_width=300;
int home_height=50;
int btn_homex=board_setx+(boardset_width-home_width)/2;
int btn_homey=board_sety+boardset_height-150;
int volumeline_width=150;
int volumeline_height=9;
int volume_linex=board_setx+boardset_width/2;
int volume_liney=board_sety+boardset_height/2-55;
int soundeffect_linex=board_setx+boardset_width/2;
int soundeffect_liney=board_sety+boardset_height/2+85;
int volumewhere_width=23;
int volumewhere_height=23;
int volume_wherex=volume_linex;//設為置中
int volume_wherey=volume_liney;
int soundeffect_wherex=soundeffect_linex;//設為置中
int soundeffect_wherey=soundeffect_liney;
int tempvolume_wherex;
int tempsoundeffect_wherex;
int maxX=volume_linex+volumeline_width/2-volumewhere_width/2;
int minX=volume_linex-volumeline_width/2+volumewhere_width/2;
int volumebtn_width=70;
int volumebtn_height=40;
int btn_volumex=board_setx+boardset_width-150;
int btn_volumey=board_sety+155;
int btn_soundeffectx=board_setx+boardset_width-150;
int btn_soundeffecty=board_sety+boardset_height/2-5;
int mute_width=35;
int mute_height=35;
int maxvolume_width=45;
int maxvolume_height=45;
int mute_x=board_setx+boardset_width/2-110;
int maxvolume_x=board_setx+boardset_width/2+130;

/*以下為操作人物之基本定義*/
int playerx=mapSizex/2,playery=0; //玩家位置
//int ball_diameter=8;
int person_width=73;//人寬原98
int person_height=90;//人高原121
int block_number=4;//方塊數
int maxblock_number=10;//最多方塊數
int []blockx=new int[maxblock_number];//各方塊x
int []blocky=new int[maxblock_number];//各方塊y
int []blockWidth=new int[maxblock_number];//方塊寬250
int []blockHeight=new int[maxblock_number];//方塊高61
int star_number=2;//星星數
int maxstar_number=5;//最多星星數
int []starx=new int[maxstar_number];//各星星x
int []stary=new int[maxstar_number];//各星星y
int starWidth=30;//星星寬
int starHeight=30;//星星高
int []starboxx=new int[maxstar_number];//各星星框x
int starboxy=80;//星星框y
int starboxWidth=80;//星星框寬
int starboxHeight=80;//星星框高
int things_number=2;//點亮物品數
int maxthings_number=5;//最多點亮物品數
int []thingsx=new int[maxthings_number];//各物品x
int []thingsy=new int[maxthings_number];//各物品y
int []thingsWidth=new int[maxthings_number];//物品寬:第一關57;第二關91;第三關79
int []thingsHeight=new int[maxthings_number];//物品高:第一關75;第二關143;第三關原43後78
int sideDistance=60;//邊界與螢幕間距
int maxXSide=mapSizex;//右邊界
int minXSide=0;//左邊界
int maxYSide=mapSizey-sideDistance;//下邊界
int minYSide=0;//上邊界

float ground_corrected_value=0.4*sideDistance+0.53;//校正踩踏草地與人物之間距
float personWidth_corrected_value=58*person_width/161;//校正人物對碰撞物的碰撞寬度，用在校正判斷何時從快上掉落

int maxWalkSpeed=5; //最大走速
float walkAccelx=0; //x走路加速度
float walkAccelxtmp=0; //x走路加速度temp
float walkSpeedx=0; //x初走速
/*float walkAccely=0; //y走路加速度
float walkAccelytmp=0; //y走路加速度temp
*/
float usualAccel=0.3;//基礎加速度值
float walkSpeedy=0; //y初走速
float jump_speed=14;//跳躍速度
float gravity=0.8;//重力
int temp;//人物動畫計數器

/*觸發對話*/
int recall_number=18;//對話數
String []recall=new String[recall_number];//各對話
int []select_recall=new int[maxthings_number];
boolean []select_whether=new boolean[maxthings_number];

/*主程式相關*/
PImage img_startbackground,img_level1background,img_level2background,img_level3background,img_grass,img_gameEnd;//背景及地面相關
PImage img_gamestartBtn,img_selectBtn,img_introduceBtn;//選單按鈕
PImage img_level1screen,img_level2screen,img_level3screen,img_level1btn,img_level2btn,img_level3btn;//關卡選擇
PImage bg_changelevel;//關卡過渡動畫
PImage img_cloudSlender1,img_cloudSlender2,img_cloudMiddle,//雲朵相關，不具碰撞，純粹裝飾
       img_cloudSlender1_rev,img_cloudSlender2_cut1,img_cloudSlender2_cut2,img_cloudShort,img_cloud_thick;
PImage img_starbox,img_star,img_windmillNocolor,img_windmillcolor_1,img_windmillcolor_2,img_windmillcolor_3,img_sunflowerNocolor,img_sunflowercolor_1,
       img_sunflowercolor_2,img_sunflowercolor_3,img_musicboxNocolor,img_musicboxcolor_1,img_musicboxcolor_2,img_musicboxcolor_3,img_musicboxcolor_4,
       img_musicboxcolor_5,img_musicboxcolor_6,img_musicboxcolor_7;//星星框，星星及點亮物品
PImage img_left0, img_left1, img_left2,img_leftJump,//人物相關
       img_right0, img_right1, img_right2,img_rightJump,
       img_stop, img_squatdown;
PImage img_parentstalkbackground,parentstalk;//結尾與爸媽對話之背景

int changelevel_temp=0;//關卡過渡計數器
int changelevel_imagetime=5;//關卡圖片間隔時間
int image_time=10;//圖片切換間隔時間
int levelscreen_width=307;//關卡截圖寬
int levelscreen_height=230;//關卡截圖高
int levelbtn_width=250;//關卡按鈕寬
int levelbtn_height=70;//關卡按鈕高
int levelscreeny=floor(5*mapSizey/12);
int levelbtny=levelscreeny+levelscreen_height/2+levelbtn_height/2+30;
int []lightupthing_temp=new int[maxthings_number];//點亮物動畫計數器
int lightupthing_imagetime=15;//點亮物動畫圖片切換間隔時間

//以下為與爸媽對話之對話框位置之設定
int parentstalk_x1 = 30;
int parentstalk_y1 = 140;
int parentstalk_width = 300;

PFont font;//文字形式

boolean setscreen=false;//是否開啟設定
boolean selectscreen=false;//是否選擇關卡
boolean introducescreen=false;//是否看故事簡介
boolean gametalk=false;//開頭對話
boolean endgametalk=false;//結尾對話
boolean endgameparentstalk=false;//結尾爸媽對話
boolean testlevel=false;//測試關開始沒
boolean testtolevel1=false;//測試到一
boolean gamelevel1=false; //第一關開始沒
boolean level1to2=false;//一到二
boolean gamelevel2=false; //第二關開始沒
boolean level2to3=false;//二到三
boolean gamelevel3=false; //第三關開始沒
boolean level3toEnd=false;//三到結尾
boolean squatdown=false;//是否蹲下
int []block_visible=new int[maxblock_number];//各方塊是否出現 : 1 為出現 ， 0為消失
int []star_visible=new int[maxstar_number];//各星星是否出現 : 1 為出現 ， 0為消失
int []things_visible=new int[maxthings_number];//各物品是否點亮 : 0 為點亮 ， 1為暗
int allstar_exist=0;//所有星星是否消失
int allthings_bright=things_number;//所有物品是否點亮
boolean gameclear=false; //與爸媽對話結束沒，結束接得分畫面
int score=0; //得分
int level_where=0;//第幾關: 0為主畫面，1為選擇關卡，2為故事簡介，3為測試關，4為第一關，以此類推

void setup() {
  size(1024, 768);//注意:不可用變數定義size內的數值
  font = createFont("NotoSansTC-Regular.otf",32);
  textFont(font);
  //背景
  img_startbackground=loadImage("bg_mainScreen.png");
  imageMode(CORNER);
  image(img_startbackground,0,0,mapSizex,mapSizey);
  frameRate(60);
  
  //選單按鈕
  img_gamestartBtn=loadImage("bg_ButtonGameStart.png");
  img_selectBtn=loadImage("bg_ButtonSelect level.png");
  img_introduceBtn=loadImage("bg_ButtonStory.png");
  
  //關卡選擇相關
  img_level1screen=loadImage("pic_level1.png");
  img_level2screen=loadImage("pic_level2.png");
  img_level3screen=loadImage("pic_level3.png");
  img_level1btn=loadImage("bg_level1btn.png");
  img_level2btn=loadImage("bg_level2btn.png");
  img_level3btn=loadImage("bg_level3btn.png");
  
  //故事簡介相關
  img_story1=loadImage("bg_story01.png");
  img_story2=loadImage("bg_story02.png");
  img_story3=loadImage("bg_story03.png");
  img_story4=loadImage("bg_story04.png");
  img_forward=loadImage("bg_forward.png");
  img_backward=loadImage("bg_backward.png");
  story_order=1;
  
  /*開頭對話*/
  img_talkbackground = loadImage("bg_firstdialog.png");
  boyhappy = loadImage("ch_Frontview02_big.png");
  board = loadImage("bg_dialog1.png");
  cloud0= loadImage("bg_DLcloud.png");
  cloud2= loadImage("bg_DLcloud2.png");
  
  /*結尾爸媽對話*/
  img_parentstalkbackground = loadImage("bg_end_dialog6.png");
  parentstalk = loadImage("bg_end_dialog7.png");
   
  /*音樂*/
  minim = new Minim(this);
  theme= minim.loadFile("mus_Twinkle Twinkle Little Star (instrumental).mp3");
  introduction= minim.loadFile("mus_The Bluest Star.mp3");
  talk= minim.loadFile("mus_Dancing Star.mp3");
  walk = minim.loadFile("running_on_the_gravel.mp3");
  
  /*操作測試關卡*/
  img_testbackground=loadImage("bg_test.png");
  img_arrowkeys=loadImage("bg_ButtonArrowkeys.png");
  img_btnpickup=loadImage("bg_ButtonPickup.png");
  img_btngo=loadImage("bg_ButtonGo.png");
  img_btnset=loadImage("bg_ButtonSet.png");
  img_setboard=loadImage("bg_setupbox.png");
  img_del=loadImage("bg_ButtonDel.png");
  img_home=loadImage("bg_ButtonHome.png");
  img_volumeline=loadImage("bg_ButtonLine.png");
  img_volumewhere=loadImage("bg_ButtonPoint.png");
  img_volumeBtnON=loadImage("bg_ButtonON.png");
  img_volumeBtnOFF=loadImage("bg_ButtonOFF.png");
  img_mute=loadImage("bg_ButtonMute.png");
  img_maxvolume=loadImage("bg_ButtonAudio.png");
  
  /*遊戲關卡相關*/
  //觸發對話
  recall[0]="謝.......謝......";
  recall[1]="書.......字......飄飄";
  recall[2]="嗯......嗯......嗯";
  recall[3]="我.....我不明白";
  recall[4]="......";
  recall[5]="一閃......一閃......亮";
  recall[6]="ㄉ…...ㄅ…...ㄑ";
  recall[7]="請再......再教教我";
  recall[8]="我......我可以學會的";
  recall[9]="好起來.....全部都會好起來";
  recall[10]="相......相信你";
  recall[11]="我也希望......我是天才";
  recall[12]="我想看著你的眼睛説話";
  recall[13]="請等我......長大，我會長大的......";
  recall[14]="我ㄞ你";
  recall[15]="聽......聽得見我説話嗎？";
  recall[16]="想告訴你，喜歡你";
  recall[17]="我也......很認真地活著";
  
  //場地相關
  img_level1background=loadImage("bg_ingame.png");
  img_level2background=loadImage("bg_two.png");
  img_level3background=loadImage("bg_three.png");
  img_grass=loadImage("bg_grassland.png");
  img_gameEnd=loadImage("bg_END.png");
  
  //星星框，星星及點亮物品
  img_starbox=loadImage("bg_coverstarbox.png");
  img_star=loadImage("it_star002.png");
  img_windmillNocolor=loadImage("bg_LuckyLittleWindmill(Large).png");
  img_windmillcolor_1=loadImage("bg_Luckylittlewindmill(color).png");
  img_windmillcolor_2=loadImage("bg_windmill turn.png");
  img_windmillcolor_3=loadImage("bg_windmill turn02.png");
  img_sunflowerNocolor=loadImage("bg_Sunflowerinavase (large).png");
  img_sunflowercolor_1=loadImage("bg_Sunflowerinavase (color).png");
  img_sunflowercolor_2=loadImage("bg_Sunflowerinavase (color)_01.png");
  img_sunflowercolor_3=loadImage("bg_Sunflowerinavase (color)_02.png");
  img_musicboxNocolor=loadImage("bg_HopeMusicBox(small).png");
  img_musicboxcolor_1=loadImage("bg_HopeMusicBox-(color).png");
  img_musicboxcolor_2=loadImage("bg_HopeMusicBox-(color)_02.png");
  img_musicboxcolor_3=loadImage("bg_HopeMusicBox-(color)_03.png");
  img_musicboxcolor_4=loadImage("bg_HopeMusicBox-(color)_04.png");
  img_musicboxcolor_5=loadImage("bg_HopeMusicBox-(color)_05.png");
  img_musicboxcolor_6=loadImage("bg_HopeMusicBox-(color)_06.png");
  img_musicboxcolor_7=loadImage("bg_HopeMusicBox-(color)_07.png");
  
  //雲朵相關
  img_cloudSlender1=loadImage("bg_Cloud Slender001.png");
  img_cloudSlender1_rev=loadImage("bg_Cloud Slender001_rev.png");
  img_cloudSlender2=loadImage("bg_Cloud Slender002.png");
  img_cloudSlender2_cut1=loadImage("bg_Cloud Cut1of002.png");
  img_cloudSlender2_cut2=loadImage("bg_Cloud Cut2of002.png");
  img_cloudMiddle=loadImage("bg_CloudMiddle.png");
  img_cloudShort=loadImage("bg_CloudShort.png");
  img_cloud_thick=loadImage("bg_CloudThick.png");
  
  //人物相關
  img_stop=loadImage("ch_45-degreeangle01.png");
  img_left0=loadImage("ch_leftSideview01.png");
  img_left1=loadImage("ch_leftWalk01.png");
  img_left2=loadImage("ch_leftWalk01_2.png");
  img_leftJump=loadImage("ch_leftJump01.png");
  img_right0=loadImage("ch_rightSideview01.png");
  img_right1=loadImage("ch_rightWalk01.png");
  img_right2=loadImage("ch_rightWalk01_2.png");
  img_rightJump=loadImage("ch_rightJump01.png");
  img_squatdown=loadImage("ch_down01.png");
  
  //人物起始位置
  playerx=floor(mapSizex/6);
  playery=mapSizey-sideDistance-person_height/2;
  
  //先重置設定，防止重新遊戲時人物亂動
  walkSpeedx=0;
  walkSpeedy=0;
  walkAccelx=0;
  walkAccelxtmp=0;
  squatdown=false;
  /*方便測試用，不刪
  playerx=blockCx;
  playery=blockCy-blockHeight/2-sideDistance-person_height/2;
  */
  //方塊都存在
  for(int i=0;i<maxblock_number;i++){
    block_visible[i]=1;
  }
  //星星存在
  for(int i=0;i<maxstar_number;i++){
    star_visible[i]=1;
  }
  //物品維持暗
  for(int i=0;i<maxthings_number;i++){
    things_visible[i]=1;
  }
  //對話是否選擇為否
  for(int i=0;i<maxthings_number;i++){
    select_whether[i]=false;
  }
  //設置關卡過渡計數器為0
  changelevel_temp=0;
}
void draw() {
  /*以下為音樂控制*/
  /*主畫面與分數顯示*/
  if(theme_play){
    if(!theme.isPlaying()){
      theme.rewind();
      theme.play();
    }
  }
  else{
    theme.pause();
  }
  /*故事簡介*/
  if(introduction_play){
    if(!introduction.isPlaying()){
      introduction.rewind();
      introduction.play();
    }
  }
  else{
    introduction.pause();
  }
  /*對話*/
  if(talk_play){
    if(!talk.isPlaying()){
      talk.rewind();
      talk.play();
    }
  }
  else{
    talk.pause();
  }
  /*走路音效*/
  if(walkMusic_play){
    if(!walk.isPlaying()){
      walk.rewind();
      walk.play();
    }
  }
  else{
    walk.pause();
  }
  volume_gain=map(volume_wherex,minX,maxX,-30,6.0207);
  soundeffect_gain=map(soundeffect_wherex,minX,maxX,-30,6.0207);
  theme.setGain(volume_gain);
  introduction.setGain(volume_gain);
  talk.setGain(volume_gain);
  walk.setGain(soundeffect_gain);
  //到此為止
  if(gametalk){
    theme_play=false;
    talk_play=true;
    gameTalk();
  }
  else if(endgametalk==true){
    theme_play=false;
    talk_play=true;
    gameTalk();
  }
  else if(endgameparentstalk==true){
    theme_play=false;
    talk_play=true;
    EndgameTalk();
  }
  else if(testlevel){
    temp++;
    talk_play=false;
    theme_play=true;
    testLevel();
    update();
    //debug
    println("playerx="+playerx+", playery="+playery+", walkSpeedx="+walkSpeedx+", walkSpeedy="+walkSpeedy+", gravity="+gravity+", score="+score+", level_where="+level_where); //到時候可以刪除
  }
  else if(gamelevel1==true && gamelevel2==false && gamelevel3==false){
    if(changelevel_temp<8*changelevel_imagetime){
      bg_changelevel=loadImage("bg_changelevel_1.png");
      changeLevel();
      theme_play=false;
    }
    else{
      temp++;
      theme_play=true;
      gameLevel1();
      update();
      //debug
      println("playerx="+playerx+", playery="+playery+", walkSpeedx="+walkSpeedx+", walkSpeedy="+walkSpeedy+", gravity="+gravity+", score="+score+", allstar_exist="+allstar_exist+", allthings_bright="+allthings_bright+", level_where="+level_where); //到時候可以刪除
    }
  }
  else if(gamelevel1==false && gamelevel2==true && gamelevel3==false){
    if(changelevel_temp<8*changelevel_imagetime){
      bg_changelevel=loadImage("bg_changelevel_2.png");
      changeLevel();
      theme_play=false;
    }
    else{
      temp++;
      theme_play=true;
      gameLevel2();
      update();
      //debug
      println("playerx="+playerx+", playery="+playery+", walkSpeedx="+walkSpeedx+", walkSpeedy="+walkSpeedy+", gravity="+gravity+", score="+score+", allstar_exist="+allstar_exist+", allthings_bright="+allthings_bright+", level_where="+level_where); //到時候可以刪除
    }
  }
  else if(gamelevel1==false && gamelevel2==false && gamelevel3==true){
    if(changelevel_temp<8*changelevel_imagetime){
      bg_changelevel=loadImage("bg_changelevel_3.png");
      changeLevel();
      theme_play=false;
    }
    else{
      temp++;
      theme_play=true;
      gameLevel3();
      update();
      //debug
      println("playerx="+playerx+", playery="+playery+", walkSpeedx="+walkSpeedx+", walkSpeedy="+walkSpeedy+", gravity="+gravity+", score="+score+", allstar_exist="+allstar_exist+", allthings_bright="+allthings_bright+", level_where="+level_where); //到時候可以刪除
    }
  }
  else if(gameclear==true){
    talk_play=false;
    theme_play=true;
    scoreShow();
    //debug
    println("score="+score+", allstar_exist="+allstar_exist+", allthings_bright="+allthings_bright+", level_where="+level_where); //到時候可以刪除
  }
  else{
    /*textSize(20);
    fill(250,160,0);
    text("Click to Start!",floor(2*mapSizex/5),floor(mapSizey/2));
    */
    imageMode(CENTER);
    image(img_gamestartBtn,floor(5*mapSizex/7),floor(mapSizey/3),300,100);
    image(img_selectBtn,floor(5*mapSizex/7),floor(mapSizey/3)+150,300,100);
    image(img_introduceBtn,floor(5*mapSizex/7),floor(mapSizey/3)+300,300,100);
  }
  if(level1to2){
    theme_play=false;
    gameLevel1();
    //設定按鈕
    imageMode(CORNER);
    image(img_btnset,btn_setx,btn_sety,set_width,set_height);
    //人物靜止於原地
    imageMode(CENTER);
    image(img_stop,playerx,playery+ground_corrected_value,person_width,person_height);
    imageMode(CORNER);
    image(img_btngo,btn_gox,btn_goy,go_width,go_height);
  }
  else if(level2to3){
    theme_play=false;
    gameLevel2();
    //設定按鈕
    imageMode(CORNER);
    image(img_btnset,btn_setx,btn_sety,set_width,set_height);
    //人物靜止於原地
    imageMode(CENTER);
    image(img_stop,playerx,playery+ground_corrected_value,person_width,person_height);
    imageMode(CORNER);
    image(img_btngo,btn_gox,btn_goy,go_width,go_height);
  }
  else if(level3toEnd){
    theme_play=false;
    gameLevel3();
    //設定按鈕
    imageMode(CORNER);
    image(img_btnset,btn_setx,btn_sety,set_width,set_height);
    //人物靜止於原地
    imageMode(CENTER);
    image(img_stop,playerx,playery+ground_corrected_value,person_width,person_height);
    imageMode(CORNER);
    image(img_btngo,btn_gox,btn_goy,go_width,go_height);
  }
  if(setscreen){
    setScreen();
    if(mousePressed && volume_mute==false){
      if(mouseX >= minX && mouseX <=maxX  && mouseY >= volume_wherey-volumewhere_height/2 && mouseY <= volume_wherey+volumewhere_height/2){
        volume_wherex=mouseX;
      }
      if(mouseX>maxX && mouseX <=maxvolume_x+maxvolume_width/2 && mouseY >= volume_wherey-volumewhere_height/2 && mouseY <= volume_wherey+volumewhere_height/2){
        volume_wherex=maxX;
      }
      if(mouseX<minX && mouseX >=mute_x-mute_width/2 && mouseY >= volume_wherey-volumewhere_height/2 && mouseY <= volume_wherey+volumewhere_height/2){
        volume_wherex=minX;
      }
    }
    if(mousePressed && soundeffect_mute==false){
      if(mouseX >= minX && mouseX <=maxX  && mouseY >= soundeffect_wherey-volumewhere_height/2 && mouseY <= soundeffect_wherey+volumewhere_height/2){
        soundeffect_wherex=mouseX;
      }
      if(mouseX>maxX && mouseX <=maxvolume_x+maxvolume_width/2 && mouseY >= soundeffect_wherey-volumewhere_height/2 && mouseY <= soundeffect_wherey+volumewhere_height/2){
        soundeffect_wherex=maxX;
      }
      if(mouseX<minX && mouseX >=mute_x-mute_width/2 && mouseY >= soundeffect_wherey-volumewhere_height/2 && mouseY <= soundeffect_wherey+volumewhere_height/2){
        soundeffect_wherex=minX;
      }
    }
    if(volume_wherex==minX){
      theme.mute();
      introduction.mute();
      talk.mute();
    }
    else{
      if(!volume_mute){
        theme.unmute();
        introduction.unmute();
        talk.unmute();
      }
    }
    if(soundeffect_wherex==minX){
      walk.mute();
    }
    else{
      if(!soundeffect_mute){
        walk.unmute();
      }
    }
  }
  if(selectscreen){
    selectScreen();
  }
  if(introducescreen){
    theme_play=false;
    introduction_play=true;
    introduceScreen();
    if(story_order==4 && ((mouseX>url1_x-88 && mouseX<url1_x+88 && mouseY>url1_y-15/2 && mouseY<url1_y+15/2)||(mouseX>url2_x-123 && mouseX<url2_x+123 && mouseY>url2_y-15/2 && mouseY<url2_y+15/2)||(mouseX>url3_x-130 && mouseX<url3_x+130 && mouseY>url3_y-15/2 && mouseY<url3_y+15/2))){
      cursor(HAND);
    }
    else{
      cursor(ARROW);
    }
  }
}
