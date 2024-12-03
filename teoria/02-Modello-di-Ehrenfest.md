
# Modello di Ehrenfest

---
**Indice**
```table-of-contents
```
---

Può l'aria in una stanza concentrarsi in una sola metà? Per quanto irrealistico, questo problema ci permette di introdurre concetti piuttosto rilevanti: 

- quello della **reversibilità** e **irreversibilità** dei processi fisici
- il problema è un evidente esempio di come tante volte _un problema può essere troppo complicato per una diretta simulazione_ e.g. per il gran numero di **gradi di libertà** coinvolti (ovvero, il numero di variabili che descrivono il sistema) o per l'intrinseca difficoltà della sua dinamica

In molti casi, l'impossibilità di simulare direttamente un problema ci spinge a _formulare un modello_ che semplifichi il problema da risolvere (e.g. riducendo il numero di gradi di libertà o per la possibilità di tenere sotto controllo la dinamica di evoluzione). E' importante sottolineare che questo modo di procedere non è una fuga dal problema originario, ma rappresenta la sfida di _catturare gli aspetti significativi del problema originario_ in modo efficiente ed efficace. 

**Nota.** Non a caso, un buon modello è in grado di rappresentare in modo significativo non solo un problema particolare, ma un insieme di problemi che condividano un certo numero di aspetti universali.

Introduciamo il **modello di Ehrenfest**, che rappresenta un modello capace di catturare gli aspetti rilevanti del problema in esame in una formulazione per cui la simulazione è assai semplice. Il problema di modellare lo spostamento di un certo numero di molecole di gas in una stanza può essere descritto attraverso un gioco di estrazione:

$N$ biglie (che rappresentano le molecole del gas) possono essere disposte in $2$ urne (le due metà della stanza), e una semplice regola di estrazione sposta le biglie da un'urna all'altra. Se si estrae casualmente un numero tra $1$ ed $N$ e si cambia urna alla biglia etichettata con quel numero 

Per implementare la simulazione del modello di Ehrenfest (e, più in generale, un modello) occorre innanzitutto:

1. Individuare i gradi di libertà (le variabili) che descrivono il sistema e codificarle all'interno del programma
2. Identificare la _dinamica_ di evoluzione del sistema e codificarlo in un _algoritmo_ che descrive (a livello astratto) la dinamica di evoluzione del sistema

In particolare, le seguenti soluzioni rappresentano possibili implementazioni del modello:

Se $N$ sono le biglie complessivamente presenti nel sistema, dividiamo tutti i numeri da $1$ a $N$ in due vettori ($U_1$ e $U_2$). L'algoritmo che simula l'evoluzione del modello di Ehrenfest è il seguente: 

- Si estrae un numero da $1$ ad $N$  (`x = randi(N)`)
- Si individua il vettore che contiene la biglia (`i1 = find(U1==x)` e `i2 = find(U2==x)`) 
- Supponendo che la biglia `x` sia stata trovata in $U_2$, allora si può procedere inserendo `x` in $U_1$ (`U1(end+1)=x`) e rimuovendo `x` da $U_2$  `U2(i1) = []`

Ripetendo quest'operazione per $T$ volte si può simulare il passaggio di una molecola di gas da una parte all'altra di una stanza nel tempo.

È facile convincersi che così facendo si sta utilizzando una **descrizione ridondante**: sapendo cosa c'è in $U_1$, è noto per complemento cosa c'è in $U_2$.  In questo caso, si può introdurre uno schema di simulazione efficace, che può essere espresso in termini di **numeri di occupazione**: 

- Definiamo un (singolo) vettore che descrive non tanto una urna, quanto l'insieme delle biglie
- L'_individualità_ delle biglie (nel senso della loro **enumerazione**) è resa associando a ciascuna biglia una particolare entrata del vettore. Così, la prima entrata descrive la biglia numero 1, la seconda la 2, e così via. 
- La presenza di una biglia in un'urna o nell'altra si codifica fissando l'entrata corrispondente al valore $0$ se la biglia è nella prima urna, oppure a $1$ se la biglia è nella seconda urna (si parla in questo caso di _numero di occupazione_). Chiaramente, è sufficiente rappresentare un solo vettore, perché la conoscenza dell'altra urna viene per complemento

La simulazione può procedere quindi estraendo un numero intero compreso fra $1$ e $N$ (numero di biglie a disposizione) e negando il contenuto della corrispondente entrata del vettore $U_1$ 

Se si avvia la simulazione sopra descritta a partire da un caso limite 

![[Screenshot 2024-09-30 alle 10.01.32.png]]

è possibile osservare che il sistema tende ad una condizione in cui le biglie sono divise circa a metà tra le due urne

![[Screenshot 2024-09-30 alle 10.00.58.png]]

E' quindi possibile affermare che: 

- Il modello cattura bene la questione della reversibilità/irreversibilità del processo: a partire da una situazione **fuori equilibrio** (biglie concentrate in una sola urna), si raggiunge una situazione di **equilibrio** (biglie sostanzialmente equidistribuite), mentre partendo all'equilibrio non riusciamo ad allontanarcene troppo

