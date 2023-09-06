n = 100;
n_session = 15;
rs = 3;
n_grup = 5;
arr_grup = ones(n_grup, 1); 
arr_grup(1:end) = ceil(n / n_grup);

% rs : number maksimum of revoke sensors (random)
% n_session : number of session
% n : number of nodes
% n_grup : number of grups

arr_tg_single = zeros(n_session,1);  %inisial arr total deg for single
arr_tg_multi = zeros(n_session,1);  %inisial arr total deg for multi

for i=1:n_session
    rand_rs = randi([0 rs]); %random integer between 0 until rs
 
    %% simulasi multi group
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
    arr_tg_multi(i) = sum(arr_totDeg_grup);

    %% simulasi single group
    n = n - rand_rs; %pengurangan node
    arr_tg_single(i) = n/2*(1+n); %cal tot degree

end

figure,
plot([1:n_session],arr_tg_single,'-pentagram','Color','r')
hold on
plot([1:n_session],arr_tg_multi,'-o')
grid on
title('Total degree of polynomials of the CH')
xlabel('The u-th session') 
ylabel('Total degree') 
legend({'d = 1','d = 5'},'Location','northeast')