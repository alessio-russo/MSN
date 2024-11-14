function res = urneF(n, N)
    if randi(N) <= n
        res = n - 1;
    else
        res = n + 1;
    end
end