- Nel passaggio da una configurazione fuori equilibrio ad una di equilibrio è chiaramente riconoscibile il _verso del tempo_. Viceversa, non appena si raggiunge l'equilibrio, se si osserva l'evoluzione del sistema è impossibile accorgersi del _verso in cui succedono le cose_

**Nota.** Il punto oltre il quale si raggiunge una situazione di equilibrio è detto **transiente**

E' quindi possibile introdurre il concetto di _irreversibilità_ di un processo: mentre è **estremamente probabile** che avvenga in un verso, è **estremamente improbabile** che avvenga nell'altro.

E' importante sottolineare che ci sono dettagli presenti nell'esperimento fattuale (con le urne e le biglie "reali") che possono essere assenti nell'esperimento numerico. Ad esempio, è possibile notare che, nella pratica, una certa biglia occupa una certa posizione nell'urna, a cui noi diventiamo indifferenti nel nostro programma. Allo stesso modo, ulteriori dettagli potrebbero essere il colore o il peso delle biglie, a cui pure siamo indifferenti.

Questo si esprime dicendo che _tanti diversi **microstati** del sistema vengono tradotti in un unico **macrostato** nella nostra descrizione di esso_

In questo caos, una biglia può assumere tante diverse posizioni entro l'urna, ma l'unica informazione che noi registriamo è che essa è presente in una o nell'altra urna.

All'interno del modello di Ehrenfest, il macrostato "per eccellenza" è il **numero di biglie in un'urna** (ricordando che il numero di biglie nell'altra si ottiene per complemento). E' quindi possibile (e ha spesso senso farlo) costruire una simulazione che si concentri sul macrostato "per eccellenza". Si noti quindi che l'intero sistema può essere descritto attraverso un unico valore numerico.

Di seguito vengono presentate le conclusioni della simulazione, alcune già menzionate ma ora arricchite con ulteriori considerazioni, relative a sistemi di dimensioni "non troppo piccole":

1. Partendo da una condizione iniziale fuori equilibrio (tutte le biglie in un'unica urna e nessuna nell'urna oggetto della nostra osservazione), il sistema evolve verso uno stato in cui il numero di biglie in ciascuna urna oscilla intorno al valore $N/2$.
2. La prima fase dell'evoluzione è quella che mostra l'andamento sistematico più evidente: si osserva un aumento costante del numero di biglie fino a raggiungere un valore vicino a $N/2$.
3. **Le fluttuazioni attorno a $N/2$ variano significativamente in base alla dimensione del sistema**: più grande è il sistema, minori sono le fluttuazioni percentuali attorno a $N/2$. Questo è uno degli aspetti che rende il modello particolarmente efficace, in quanto riflette il comportamento tipico associato al raggiungimento del **limite termodinamico** nei sistemi fisici macroscopici: **all’aumentare dei gradi di libertà** (il numero di biglie) **le fluttuazioni percentuali diminuiscono**
4. Infine, non si riscontrano situazioni in cui il sistema torni alla condizione iniziale di fuori equilibrio, confermando così il principio di **irreversibilità**

**Nota.** Le _fluttuazioni percentuali_ si riferiscono alle variazioni, espresse in termini percentuali, di una quantità rispetto al suo valore medio o atteso. In questo contesto, si tratta delle variazioni del numero di biglie presenti in un'urna attorno al valore medio $N/2$.

È importante notare, però, che quando la dimensione del sistema diventa piccola, questi comportamenti cambiano. Infatti, per un valore di $N$ dell'ordine di 10, le fluttuazioni percentuali possono raggiungere il 100%. Ciò implica che il ritorno alla condizione iniziale (tutte le biglie in una sola urna) **non è così improbabile**: il processo, quindi, non mostra in modo evidente la caratteristica dell'irreversibilità.

In sostanza, stiamo sviluppando un linguaggio che permetta di esprimere in modo preciso il concetto di **reversibilità** e **irreversibilità**. Nei sistemi di grandi dimensioni, la probabilità di tornare alla condizione iniziale (che è molto distante dalla situazione di equilibrio) è estremamente bassa. Al contrario, nei sistemi più piccoli, questa probabilità non è poi così trascurabile. In altre parole, **l’irreversibilità nei sistemi macroscopici** non è dovuta a qualcosa di impossibile, ma piuttosto a un evento che è estremamente improbabile.

## Riflessioni sul modello di Ehrenfest

Dopo aver osservato la **stabilizzazione** del sistema una volta superato un transiente iniziale, possiamo dedurre l'esistenza di una ben definita _distribuzione di probabilità_ che descrive asintoticamente il processo.

**Distribuzione Stazionaria**

A conti fatti, la distribuzione stazionaria risulta essere una distribuzione binomiale:

$$
P(n) = \binom{N}{n} p^n (1-p)^{N-n}
$$

Dove

- $P(n)$ rappresenta la probabilità che in una delle due urne ci siano $n$ biglie
- $N$ è il numero totale di biglie.
- $p$ è la probabilità che una biglia si sposti da un'urna all'altra.

Una volta raggiunto l'equilibrio, ogni biglia ha una probabilità del 50% di spostarsi da un'urna all'altra. Il processo di Ehrenfest, quindi, si comporta come una sequenza di **prove ripetute**, modellabile tramite una variabile aleatoria binomiale con parametri $N$ e $p$.