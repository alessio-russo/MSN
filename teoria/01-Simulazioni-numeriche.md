# Simulazioni Numeriche

---
**Indice**
```table-of-contents
```
---

Analizziamo un primo esempio di simulazione applicato a un gioco di carte

---

In questo gioco, ci sono tre carte: due sono perdenti e una è vincente. Il mazziere dispone le carte coperte davanti a voi e vi invita a sceglierne una. Prima di rivelare il risultato della vostra scelta, il mazziere scopre una delle due carte perdenti che non avete scelto e vi offre la possibilità di cambiare la vostra decisione iniziale. A questo punto, avete tre opzioni: 

1. Mantenere la vostra scelta iniziale.
2. Cambiare scelta e optare per la carta ancora coperta tra le due rimanenti.
3. Decidere casualmente se cambiare o meno la scelta.

Qual è la strategia migliore?

---

Questo problema, piuttosto noto, può essere affrontato sia in termini matematici che attraverso una simulazione al computer. La sua soluzione è legata alla cosiddetta *formula classica della probabilità*, che assegna la probabilità di un evento come il rapporto tra il numero di casi favorevoli e il numero di casi possibili (in questo caso, la probabilità di pescare la carta vincente tra le tre coperte è pari a 1/3, poiché solo una carta è vincente tra le tre disponibili)

Per comprendere la dinamica del sistema, dobbiamo riconoscere le regole che ne guidano l'evoluzione. A livello astratto, ciò implica la definizione di un algoritmo che implementeremo in un programma. Nel nostro esempio, dovremo saper mescolare le carte, selezionarne una casualmente, e scoprire una carta perdente tra le rimanenti.

La simulazione che implementeremo calcolerà le frequenze di vincita delle tre strategie di gioco considerate: mantenere la scelta iniziale, cambiare carta, o decidere a caso tra le due carte rimaste coperte.

`main.m`

```matlab
clear; clc; close all;

N = 1000;

c_result = [0, 0];
s_result = [0,0];
r_result = [0, 0];

for iter = 1:N  
    c_res = play(1); % simulating change
    s_res = play(2); % simulating same
    r_res = play(randi(2)); % simulating random
    
    if c_res == 1 % player wins
        c_result(1) = c_result(1) + 1;
    else
        c_result(2) = c_result(2) + 1;
    end
    
    if s_res == 1
        s_result(1) = s_result(1) + 1;
    else
        s_result(2) = s_result(2) + 1;
    end

    if r_res == 1
        r_result(1) = r_result(1) + 1;
    else
        r_result(2) = r_result(2) + 1;
    end

    c_prob = c_result(1) / (c_result(1) + c_result(2));
    s_prob = s_result(1) / (s_result(1) + s_result(2));
    r_prob = r_result(1) / (r_result(1) + r_result(2));
    
    strategies = {'Same Strategy', 'Change Strategy', 'Random Strategy'};
    figure;
    bar([s_prob,c_prob, r_prob]);
    set(gca, 'XTickLabel', strategies, 'XTick', 1:numel(strategies));
    ylabel('Probabilities');
    ylim([0 1]);
end
```

`play.m`

```matlab
function result = play(strategy)

    hand = [0, 0, 0];
    revealed = 0;
    winner = randi(3);
    choice = randi(3);
    hand(winner) = 1;

    for i = 1:3
        if i ~= choice && hand(i) == 0
            revealed = i;
            break
        end
    end

    if strategy == 1  % change
        for i = 1:3
            if i ~= choice && i ~= revealed
                choice = i;
                break
            end
        end
    end
    
    result = (choice == winner);
end
```


La **frequenza di realizzazione di un evento** è il rapporto tra il numero di volte in cui l'evento si verifica e il numero totale di tentativi effettuati. Ripetendo più volte l'esperimento, abbiamo osservato che le frequenze di vincita di ciascuna strategia si stabilizzano (o **cristallizzano**) su valori precisi.

![[result.png|500]]

Questi valori corrispondono alle probabilità che possiamo calcolare a priori per ogni strategia, e ciò costituisce la base del nostro approccio **frequentista** alla teoria delle probabilità. La soluzione può essere presentata in modo intuitivo come segue (in seguito, forniremo una spiegazione più formale, inclusa una discussione sulla soluzione in termini della formula di Bayes):

- **Prima strategia: mantenere la scelta iniziale**  
  Questa strategia ha una probabilità di vittoria di 1/3. Questo perché, al momento della prima scelta tra le 3 carte coperte, solo una è la carta vincente (l’asso). Quando il giocatore sceglie per la prima volta, prima che il mazziere intervenga, la probabilità di aver selezionato la carta vincente è 1/3. Ciò che accade successivamente, ovvero il "teatro" del mazziere, non cambia questa probabilità.

- **Seconda strategia: cambiare la scelta iniziale**  
  Questa strategia ha una probabilità di vittoria di 2/3. Possiamo intuirlo in questo modo: è come se il mazziere, dopo la scelta iniziale, ci offrisse l'opportunità di scegliere entrambe le altre carte. In pratica, la probabilità di vincita raddoppia, poiché ognuna delle due carte non scelte ha una probabilità di 1/3 di essere quella vincente. L’intervento del mazziere non altera la probabilità, poiché è certo che almeno una delle due carte non scelte in prima istanza sia perdente. Il mazziere ci rivela semplicemente un'informazione che, in fondo, già conoscevamo.

- **Terza strategia: scegliere a caso tra le 2 carte rimaste coperte**  
  Questa strategia ha una probabilità di vittoria di 1/2. L’intuizione è semplice: quando si scelgono tra due carte, una sola è quella vincente. Pertanto, si tratta di un evento con due possibili esiti, e la probabilità di vittoria è 1 su 2.

In sintesi, la strategia ottimale è cambiare sempre la scelta iniziale, poiché ciò raddoppia la probabilità di vincita rispetto al mantenere la scelta fatta in prima istanza.