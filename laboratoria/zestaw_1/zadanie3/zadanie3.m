
C = 1.1 * 1e-3;
R = 1 * 1e3;
i = 1.2 * 1e-3;

dC = 0.055 * 1e-3;
dR = 0.02 * 1e3;
di = 0.012 * 1e-3;

function n = P(R, i, C)
    n = (R^2 * i^2) / (C+R);
end

% Błąd względny
dP = (R * i^2 * (2*C+R) * dR)/((C+R)^2) + (2 * R^2 * i * di)/(C+R) + (R^2 * i^2 * dC)/((C+R)^2)

% Błąd bezwzględny
dPw = dP / P(R, i , C)


