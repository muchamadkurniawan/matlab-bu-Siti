%%grafik penurunan degree

n = 100;

n_single = zeros(n_session,1);  %inisial arr total deg for single
n_multi = zeros(10,1);  %inisial arr total deg for multi


%% session for single group
n_multi(1) = 5050

%% session for grup 2..10
cell_grup={}
for n_grup=2:10
    arr_grup = split(n,n_grup);
    arrTemp =  zeros(n_session,n_grup);
    arrTemp(1,:) = arr_grup;
    
    arrTemp(i+1,:) = arr_grup;

    %loop each grup
    arr_totDeg_grup = zeros(n_grup, 1);
    for j=1:n_grup
        arr_totDeg_grup(j) = arr_grup(j)/2 *(1+arr_grup(j)) ;
    end
    n_multi(n_grup) = sum(arr_totDeg_grup);
end

%% PLOTTING
figure,
plot([1:10],n_multi,'-pentagram')
% hold on
% plot([1:n_session],n_multi,'-o')
grid on
xticks([1 2 3 4 5 6 7 8 9 10])
% xtickslabels({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15'})
% title('average node of the CH')
title('Total of multiplication requirement of SN')
xlabel('d') 
ylabel('Total multiplication') 
% axis([1 15 0 100])
% legend({'d = 1','d = 2','d = 3','d = 4','d = 5','d = 6','d = 7','d = 8','d = 9','d = 10'},'Location','northeast',...
%     'NumColumns',2)
hold off

% figure,
% subplot(1,2,1)
% n2 = cell_grup{2}'
% plot([1:n_session+1],n2(:,1:end)','-o')
% title('Average degree of polynomials of SN (d=3)')
% xlabel('The u-th session') 
% ylabel('Total degree') 
% grid on
% legend({'sub-group 1','sub-group 2','sub-group 3'},'Location','best')
% xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15])
% 
% subplot(1,2,2)
% n3 = cell_grup{3}'
% plot([1:n_session+1],n3(:,1:end)','-o')
% title('Average degree of polynomials of SN (d=4)')
% xlabel('The u-th session') 
% ylabel('Total degree') 
% grid on
% legend({'sub-group 1','sub-group 2','sub-group 3','sub-group 4'},'Location','best')
% xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15])