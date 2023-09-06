n = 100;
n_session = 15;
rs = 3;
% rs : number maksimum of revoke sensors (random)
% n_session : number of session
% n : number of nodes
% n_grup : number of grups

arr_tg_single = zeros(n_session,1);  %inisial arr total deg for single
arr_tg_multi = zeros(9, n_session);  %inisial arr total deg for multi

for i=1:n_session
    rand_rs(i) = randi([0 rs]); %random integer between 0 until rs
end

%% simulasi single group
n_single = n;
for i=1:n_session
    n_single = n_single - rand_rs(i); %pengurangan node
    arr_tg_single(i) = n_single/2*(1+n_single); %cal tot degree
end
arr_tg_single;

%% simulation group
for n_grup=2:10
    arr_grup = split(n,n_grup);
    for i=1:n_session
        for j=1:rand_rs
            rand_pos = randi([1 n_grup]); %random posisi grup 
            arr_grup(rand_pos) = arr_grup(rand_pos)-1;
        end

        arr_totDeg_grup = zeros(n_grup, 1);
        for j=1:n_grup
            arr_totDeg_grup(j) = arr_grup(j)/2 *(1+arr_grup(j)) ;
        end
        arr_tg_multi(n_grup-1, i) = sum(arr_totDeg_grup);
    end 
end
arr_tg_multi;

figure,

plot([1:n_session],arr_tg_single)
hold on
cm = parula(10);
for i=1:9
    plot([1:n_session],arr_tg_multi(i,:),'Color', cm(i,:))
    hold on
end
%% figure,
% plot([1:n_session],arr_tg_single,'-pentagram','Color','r')
% hold on
% plot([1:n_session],arr_tg_multi,'-o')
% grid on
% title('Total degree of polynomials of the CH')
% xlabel('The u-th session') 
% ylabel('Total degree') 
% legend({'d = 1','d = 5'},'Location','northeast')