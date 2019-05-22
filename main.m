close all
clear all
game = Game;

process = Processor;
player1UI = player1;
player1UI.InfoBox.Title = "Player1 Message";
player1UI.player2Label.Text = 'player2สฃำเลฦสý';
player1UI.player3Label.Text = 'player3สฃำเลฦสý';
player2UI = player1;
player2UI.InfoBox.Title = "Player2 Message";
player2UI.player2Label.Text = 'player3สฃำเลฦสý';
player2UI.player3Label.Text = 'player1สฃำเลฦสý';
player3UI = player1;
player3UI.InfoBox.Title = "Player3 Message";
player3UI.player2Label.Text = 'player1สฃำเลฦสý';
player3UI.player3Label.Text = 'player2สฃำเลฦสý';
player1UI.Game = game;
player2UI.Game = game;
player3UI.Game = game;

process.game = Game;
game.Process = process;
process.player1App = player1UI;
process.player2App = player2UI;
process.player3App = player3UI;
game.startgame(process);
game.playgame(process);
game.wingame(process);
