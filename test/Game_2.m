classdef Game_2 < handle
    properties
        farmer
        landlord
        player1cardlist
        player2cardlist
        player3cardlist
        landlordcard 
        winner
        PlayOrNotPlay
        Process
        CurrentRoundStarter
        lastplayerhand 
        lastlastplayerhand
        endofthegame
        currentplayer
        currentplayerui 
    end
    
    methods (Access = public)
        function startgame(game,process)
            [player1card,player2card,player3card,landlord_card] = game.cardshuffle();
            player1card = ["3";"3";"4";"4";"7";
                "8";"10";"J";"Q";"Q";
                "K";"K";"K";"A";"A";"A";"大王"];
            player2card = ["3";"3";"5";"5";"5";
                "5";"7";"7";"8";"8";
                "9";"9";"10";"J";"Q";"A";"2";];
            player3card = ["4";"4";"6";"6";"6";
           "6";"7";"8";"9";"9";
           "10";"10";"J";"J";"Q";"2";"2"];
            landlord_card = ["K";
           "2";"小王"];
            process.displayMessageToAll(sprintf('游戏开始了，玩的开心！！！'))
            
            game.player1cardlist = player1card;
            numplayer1cardlist = strlist2numberlist(player1card);
            process.player1App.CardInitialize(numplayer1cardlist);
            
            game.player2cardlist = player2card;
            numplayer2cardlist = strlist2numberlist(player2card);
            process.player2App.CardInitialize(numplayer2cardlist);
            
            game.player3cardlist = player3card;
            numplayer3cardlist = strlist2numberlist(player3card);
            process.player3App.CardInitialize(numplayer3cardlist);
            
            game.landlordcard = landlord_card;
            
            rand = randperm(3);
%             game.landlord = rand(1);
%             game.farmer = rand(2:3); 
            game.landlord = 1;
            game.farmer = [2,3];
            game.isLandlord(1,process); 
