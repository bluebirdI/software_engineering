close all
clear all
game = Game;

process = Processor;
player1UI = player1;
player1UI.InfoBox.Title = "���1 ��Ϣ";
player1UI.player2Label.Text = '���2ʣ������';
player1UI.player3Label.Text = '���3ʣ������';
player2UI = player1;
player2UI.InfoBox.Title = "���2 ��Ϣ";
player2UI.player2Label.Text = '���3ʣ������';
player2UI.player3Label.Text = '���1ʣ������';
player3UI = player1;
player3UI.InfoBox.Title = "���3 ��Ϣ";
player3UI.player2Label.Text = '���1ʣ������';
player3UI.player3Label.Text = '���2ʣ������';
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
