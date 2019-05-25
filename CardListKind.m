
function [kind,keycardlist] = CardListKind(CardList)
    kind = 0;
    keycardlist = 0;
    len = length(CardList);
    if len == 0
        kind = 0;
    elseif len==1
        kind = 1;
        keycardlist = CardList(1);
    elseif len==2
        if CardList(1) == CardList(2)
            kind = 2;
            keycardlist = CardList(1);
        %王炸：10
        %keycard = 100 代表最大
        elseif CardList(1) == 16 && CardList(2) == 17 
            kind = 10;
            keycardlist = 100;
        end
    elseif len == 3
        % 三张一样的牌: 3
        %keycard 888 keycard =8
        if CardList(1) == CardList(2) && CardList(1) == CardList(3)
            kind = 3;
            keycardlist = CardList(1);
        end
    elseif len == 4
        %炸弹:10
        %keycard 7777 keycard = 7
        if CardList(1) == CardList(2) && CardList(2) == CardList(3) && CardList(3) ==CardList(4)
            kind = 10;
            keycardlist = CardList(1);
        %三带一:4
        %keycard 是三个 5556 keycard = 5
        elseif CardList(1) == CardList(2) && CardList(2) == CardList(3) && CardList(3) ~= CardList(4)
            kind = 4;
            keycardlist = CardList(1);
        elseif CardList(1) ~= CardList(2) && CardList(2) == CardList(3) && CardList(3) == CardList(4)
            keycardlist = CardList(4);
            kind = 4;
        end
    elseif len==5
        %顺子 ： 5 
        %keycard 是最小的那个数 45678 keycard = 4
        if CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5)
            kind = 5;
            keycardlist = CardList(1);
            
        %三带二：
        %keycard是 33355 keycard = 3
        elseif CardList(1) == CardList(2) && CardList(3)==CardList(4) && CardList(4) == CardList(5)
            kind = 8;
            keycardlist = CardList(3);
        elseif CardList(1) == CardList(2) && CardList(2)==CardList(3) && CardList(4) == CardList(5)
            kind = 8;
            keycardlist = CardList(1);
        end
        
    elseif len==6
        %连对 ： 6
        %keycard 是最小的那个对的数 556677 keycard = 5
        if CheckThreePairs(CardList)
            kind = 6;
            keycardlist = CardList(1);
        %6张牌的顺子
        % keycard 是最小的那张牌的 67891011 6
        elseif CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6)
            kind = 9;
            keycardlist = CardList(1);
        end
    elseif len == 7
        %7张牌的顺子
        % keycard 是最小的那种牌 3456789 3
        if CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7)
            kind = 11;
            keycardlist = CardList(1);
        end
    elseif len == 8
        %飞机 : 7
        % 这里飞机不能带一对 33344455 不会被认为是飞机
        % 44455567 OK 88899956 OK 
        % keycard 是最小的那个三个 44455567 keycard=4
        [judge,keycard] = DoubleThreeWithTwo(CardList);
        [judge2,keycard2] = DoubleThreeWithDouble(CardList);
        if judge
            kind = 7;
            keycardlist = keycard;
        % 飞机带一对:13
        % 33344466 keycard = 3
        elseif judge2
            kind = 13;
            keycardlist = keycard2;
        % 8张牌的顺子:12
        % 3456 78910 keycard = 3
        elseif  CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7) && CardList(7)+1 == CardList(8)
            kind = 12;
            keycardlist = CardList(1);
            % 4对连对 ： 14
            % 33445566 ： keycard = 3
        elseif CardList(1) == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)==CardList(6) && CardList(6)+1==CardList(7) && CardList(7) == CardList(8)
            kind = 14;
            keycardlist= CardList(1);
        end
    elseif len == 9
        % 9张牌的顺子 15
        % 34567891011 ： keycard = 3
        if CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7) && CardList(7)+1 == CardList(8) && CardList(8)+1 == CardList(9)
            kind = 15;
            keycardlist = CardList(1);
        end
    elseif len ==10
        % 5对连对 16
        % 4455667788 ： 4
        if CardList(1) == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)==CardList(6) && CardList(6)+1==CardList(7) && CardList(7) == CardList(8) && CardList(8)+1==CardList(9) && CardList(9) == CardList(10)
            kind = 16;
            keycardlist= CardList(1);
            % 10张牌的顺子
            % 34567 89 10 11 12 ： 3
        elseif CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7) && CardList(7)+1 == CardList(8) && CardList(8)+1 == CardList(9) && CardList(9)+1 == CardList(10)
            kind = 17;
            keycardlist = CardList(1); 
        end
    elseif len ==11
            % 11张牌的顺子
            % 34567 89 10 11 12 13： 3
        if CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7) && CardList(7)+1 == CardList(8) && CardList(8)+1 == CardList(9) && CardList(9)+1 == CardList(10) && CardList(10)+1 == CardList(11)
            kind = 18;
            keycardlist = CardList(1); 
        end   
    elseif len ==12
        % 6 对连对 19
        % 445566778899 ： 4
        if CardList(1) == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)==CardList(6) && CardList(6)+1==CardList(7) && CardList(7) == CardList(8) && CardList(8)+1==CardList(9) && CardList(9) == CardList(10) && CardList(10)+1==CardList(11) && CardList(11) == CardList(12)
            kind = 19;
            keycardlist= CardList(1);
            % 12张牌的顺子
            % 34567 89 10 11 12 13 14 ： 3
        elseif CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7) && CardList(7)+1 == CardList(8) && CardList(8)+1 == CardList(9) && CardList(9)+1 == CardList(10) && CardList(10)+1 == CardList(11) && CardList(11)+1 == CardList(12)
            kind = 20;
            keycardlist = CardList(1); 
        end
    end
