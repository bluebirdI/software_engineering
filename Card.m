classdef Card < handle
    properties
        str
        number
        suit
    end
    methods
        function result = str2number(card)
            cardstring = card.str;
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
        function result = number2str(card)
            result = '0';
            num = card.number;
            switch num
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
    end
end
