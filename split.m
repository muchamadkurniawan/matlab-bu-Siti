function arr_grup = split(n,n_grup)
arr_grup=[];
if(n < n_grup)
    arr_grup(1)=1;
elseif (mod(n,n_grup)==0)
    for i=1:n_grup
        arr_grup(i)=floor(n/n_grup);
    end
else
    zp = n_grup - mod(n,n_grup);
    pp = floor(n/n_grup);
    for i=1:n_grup
        if(i-1 >= zp )
            arr_grup(i) = pp + 1;
        else
            arr_grup(i)= pp;
        end
    end
end
end

