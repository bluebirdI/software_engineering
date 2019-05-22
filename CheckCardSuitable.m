function result = CheckCardSuitable(NumCardList,LastCardList)
    result = false;
    [kind1,keycard1] = CardListKind(NumCardList);
    [kind2,keycard2] = CardListKind(LastCardList);
    if kind1 ~= kind2 && kind1~=10
        result = false;
    elseif kind1~=kind2 && kind1 == 10
        result = true;
    elseif kind1 == kind2
        if keycard1 > keycard2
            result = true;
        end
    end
end