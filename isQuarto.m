function output = isQuarto(p1, p2, p3, p4)

    output = 0;
    for k = 1:4
        if ((p1(k) * p2(k) * p3(k) * p4(k))   || ((1 - p1(k)) * (1 - p2(k)) * (1 - p3(k)) * (1 - p4(k))))
            output = 1;
            break;
        end
    end
          
end