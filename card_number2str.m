function result = card_number2str(cardnum)
    result = '0';
    switch cardnum
        case 3
            result = '3';
        case 4
            result = '4';
        case 5
            result = '5';
        case 6
            result = '6';
        case 7
            result = '7';
        case 8
            result = '8';
        case 9
            result = '9';
        case 10
            result = '10';
        case 11
            result = 'J';
        case 12
            result = 'Q';
        case 13
            result = 'K';
        case 14
            result = 'A';
        case 15
            result = '2';
        case 16
            result = '小王';
        case 17
            result = '大王';
        otherwise
            result = '0';
    end
end 