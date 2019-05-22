classdef Processor < handle
    properties
        player1App
        player2App
        player3App
        game
    end
    methods
        function displayMessageTo(process,player,Message)
            app = eval("process.player"+ string(player)+"App");
            app.Message.Text = [app.Message.Text;{Message}]; 
        end
        
        function displayMessageInPlayer1App(process,Message)
            process.player1App.Message.Text = [process.player1App.Message.Text;{Message}];
        end
        
        function displayMessageInPlayer2App(process,Message)
            process.player2App.Message.Text=[process.player2App.Message.Text;{Message}];
        end
        
        function displayMessageInPlayer3App(process,Message)
            process.player3App.Message.Text=[process.player3App.Message.Text;{Message}];
        end

        function displayHandMessage(process,player,cardlist)
            cardmessage = "";
            for i = 1:length(cardlist)
                cardmessage = cardmessage + " " + string(cardlist(i));
            end
            Message = "player"+ string(player) + "出牌 ： " + cardmessage;
            Message = char(Message);
            len = length(process.player1App.Message.Text);
            process.player1App.Message.Text = [process.player1App.Message.Text(len-2:len);{Message}];
            len = length(process.player2App.Message.Text);
            process.player2App.Message.Text = [process.player2App.Message.Text(len-2:len);{Message}];
            len = length(process.player3App.Message.Text);
            process.player3App.Message.Text = [process.player3App.Message.Text(len-2:len);{Message}];
        end
        
        function displayMessageToAll(process,Message)
            process.player1App.Message.Text = Message;
            process.player2App.Message.Text = Message;
            process.player3App.Message.Text = Message;
        end
        
%        num1是player出牌顺序的下一个
%        num2是player出牌顺序的下下一个
        function displayUpdateRemain(process,player,num)
            next = process.game.NextPlayer(player);
            next2 = process.game.NextPlayer(next);
            nextUI = eval('process.player' + string(next) + 'App');
            nextUI.playerLeftTextArea.Value = string(num);
            next2UI = eval('process.player' + string(next2) + 'App');
            next2UI.playerRightTextArea.Value = string(num);     
        end
        
        function displayLandlordAndFamer(process,num)
            process.player1App.landlord.Value = string(num); 
            process.player2App.landlord.Value = string(num); 
            process.player3App.landlord.Value = string(num); 

        end
    end
end
