function stats = play()
    keep = 0;
    change = 0;
    coin = 0;
    
    % setup
    cards = [1 0 0]';
    
    % mix
    cards = cards(randperm(3));
    winner = find(cards == 1);
    
    % guess
    guess = randi(3); %ceil(3*rand())
    models = diag(ones(1, 3));
    my_cards = models(guess, :);
    
    % show
    possible_show = setdiff(1:3, [guess winner]);
    showed = possible_show(randi(length(possible_show)));
    
    % keep
    
    if(my_cards * cards == 1)
        keep = keep + 1;
    end
    
    % change
    
    possible_change = setdiff(1:3, [guess showed]);
    new_guess = possible_change(randi(length(possible_change)));
    changed_cards = models(new_guess, :);
    
    if(changed_cards * cards == 1)
        change = change + 1;
    end
    
    % coin - 1 to change, 2 to keep
    toss = randi(2);
    if(toss == 2)
        coin_cards = changed_cards;
    else
        coin_cards = my_cards;
    end
    
    if(coin_cards * cards == 1)
        coin = coin + 1;
    end

    stats = [keep change coin];
    
    % disp(keep);
    % disp(change);
    % disp(coin);
end