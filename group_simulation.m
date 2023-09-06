function arr_tot_deg = group_simulation( n, n_grup)
%inisial arr grup
arr_grup = ones(n_grup, 1); 
arr_grup(1:end) = ceil(n / n_grup);

%loop untuk pengurangan node pada grup
for j=1:rand_rs
    rand_pos = randi([1 n_grup]); %random posisi grup 
    arr_grup(rand_pos) = arr_grup(rand_pos)-1;
end

%loop each grup
arr_totDeg_grup = zeros(n_grup, 1);
for j=1:n_grup
    arr_totDeg_grup(j) = arr_grup(j)/2 *(1+arr_grup(j)) ;
end
arr_tot_deg(i) = sum(arr_totDeg_grup);

end

