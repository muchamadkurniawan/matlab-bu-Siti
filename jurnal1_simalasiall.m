n = 100;
n_session = 15;
rs = 3;
n_grup = 2;

td_single = single_simulation(n,n_session,rs);
td_grup_d2 = group_simulation(n,n_session,rs,2);
td_grup_d3 = group_simulation(n,n_session,rs,3);
td_grup_d4 = group_simulation(n,n_session,rs,4);
td_grup_d5 = group_simulation(n,n_session,rs,5);

figure,
plot([1:n_session],td_single)
hold on
plot([1:n_session],td_grup_d2)
hold on
plot([1:n_session],td_grup_d3)
hold on
plot([1:n_session],td_grup_d4)
hold on
plot([1:n_session],td_grup_d5)
hold on

