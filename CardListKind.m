
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
        %��ը��10
        %keycard = 100 �������
        elseif CardList(1) == 16 && CardList(2) == 17 
            kind = 10;
            keycardlist = 100;
        end
    elseif len == 3
        % ����һ������: 3
        %keycard 888 keycard =8
        if CardList(1) == CardList(2) && CardList(1) == CardList(3)
            kind = 3;
            keycardlist = CardList(1);
        end
    elseif len == 4
        %ը��:10
        %keycard 7777 keycard = 7
        if CardList(1) == CardList(2) && CardList(2) == CardList(3) && CardList(3) ==CardList(4)
            kind = 10;
            keycardlist = CardList(1);
        %����һ:4
        %keycard ������ 5556 keycard = 5
        elseif CardList(1) == CardList(2) && CardList(2) == CardList(3) && CardList(3) ~= CardList(4)
            kind = 4;
            keycardlist = CardList(1);
        elseif CardList(1) ~= CardList(2) && CardList(2) == CardList(3) && CardList(3) == CardList(4)
            keycardlist = CardList(4);
            kind = 4;
        end
    elseif len==5
        %˳�� �� 5 
        %keycard ����С���Ǹ��� 45678 keycard = 4
        if CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5)
            kind = 5;
            keycardlist = CardList(1);
            
        %��������
        %keycard�� 33355 keycard = 3
        elseif CardList(1) == CardList(2) && CardList(3)==CardList(4) && CardList(4) == CardList(5)
            kind = 8;
            keycardlist = CardList(3);
        elseif CardList(1) == CardList(2) && CardList(2)==CardList(3) && CardList(4) == CardList(5)
            kind = 8;
            keycardlist = CardList(1);
        end
        
    elseif len==6
        %���� �� 6
        %keycard ����С���Ǹ��Ե��� 556677 keycard = 5
        if CheckThreePairs(CardList)
            kind = 6;
            keycardlist = CardList(1);
        %6���Ƶ�˳��
        % keycard ����С�������Ƶ� 67891011 6
        elseif CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6)
            kind = 9;
            keycardlist = CardList(1);
        end
    elseif len == 7
        %7���Ƶ�˳��
        % keycard ����С�������� 3456789 3
        if CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7)
            kind = 11;
            keycardlist = CardList(1);
        end
    elseif len == 8
        %�ɻ� : 7
        % ����ɻ����ܴ�һ�� 33344455 ���ᱻ��Ϊ�Ƿɻ�
        % 44455567 OK 88899956 OK 
        % keycard ����С���Ǹ����� 44455567 keycard=4
        [judge,keycard] = DoubleThreeWithTwo(CardList);
        [judge2,keycard2] = DoubleThreeWithDouble(CardList);
        if judge
            kind = 7;
            keycardlist = keycard;
        % �ɻ���һ��:13
        % 33344466 keycard = 3
        elseif judge2
            kind = 13;
            keycardlist = keycard2;
        % 8���Ƶ�˳��:12
        % 3456 78910 keycard = 3
        elseif  CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7) && CardList(7)+1 == CardList(8)
            kind = 12;
            keycardlist = CardList(1);
            % 4������ �� 14
            % 33445566 �� keycard = 3
        elseif CardList(1) == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)==CardList(6) && CardList(6)+1==CardList(7) && CardList(7) == CardList(8)
            kind = 14;
            keycardlist= CardList(1);
        end
    elseif len == 9
        % 9���Ƶ�˳�� 15
        % 34567891011 �� keycard = 3
        if CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7) && CardList(7)+1 == CardList(8) && CardList(8)+1 == CardList(9)
            kind = 15;
            keycardlist = CardList(1);
        end
    elseif len ==10
        % 5������ 16
        % 4455667788 �� 4
        if CardList(1) == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)==CardList(6) && CardList(6)+1==CardList(7) && CardList(7) == CardList(8) && CardList(8)+1==CardList(9) && CardList(9) == CardList(10)
            kind = 16;
            keycardlist= CardList(1);
            % 10���Ƶ�˳��
            % 34567 89 10 11 12 �� 3
        elseif CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7) && CardList(7)+1 == CardList(8) && CardList(8)+1 == CardList(9) && CardList(9)+1 == CardList(10)
            kind = 17;
            keycardlist = CardList(1); 
        end
    elseif len ==11
            % 11���Ƶ�˳��
            % 34567 89 10 11 12 13�� 3
        if CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7) && CardList(7)+1 == CardList(8) && CardList(8)+1 == CardList(9) && CardList(9)+1 == CardList(10) && CardList(10)+1 == CardList(11)
            kind = 18;
            keycardlist = CardList(1); 
        end   
    elseif len ==12
        % 6 ������ 19
        % 445566778899 �� 4
        if CardList(1) == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)==CardList(6) && CardList(6)+1==CardList(7) && CardList(7) == CardList(8) && CardList(8)+1==CardList(9) && CardList(9) == CardList(10) && CardList(10)+1==CardList(11) && CardList(11) == CardList(12)
            kind = 19;
            keycardlist= CardList(1);
            % 12���Ƶ�˳��
            % 34567 89 10 11 12 13 14 �� 3
        elseif CardList(1)+1 == CardList(2) && CardList(2)+1 == CardList(3) && CardList(3)+1==CardList(4) && CardList(4)+1 ==CardList(5) && CardList(5)+1==CardList(6) && CardList(6)+1==CardList(7) && CardList(7)+1 == CardList(8) && CardList(8)+1 == CardList(9) && CardList(9)+1 == CardList(10) && CardList(10)+1 == CardList(11) && CardList(11)+1 == CardList(12)
            kind = 20;
            keycardlist = CardList(1); 
        end
    end
end

% CardListӦ�����Ѿ�sorted�˵�list
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

% CardListӦ�����Ѿ�sorted�˵�list
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
