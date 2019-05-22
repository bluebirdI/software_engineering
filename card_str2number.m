function result = card_str2number(cardstring)
    result = 0;
    switch cardstring
        case '3'
            result = 3;
        case '4'
            result = 4;
        case '5'
            result = 5;
        case '6'
            result = 6;
        case '7'
            result = 7;
        case '8'
            result = 8;
        case '9'
            result = 9;
        case '10'
            result = 10;
        case 'J'
            result = 11;
        case 'Q'
            result = 12;
        case 'K'
            result = 13;
        case 'A'
            result = 14;
        case '2'
            result = 15;
        case '小王'
            result = 16;
        case '大王'
            result = 17;
        otherwise
            result = 0;
    end
end