%             starter = game.landlord;
%             player1App = eval("process.player" + game.landlord+ "App");
%             next = game.NextPlayer(game.landlord);
%             player2App = eval("process.player" + next + "App");
%             next2 = game.NextPlayer(next);
%             player3App = eval("process.player" + next2 + "App");
%             
%             process.displayMessageTo(starter,sprintf('请选择是否成为地主'));
%             player1App.ChooseLandlordOptionOn();
%             waitfor(player1App,'ChooseLandlordEnd');
% 
%             process.displayMessageTo(next,sprintf('请选择是否成为地主'));
%             player2App.ChooseLandlordOptionOn();
%             waitfor(player2App,'ChooseLandlordEnd');
%             
%             process.displayMessageTo(next2,sprintf('请选择是否成为地主'));
%             player3App.ChooseLandlordOptionOn();
%             waitfor(player3App,'ChooseLandlordEnd');
%             
%             player1App.islandlord 
%             player2App.islandlord 
%             player3App.islandlord
%             
%             if player1App.islandlord == true && player2App.islandlord == false && player3App.islandlord == false
%                 game.isLandlord(starter,process);
%             elseif player1App.islandlord == true && player2App.islandlord == true && player3App.islandlord == false
%                 player1App.islandlord = false;
%                 player2App.islandlord = false;
%                 player3App.islandlord = false;
%                 process.displayMessageTo(starter,sprintf('请选择是否继续抢地主'));
%                 player1App.ChooseLandlordOptionOn();                     
%                 waitfor(player1App,'ChooseLandlordEnd');
%                 if player1App.islandlord == true
%                     game.isLandlord(starter,process);
%                 elseif player1App.islandlord == false
%                     game.isLandlord(next,process); 
%                 end
%                 
%             elseif player1App.islandlord == true && player2App.islandlord == false && player3App.islandlord == true
%                 player1App.islandlord = false;
%                 player2App.islandlord = false;
%                 player3App.islandlord = false;
%                 process.displayMessageTo(starter,sprintf('请选择是否继续抢地主'));
%                 player1App.ChooseLandlordOptionOn();                     
%                 waitfor(player1App,'ChooseLandlordEnd');
%                 if player1App.islandlord == true
%                     game.isLandlord(starter,process);
%                 elseif player1App.islandlord == false
%                     game.isLandlord(next2,process);
%                 end        
%                 
%             elseif player1App.islandlord == true && player2App.islandlord == true && player3App.islandlord == true
%               
%                 player1App.islandlord = false;
%                 player2App.islandlord = false;
%                 player3App.islandlord = false;
%                 process.displayMessageTo(starter,sprintf('请选择是否继续抢地主'));
%                 player1App.ChooseLandlordOptionOn();                     
%                 waitfor(player1App,'ChooseLandlordEnd');
%                 if player1App.islandlord == true
%                     game.isLandlord(starter,process);
%                 elseif player1App.islandlord == false
%                     process.displayMessageTo(next,sprintf('请选择是否继续抢地主'));
%                     player2App.ChooseLandlordOptionOn();                     
%                     waitfor(player2App,'ChooseLandlordEnd');
%                     if player2App.islandlord == true
%                         game.isLandlord(next,process);
%                     elseif player2App.islandlord == false
%                         game.isLandlord(next2,process);
%                     end
%                 end  
%             elseif player1App.islandlord == false && player2App.islandlord == true &&  player3App.islandlord == false
%               
%                 game.isLandlord(next,process);                
%             elseif player1App.islandlord == false && player2App.islandlord == false && player3App.islandlord == true
%                
%                 game.isLandlord(next2,process);         
% 
%             elseif player1App.islandlord == false && player2App.islandlord == true && player3App.islandlord == true
%               
%                 player1App.islandlord = false;
%                 player2App.islandlord = false;
%                 player3App.islandlord = false;
% 
%                 process.displayMessageTo(next,sprintf('请选择是否继续抢地主'));
%                 player2App.ChooseLandlordOptionOn();                     
% 
%                 waitfor(player2App,'ChooseLandlordEnd');
%                 if player2App.islandlord == true
%                     game.isLandlord(next,process);
%                 elseif player2App.islandlord == false
%                     game.isLandlord(next2,process);
%                 end   
%                 
%             elseif player1App.islandlord == false && player2App.islandlord == false && player3App.islandlord == false
%                 
%                 game.isLandlord(starter,process);
%             end 
        end
        
        function playgame_firstroundstart(game)
            game.endofthegame = false;
            game.CurrentRoundStarter = game.landlord;    
        end
        function playgame_roundstart(game,process)
            game.lastplayerhand = [];
            game.lastlastplayerhand = [];
            game.PlayOrNotPlay = [1;1;1];
            firstplayer = game.CurrentRoundStarter;
            firstplayerUI = eval('process.player'+string(firstplayer) + 'App');
            firstplayerUI.RoundStarter = true;
            game.currentplayer = firstplayer;
            game.currentplayerui = firstplayerUI;
            game.playgame_playerplayOptionOn(game.currentplayerui);
        end
        function playgame_playerplayOptionOn(game,playerui)
            if playerui.RoundStarter == true
                playerui.OnlyPlaytheHandOptionOn();
            else
                RealLastCardNum1 = game.GetLastCardList(xx,yy);
                playerui.LastCardList = RealLastCardNum1;
                playerui.PlaytheHandOptionOn();
            end
        end
        function PlaytheHand_post(game,process,currentplayer,currentplayerui)
            if currentplayerui.RoundStarter == true
                currentplayerui.RoundStarter = false;
            end
            game.UpdatePlayOrNotPlay(currentplayerui.ChoosePlayTheHand);
            LastCardNum = currentplayerui.ChoosedCardNum;
            game.lastlastplayerhand = game.lastplayerhand;
            game.lastplayerhand = LastCardNum;

            % 在ui界面上展示 出了什么牌
            LastCardStr = numberlist2strlist(LastCardNum);
            process.displayHandMessage(currentplayer,LastCardStr);

            % 统计currentplayer还剩多少张牌 并更新game 中的数据
            RemainCardNum = currentplayerui.GetRemainCardNum();
            process.displayUpdateRemain(currentplayer,length(RemainCardNum));
            % 如果remaincardnum的长度为0 说明currentplayer已经出完了牌 游戏结束
            if  game.CheckEndOfGame(RemainCardNum)
                game.endofthegame = true;
                game.winner = currentplayer;
                game.wingame(game.Process);
                return;
            end
            % 计算是不是一个round已经结束了
            if game.RoundEnd()
                game.CurrentRoundStarter = game.FindCurrentRoundStarter(currentplayer);
                game.playgame_roundstart(game.Process);
                return;
            end
            % 下家出牌前的部署
            nextplayer = game.NextPlayer(currentplayer);
            nextplayerUI = eval('process.player'+string(nextplayer) + 'App');
            nextplayerUI.RoundStarter = false;
        %                     ChoosedCardNum 是在点完确认出牌之后，才统计的，所以哪怕玩家把牌点起来了但是最后
        %                     选择不出牌，ChoosedCardNum会是空的
            nextplayerUI.ChoosedCardNum = [];
            RealLastCardNum = game.GetLastCardList(game.lastlastplayerhand,game.lastplayerhand);
            nextplayerUI.LastCardList = RealLastCardNum;
            nextplayerUI.PlaytheHandOptionOn();
            game.currentplayer = nextplayer;
            game.currentplayerui = nextplayerUI;
        end
        function isLandlord(game,player,process)
                player = 1;
                theorder = "game.landlord = " + string(player) + ";" + "game.player" + string(player) + "cardlist = [game.player" + string(player) + "cardlist;game.landlordcard];";
                eval(theorder);
                ll = eval('process.player' + string(player)+'App');
                card1 = eval("game.player" + string(player) + "cardlist");
                card2 = strlist2numberlist(card1);
                ll.CardInitialize(card2);
                next = game.NextPlayer(player);
                next2 = game.NextPlayer(next);
                nextUI = eval('process.player' + string(next)+'App');
                next2UI = eval('process.player' + string(next2)+'App');
                ll.Image.ImageSource = 'dizhu.jpg';
                nextUI.Image_2.ImageSource = 'dizhu.jpg';
                next2UI.Image_3.ImageSource = 'dizhu.jpg';
                process.displayMessageInPlayer1App(sprintf(char("地主是"+string(player))));
                process.displayMessageInPlayer2App(sprintf(char("地主是"+string(player))));
                process.displayMessageInPlayer3App(sprintf(char("地主是"+string(player))));
                landlordcardstring = '地主牌是' + string(game.landlordcard(1)) +' '+ string(game.landlordcard(2))+' '+ string(game.landlordcard(3));
                process.displayMessageInPlayer1App(sprintf(char(landlordcardstring)));
                process.displayMessageInPlayer2App(sprintf(char(landlordcardstring)));
                process.displayMessageInPlayer3App(sprintf(char(landlordcardstring)));
                game.Process.displayLandlordAndFamer(game.landlord);