end

% CardList应该是已经sorted了的list
function result = CheckThreePairs(CardList)
    result = false;
    if length(CardList) ~=6
        result = false;
    else
        if CardList(1) == CardList(2) && CardList(3) == CardList(4) && CardList(5) == CardList(6)
            result =true;
        else
            result = false;
        end
    end
end

% CardList应该是已经sorted了的list
function [result,keycard] = DoubleThreeWithTwo(CardList)
    result = false;
    keycard = 0;
    if length(CardList) ~= 8 
        result = false;
    else 
        if CardList(1)==CardList(2) && CardList(2)==CardList(3)
            if CardList(3)+1 == CardList(4) && CardList(4) == CardList(5) && CardList(5) == CardList(6) 
                if CardList(6)~= CardList(7) && CardList(7)~= CardList(8)
                    result = true;
                    keycard = CardList(1);
                end
            end
        elseif CardList(2)==CardList(3) && CardList(3)==CardList(4)
            if CardList(4)+1 == CardList(5) && CardList(5) == CardList(6) && CardList(6) == CardList(7) 
                if CardList(1)~= CardList(2) && CardList(7)~= CardList(8)
                    result = true;
                    keycard= CardList(2);
                end
            end
        elseif CardList(3)==CardList(4) && CardList(4)==CardList(5)
            if CardList(4)+1 == CardList(6) && CardList(6) == CardList(7) && CardList(7) == CardList(8) 
                if CardList(1)~= CardList(2) && CardList(2)~= CardList(3)
                    result = true;
                    keycard = CardList(3);
                end
            end
        end
    end
end

function [result,keycard] = DoubleThreeWithDouble(Cardlist)
    result = false;
    keycard = 0;
    if length(CardList) ~= 8 
        result = false;
    else 
        if CardList(1)==CardList(2) && CardList(2)==CardList(3)
            if CardList(3)+1 == CardList(4) && CardList(4) == CardList(5) && CardList(5) == CardList(6) 
                if CardList(6) ~= CardList(7) && CardList(7)== CardList(8)
                    result = true;
                    keycard = CardList(1);
                end
            end
        elseif CardList(3)==CardList(4) && CardList(4)==CardList(5)
            if CardList(4)+1 == CardList(6) && CardList(6) == CardList(7) && CardList(7) == CardList(8) 
                if CardList(1)== CardList(2) && CardList(2)~= CardList(3)
                    result = true;
                    keycard = CardList(3);
                end
            end
        end
    end
end
