%simulasi node sisa dengan pengkalian

n = 100;
n_session = 15;
rs = 5;
% n_grup = 5;
% arr_grup = ones(n_grup, 1); 
% arr_grup(1:end) = ceil(n / n_grup);


% rs : number maksimum of revoke sensors (random)
% n_session : number of session
% n : number of nodes
% n_grup : number of grups

n_single = zeros(n_session,1);  %inisial arr total deg for single
n_multi = zeros(9, n_session);  %inisial arr total deg for multi

%% create random untuk rs
for i=1:n_session
    rand_rs(i) = randi([0 rs]); %random integer between 0 until rs
end

%% session for single group
n1 = n;
for i=1:n_session
   n1 = n1 - rand_rs(i); %pengurangan node
   n_single(i) = n1;
end

%% session for grup 2..10
cell_grup={}
for n_grup=2:10
    arr_grup = split(n,n_grup);
    arrTemp =  zeros(n_session,n_grup);
    arrTemp(1,:) = arr_grup;
    
    for i=1:n_session 
        for j=1:rand_rs(i)
            rand_pos = randi([1 n_grup]); %random posisi grup 
            arr_grup(rand_pos) = arr_grup(rand_pos)-1;
        end
        arrTemp(i+1,:) = arr_grup;
        
        %loop each grup
        arr_totDeg_grup = zeros(n_grup, 1);
        for j=1:n_grup
            arr_totDeg_grup(j) = arr_grup(j)/2 *(1+arr_grup(j)) ;
        end
    
        n_multi(n_grup-1,i) = sum(arr_grup);
    end
    cell_grup{n_grup-1} = arrTemp;
end

%% PLOTTING
for i=1:length(n_single)
    str(i)=string(n_single(i));
end
str;
figure,
plot([1:n_session],n_single,'-','Color',[1 0.9 0],'LineWidth',8)
hold on
plot([1:n_session],n_multi(1,:),'-','Color',[0 1 1],'LineWidth',5)
hold on
plot([1:n_session],n_multi(2,:),'-','LineWidth',4,'Color',[0.9 1 0])
grid on
plot([1:n_session],n_multi(3,:),'-','LineWidth',3,'Color',[1 0 0])
grid on
plot([1:n_session],n_multi(4,:),'-','LineWidth',2,'Color',[0 1 0])
grid on
plot([1:n_session],n_multi(5,:),'--','LineWidth',2,'Color',[0 0 1])
grid on
plot([1:n_session],n_multi(6,:),'-.','LineWidth',2,'Color',[0 0.5 0.5])
grid on
plot([1:n_session],n_multi(6,:),'-*','LineWidth',1,'Color',[0.7 0 0])
grid on
% title('Total degree of polynomials of CH')
xlabel('Number of SNs') 
ylabel('Total sum of polynomial degrees') 
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15])
celli={};
celli=str;
xticklabels(celli)
legend({'d = 1','d = 2','d = 3','d = 4','d = 5','d = 6','d = 7','d = 8','d = 9','d = 10'},'Location','northeast',...
    'NumColumns',2)
hold off

% % figure,
% % subplot(1,2,1)
% % n2 = cell_grup{2}'
% % plot([1:n_session+1],n2(:,1:end)','-o')
% % title('Average degree of polynomials of SN (d=3)')
% % xlabel('Session index') 
% % ylabel('Total degree') 
% % grid on
% % legend({'sub-group 1','sub-group 2','sub-group 3'},'Location','best')
% % xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15])
% % 
% % subplot(1,2,2)
% % n3 = cell_grup{3}'
% % plot([1:n_session+1],n3(:,1:end)','-o')
% % title('Average degree of polynomials of SN (d=4)')
% % xlabel('Session index') 
% % ylabel('Total degree') 
% % grid on
% % legend({'sub-group 1','sub-group 2','sub-group 3','sub-group 4'},'Location','best')
% % xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15])