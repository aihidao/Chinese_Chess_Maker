# 毕业设计：Chinese_Chess_Maker

Chinese Chess Maker 是我一直以来的一个想法，让玩家编辑棋盘和棋谱。进行象棋对战。
我觉得许多成功的电子游戏成功都离不开玩家的创造。
例如，早期的坦克大战地图建造模式，和现代的魔兽争霸3的地图编辑器。如果没有地图编辑器，这两个游戏一定会流失不少玩家。
然而，作为计算机时代的象棋游戏，大多数开发者都只对象棋进行了传统的复刻，缺少了电子游戏的天然优势 - 玩家的创造性。

所以当初写下这个工程是为了让玩家可以自由的创建各种样式的象棋棋谱。以及想象出更多的象棋游戏模式。来增加象棋的趣味性。
不过直到毕业这个工程也只完成了80%。不过幸好可以进行各种演示成功的让我毕了业。

这个工程是用gamemaker studio写的，目前已经放弃了，因为当初自己水平太次。无法完美架构出自己想要的所有功能。而且bug众多。
后来在工作学习中，使用各种方法写过几个重要功能。都只是作为独立功能测试自己的想法。

打算等到自己闲下来，用QT写一遍。

（但是以上代码均可进行编译，以及玩家对战，可能需要一些调试。还有不完善的功能，以及游戏不能判定游戏结束。等闲下来写QT版本把。）

一、主界面

![](/CCM.gmx/CCMDemoPIC/01_Menu.png "例子展示")

二、棋谱编辑

棋谱编辑是这款象棋游戏的亮点，玩家可以任意编辑棋谱。用以实现更有趣的象棋棋盘。

选择棋谱属性

![](/CCM.gmx/CCMDemoPIC/02_EditorSetting.png "选择棋谱属性")

棋谱编辑

![](/CCM.gmx/CCMDemoPIC/04EditorShow.png "棋谱编辑")

三、联机游戏

玩家可以选择创建游戏，也可以选择加入别人的游戏，创建游戏要选择游戏地图（所有编辑过的地图都会显示出来，而加入则需要玩家输入玩家IP）

![](/CCM.gmx/CCMDemoPIC/05NETSHOW.png "创建与加入")

![](/CCM.gmx/CCMDemoPIC/10NETSHOW_SelectMap.png "选择地图")

![](/CCM.gmx/CCMDemoPIC/06NETSHOW_Wait.png "地图等待")

![](/CCM.gmx/CCMDemoPIC/08NETSHOW_Join.png "多玩家等待")

![](/CCM.gmx/CCMDemoPIC/09NETSHOW_Big.png "高分辨率")


![](/CCM.gmx/CCMDemoPIC/09NETSHOW_Play.png "低分辨率")

以上视角移动均通过 WASD


