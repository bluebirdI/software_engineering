classdef test2 < matlab.uitest.TestCase
	properties
        main
        player1card
        player2card
        player3card
        landlord_card
        game
    end

    methods (TestMethodSetup)
        function launchApp(testCase)
        
        end
    end
    
    methods(Test)
        
        function testcardlist1(testCase)

            testCase.main = app_test2;
            testCase.press(testCase.main.Button_21);
            testCase.press(testCase.main.player1UI.Button_1);
            testCase.press(testCase.main.player1UI.Button_2);
            pause(1);
            testCase.press(testCase.main.player1UI.PlaytheHand);
               
            pause(0.5);
            testCase.press(testCase.main.player2UI.NotPlaytheHand);
            pause(0.5);
            
            testCase.press(testCase.main.player3UI.Button_1);
            testCase.press(testCase.main.player3UI.Button_2);
            pause(1);
            testCase.press(testCase.main.player3UI.PlaytheHand);
            
            pause(0.5);
            testCase.press(testCase.main.player1UI.NotPlaytheHand);
            pause(0.5);
            
            pause(0.5);
            testCase.press(testCase.main.player2UI.NotPlaytheHand);
            pause(0.5);
            
            testCase.press(testCase.main.player3UI.Button_3);
            testCase.press(testCase.main.player3UI.Button_4);
            testCase.press(testCase.main.player3UI.Button_5);
            testCase.press(testCase.main.player3UI.Button_6);
            testCase.press(testCase.main.player3UI.Button_7);
            testCase.press(testCase.main.player3UI.Button_9);
            testCase.press(testCase.main.player3UI.Button_10);
            pause(1);
            testCase.press(testCase.main.player3UI.PlaytheHand);
            testCase.press(testCase.main.player3UI.Button_9);
            testCase.press(testCase.main.player3UI.Button_10);
            testCase.press(testCase.main.player3UI.Button_8);
            pause(1);
            testCase.press(testCase.main.player3UI.PlaytheHand);
            
            pause(0.5);
            testCase.press(testCase.main.player1UI.NotPlaytheHand);
            pause(0.5);
            
            testCase.press(testCase.main.player2UI.Button_3);
            testCase.press(testCase.main.player2UI.Button_4);
            testCase.press(testCase.main.player2UI.Button_5);
            testCase.press(testCase.main.player2UI.Button_6);
            pause(1);
            testCase.press(testCase.main.player2UI.PlaytheHand);
            pause(1);
            
            pause(0.5);
            testCase.press(testCase.main.player3UI.NotPlaytheHand);
            pause(0.5);
            
            pause(0.5);
            testCase.press(testCase.main.player1UI.NotPlaytheHand);
            pause(0.5);
            
            testCase.press(testCase.main.player2UI.Button_7);
            testCase.press(testCase.main.player2UI.Button_8);
            testCase.press(testCase.main.player2UI.Button_9);
            testCase.press(testCase.main.player2UI.Button_10);
            testCase.press(testCase.main.player2UI.Button_11);
            testCase.press(testCase.main.player2UI.Button_12);
            pause(1);
            testCase.press(testCase.main.player2UI.PlaytheHand);
            pause(1);
            
            testCase.press(testCase.main.player3UI.Button_9);
            testCase.press(testCase.main.player3UI.Button_10);
            testCase.press(testCase.main.player3UI.Button_11);
            testCase.press(testCase.main.player3UI.Button_12);
            testCase.press(testCase.main.player3UI.Button_13);
            testCase.press(testCase.main.player3UI.Button_14);
            pause(1);
            testCase.press(testCase.main.player3UI.PlaytheHand);
            
            testCase.press(testCase.main.player1UI.Button_11);
            testCase.press(testCase.main.player1UI.Button_12);
            testCase.press(testCase.main.player1UI.Button_13);
            testCase.press(testCase.main.player1UI.Button_14);
            pause(1);
            testCase.press(testCase.main.player1UI.PlaytheHand);
            
            pause(0.5);
            testCase.press(testCase.main.player2UI.NotPlaytheHand);
            pause(0.5);
            
            pause(0.5);
            testCase.press(testCase.main.player3UI.NotPlaytheHand);
            pause(0.5);
            
            testCase.press(testCase.main.player1UI.Button_3);
            testCase.press(testCase.main.player1UI.Button_4);
            pause(1);
            testCase.press(testCase.main.player1UI.PlaytheHand);
            
            pause(0.5);
            testCase.press(testCase.main.player2UI.NotPlaytheHand);
            pause(0.5);
            
            testCase.press(testCase.main.player3UI.Button_16);
            testCase.press(testCase.main.player3UI.Button_17);
            pause(1);
            testCase.press(testCase.main.player3UI.PlaytheHand);
            
            testCase.press(testCase.main.player1UI.Button_19);
            testCase.press(testCase.main.player1UI.Button_20);
            pause(1);
            testCase.press(testCase.main.player1UI.PlaytheHand);
            
            
            pause(0.5);
            testCase.press(testCase.main.player2UI.NotPlaytheHand);
            pause(0.5);
            
            pause(0.5);
            testCase.press(testCase.main.player3UI.NotPlaytheHand);
            pause(0.5);
            
            testCase.press(testCase.main.player1UI.Button_6);
            pause(1);
            testCase.press(testCase.main.player1UI.PlaytheHand);
            
            pause(0.5);
            testCase.press(testCase.main.player2UI.NotPlaytheHand);
            pause(0.5);
            
            testCase.press(testCase.main.player3UI.Button_15);
            pause(1);
            testCase.press(testCase.main.player3UI.PlaytheHand);
            
            pause(4);
        end
    end
end

    

function result = getp(index)
            result = [274+(index-1)*20,42];
end