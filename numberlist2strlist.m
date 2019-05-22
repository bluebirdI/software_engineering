function result = numberlist2strlist(strlist)
    result = [];
    len = length(strlist);
    if len~=0
        result = [string(card_number2str(strlist(1)))];
        for i = 2:len
            result = [result;string(card_number2str(strlist(i)))];
        end
    end
end