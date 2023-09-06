function arr_tot_deg = single_simulation ( n, n_session, rs)
    % rs : number maksimum of revoke sensors (random)
    % n_session : number of session
    % n : total node
    
    arr_tot_deg = zeros(n_session,1);
    for i=1:n_session
        rand_rs = randi([0 rs]); %random integer between 0 until rs
        n = n - rand_rs; %pengurangan node
        arr_tot_deg(i) = n/2*(1+n); %cal tot degree
    end
end

