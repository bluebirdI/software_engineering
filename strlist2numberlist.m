function result = strlist2numberlist(strlist)
    result = [];
    len = length(strlist);
    if len~=0
        result = card_str2number(strlist(1));
        for i = 2:len
            result = [result;card_str2number(strlist(i))];
        end
    end
end