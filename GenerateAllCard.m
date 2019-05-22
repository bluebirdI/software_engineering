function AllCardList = GenerateAllCard()
    AllCardList= [];
    for i  = 3:15
        Card1 = Card;
        Card2 = Card;
        Card3 = Card;
        Card4 = Card;
        if i <= 12
            SetFourCards(Card1,Card2,Card3,Card4,string(i),i);
        elseif i == 11
            SetFourCards(Card1,Card2,Card3,Card4,'J',i);
        elseif i == 12
            SetFourCards(Card1,Card2,Card3,Card4,'Q',i);
        elseif i == 13
            SetFourCards(Card1,Card2,Card3,Card4,'K',i);
        elseif i == 14
            SetFourCards(Card1,Card2,Card3,Card4,'A',i);
        elseif i == 15
            SetFourCards(Card1,Card2,Card3,Card4,'2',i);
        end
        AllCardList = [AllCardList;Card1;Card2;Card3;Card4];
    end
    Card5 = Card;
    Card5.str = '小王';
    Card5.number = 16;
    Card6 = Card;
    Card6.str = '大王';
    Card6.number = 17;
    AllCardList = [AllCardList;Card5;Card6];
end

function SetFourCards(card1,card2,card3,card4,str1,num)
    card1.str = str1;
    card1.number = num;
    card1.suit = "?";
    card2.str = str1;
    card2.number = num;
    card2.suit = "?";
    card3.str = str1;
    card3.number = num;
    card3.suit = "?";
    card4.str = str1;
    card4.number = num;
    card4.suit = "?";
end