%                game.player1cardlist
%                game.player2cardlist
%                game.player3cardlist
        end
        function [player1card,player2card,player3card,landlord_card] = cardshuffle(game)
%             allcard = GenerateAllCard();
            allcard = ["2";"2";"2";"2";
                       "3";"3";"3";"3";
                       "4";"4";"4";"4";
                       "5";"5";"5";"5";
                       "6";"6";"6";"6";
                       "7";"7";"7";"7";
                       "8";"8";"8";"8";
                       "9";"9";"9";"9";
                       "10";"10";"10";"10";
                       "J";"J";"J";"J";
                       "Q";"Q";"Q";"Q";
                       "K";"K";"K";"K";
                       "A";"A";"A";"A";
                       "大王";"小王"];
            shufflecardstr = allcard(randperm(length(allcard)));
   
            
            length(shufflecardstr)
            player1card = shufflecardstr(1:17);
            player2card = shufflecardstr(18:34);
            player3card = shufflecardstr(35:51);
            landlord_card = shufflecardstr(52:54);
        end     
        function RealLastCardNum = GetLastCardList(game,xx,yy)
            RealLastCardNum = [];
            if isempty(yy)
                RealLastCardNum = xx;
            else
                RealLastCardNum = yy;
            end
        end
        function result = FindCurrentRoundStarter(game,player)
            result = 0;
            if player == 1
                result = 2;
            elseif player ==2 
                result = 3;
            elseif player ==3
                result = 1;
            end
        end
        function UpdatePlayOrNotPlay(game,state)
            if state == 1 
                game.PlayOrNotPlay = [1;1;1];
            else
                if game.PlayOrNotPlay(1) == 1 && game.PlayOrNotPlay(2) == 1 && game.PlayOrNotPlay(3) == 1
                    game.PlayOrNotPlay = [1;0;1];
                elseif  game.PlayOrNotPlay(1) == 1 && game.PlayOrNotPlay(2) == 0 && game.PlayOrNotPlay(3) == 1
                    game.PlayOrNotPlay = [1;0;0];
                end
            end
        end  
        function result = NextPlayer(game,current)
            result = 0;
            if current == 3
                result = 1;
            else
                result = current + 1;
            end
        end
        function result = RoundEnd(game)
            result = false;
            if game.PlayOrNotPlay(1) == 1 && game.PlayOrNotPlay(2) == 0 && game.PlayOrNotPlay(3) ==0
                result = true;
            end
        end
        function result = CheckEndOfGame(~,RemainCardNum)
            result = false;
            if isempty(RemainCardNum)
                result = true;
            end
        end
        function wingame(game,process)
            if game.winner == game.landlord
                str = "地主(player" + string(game.winner) + ") 赢得了比赛 祝贺！";
                process.displayMessageToAll(char(str));
            else
                str = "农民(player" + string(game.farmer(1)) + " player"+ string(game.farmer(2))+ ") 赢得了比赛 祝贺！";
                process.displayMessageToAll(char(str));
            end
        end
     end
end

