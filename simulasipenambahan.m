% sumlasi penambahan
n = 90;
n_grup = 5;
arr_totDeg_grup = zeros(n_grup, 1);
arr_grup = ones(n_grup, 1);
arr_grup(1:end) = ceil(n / n_grup);


for j=1:n_grup
    totDeg = arr_grup(j)/2 *(1+arr_grup(j));
    arr_totDeg_grup(j) = totDeg * arr_grup(j);
end