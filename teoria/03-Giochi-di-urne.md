# Giochi di urne

---
**Indice**
```table-of-contents
```
---

Consideriamo un'urna contenente $3$ biglie nere e $2$ biglie bianche, che devono essere distribuite casualmente in due altre urne: un'urna $U3$, che conterrà esattamente $3$ biglie, e un'urna **$U2$**, che ne conterrà esattamente $2$.

Il primo passo è definire i **macrostati di colore**: si tratta di configurazioni caratterizzate dal numero di biglie nere presenti in $U3$, bianche in $U2$, e così via. Vogliamo considerare come macrostati del sistema queste configurazioni, mantenendo fisso il numero di nere in $U3$, bianche in $U2$, ecc.

Per descrivere il sistema, possiamo individuare quattro variabili: $n_3$ (numero di nere in $U3$), $n_2$ (numero di nere in $U2$), $b3$ (numero di bianche in $U3$), $b2$ (numero di bianche in $U2$). Tuttavia, grazie a semplici **proprietà di conservazione** (del numero totale di biglie e del loro colore), è sufficiente conoscere una sola di queste quantità per determinare le altre.

Abbiamo scelto di descrivere il sistema in termini di $n_3$.

Per fornire una descrizione probabilistica del sistema, abbiamo calcolato la **distribuzione di probabilità a priori**, ovvero le probabilità associate ai diversi **macrostati di colore**.

## Calcolo delle probabilità a priori dei macrostati di colore

Per calcolare la **distribuzione di probabilità a priori** dei macrostati di colore, dobbiamo determinare tutte le possibili configurazioni con cui le $3$ biglie nere e le 2 $biglie$ bianche possono essere distribuite nelle due urne $U3$ e $U2$, rispettando le loro capacità ($U3$ può contenere $3$ biglie, $U2$ può contenerne $2$).

---
##### Macrostati possibili

Ogni macrostato di colore è definito dal numero di biglie nere e bianche in ciascuna urna. Denotiamo le variabili come:

- $n_3$: numero di biglie nere in $U3$
- $n_2$: numero di biglie nere in $U2$
- $b_3$: numero di biglie bianche in $U3$
- $b_2$: numero di biglie bianche in $U2$

Per ogni possibile configurazione, possiamo distribuire le biglie nere in $U3$ e $U2$ e poi completare con le biglie bianche.

##### Combinazioni possibili per le biglie nere

Dobbiamo decidere quante delle $3$ biglie nere vanno in $U3$ e quante in $U2$. Il numero di combinazioni possibili per questa scelta è dato da:
$$\binom{3}{n_3}$$
dove $n_3$ è il numero di biglie nere in $U3$, e $\binom{3}{n_3}$ è il coefficiente binomiale, che rappresenta il numero di modi in cui possiamo scegliere $n_3$ biglie nere su $3$ totali. Poiché il numero di nere in $U2$ è $n_2 = 3 - n_3$, una volta deciso $n_3$, il numero di nere in $U2$ è automaticamente determinato.

##### Combinazioni possibili per le biglie bianche

Analogamente, dobbiamo decidere come distribuire le $2$ biglie bianche tra le urne $U3$ e $U2$. Il numero di combinazioni possibili per le bianche è dato da:
$$\binom{2}{b_3}$$
dove $b_3$ è il numero di biglie bianche in $U3$, e $\binom{2}{b_3}$ rappresenta il numero di modi in cui possiamo scegliere $b_3$ biglie bianche su $2$ totali. Poiché il numero di bianche in $U2$ è $b_2 = 2 - b_3$, anche qui, una volta deciso $b_3$, il numero di bianche in $U2$ è determinato.

##### Calcolo delle probabilità

Per ciascun macrostato, possiamo quindi calcolare la probabilità associata come rapporto tra il numero di configurazioni favorevoli e il numero totale di configurazioni possibili.

- Il numero totale di configurazioni possibili è dato da tutte le possibili combinazioni di 5 biglie (3 nere e 2 bianche) in due urne, ovvero:

$$\binom{5}{3} = \frac{5!}{3!(5-3)!} = 10$$

- Il numero di configurazioni favorevoli per ciascun macrostato è il prodotto dei coefficienti binomiali per le nere e le bianche. Per esempio, se $n_3 = 2$ e $b_3 = 1$, il numero di configurazioni è:

$$\binom{3}{2} \times \binom{2}{1} = 3 \times 2 = 6$$

- La probabilità associata a questo macrostato è quindi:


$$P(n_3 = 2, b_3 = 1) = \frac{6}{10} = 0.6$$

##### Considerazione per tutti i macrostati

Ora possiamo ripetere questo processo per tutti i possibili valori di $n_3$ e $b_3$:

- $n_3 = 3$, $b_3 = 0$: $\binom{3}{3} \times \binom{2}{0} = 1 \times 1 = 1$
- $n_3 = 2$, $b_3 = 1$: $\binom{3}{2} \times \binom{2}{1} = 3 \times 2 = 6$
- $n_3 = 1$, $b_3 = 2$: $\binom{3}{1} \times \binom{2}{2} = 3 \times 1 = 3$

##### Probabilità finali

Le probabilità per ciascun macrostato sono quindi:

- $P(n_3 = 3, b_3 = 0) = \frac{1}{10} = 0.1$
- $P(n_3 = 2, b_3 = 1) = \frac{6}{10} = 0.6$
- $P(n_3 = 1, b_3 = 2) = \frac{3}{10} = 0.3$

##### Conclusione

Le probabilità a priori associate ai diversi macrostati di colore sono:

- Il macrostato $n_3 = 3$, $b_3 = 0$ ha una probabilità di 0.1
- Il macrostato $n_3 = 2$, $b_3 = 1$ ha una probabilità di 0.6
- Il macrostato $n_3 = 1$, $b_3 = 2$ ha una probabilità di 0.3

--- 

Nel calcolo, è importante ricordare che **la determinazione di un macrostato può essere vista come una somma di eventi incompatibili, ciascuno dei quali è a sua volta il prodotto di eventi**.

È utile notare che il medesimo risultato si può ottenere modificando le regole della procedura di estrazione: ad esempio, invece di scegliere tre biglie da inserire in $U3$, potremmo estrarre due biglie per $U2$. Indipendentemente dall'approccio, il risultato finale resta invariato.