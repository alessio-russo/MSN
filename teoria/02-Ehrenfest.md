Tante volte un problema può essere troppo complicato per una diretta simulazione: vuoi per il gran numero di gradi di libertà coinvolti, vuoi per la intrinseca difficoltà della sua dinamica (ad esempio, instabilità numeriche).

In molti casi, questo fatto ci spinge a risolvere un problema più semplice e quindi formulare un _modello_ che ci lasci speranza di arrivare ad una soluzione.

Questo modo di procedere rappresenta la sfida di catturare gli aspetti significativi del problema originario in modo efficiente ed efficace. Un buon modello, infatti, è in grado di insegnarci qualcosa di significativo non solo per un problema particolare, ma per un numero di problemi che condividano un certo numero di aspetti universali (al di là delle particolarità di ciascuno).

Per introdurre la necessità di modellare un problema, si può partire da un esempio poco realistico: può l'aria in una stanza concentrarsi in una sola metà? Per quanto irrealistico, il problema può evocare un problema ben più rilevante: quello della _reversibilità/irreversibilità_ dei processi fisici. In più, il problema è un evidente esempio di come tante volte un problema può essere troppo complicato per una diretta simulazione.

Il [Modello di Ehrenfest](https://it.wikipedia.org/wiki/Modello_di_Ehrenfest) fornisce un buon esempio delle nozioni astratte viste fino ad ora.
Per introdurlo, si passa dal parlare di un numero stratosferico di molecole di gas in una stanza a descrivere un gioco di estrazione:
- $N$ biglie sono disposte in $2$ urne ($n$ in una e $N-n$ nell'altra);
- si estrae un numero tra $1$ ed $N$ e si sposta la biglia etichettata con quel numero nell'altra urna.

Si può pensare di procedere in maniera iterativa con l'estrazione e verificare se, analogamente all'esempio delle $3$ carte, si verifichi una situazione di equilibrio all'aumentare del numero $k$ di iterazioni.

Dopo diversi ragionamenti, si è concluso che il macro-stato migliore (minimo) per descrivere il sistema è il numero di biglie contenuto in una delle due urne.
Questa informazione è infatti sufficiente per andare a lavorare sulla dinamica del sistema e offre una notazione molto compatta ed elegante per un problema che a primo impatto può risultare più complesso.

Un'implementazione intuitiva può quindi essere descritta come segue:
1. $n_1$ è il numero di biglie contenute nella prima urna e $N$ il numero totale di biglie;
2. si estrae un numero $k \in [1, N]$;
3. se $k > n_1$ significa che è stata estratta una biglia presente nell'altra urna, per cui $n_1 \leftarrow n_1 + 1$;
4. se $k \leq n_1$ significa che è stata estratta una biglia presente nella prima urna, per cui $n_1 \leftarrow n_1 - 1$.

La formulazione di questo modello rende possibile avviare delle simulazioni per studiare l'evoluzione del sistema in esame. Dopo una prima valutazione, è semplice notare che:
- partendo da una situazione in cui le biglie si trovano tutte in una delle due urne, dopo un numero sufficiente di estrazioni si raggiunge una _situazione di equilibrio_, in cui le biglie sono divise nelle urne in maniera equa;
- partendo da una situazione in cui le biglie sono divise in maniera equa, invece, il sistema non si allontana dalla configurazione iniziale, anche dopo un numero elevato di estrazioni.

Queste osservazioni sono compatibili con il modello di partenza (molecole di gas in una stanza) e questo significa che quello utilizzato per la simulazione è un buon modello, essendo in grado di catturare informazioni importanti senza perdere di generalità.

# Distribuzione Stazionaria

Dopo vari esperimenti numerici tramite simulazioni è semplice notare che le frequenze tendono a stabilizzarsi dopo un certo numero di iterazioni. Questa proprietà è indicativa del fatto che esista una _distribuzione di probabilità_ che descriva bene il processo di evoluzione.

La prima proprietà osservata nelle simulazioni è che
$$ \lim_{T \to \infty} \frac{1}{T} \sum_{t=1}^T n(t) = \frac{1}{2} $$
dove $n(t)$ è il valore di $n$ (biglie nell'urna di riferimento $U_r$) al tempo $t$.

Si indicherà con $P_n(t)$ la probabilità di verificare $n(t)$, ovvero di avere $n$ biglie nell'urna di riferimento e $N-n$ nell'altra. 

La probabilità di trovare $n$ biglie nell'urna $U_r$ al tempo $t+1$ è uguale alla somma tra: 
- la probabilità di trovare $n-1$ biglie al tempo $t$ moltiplicata per la probabilità di estrarre una biglia dall'altra urna; e
- la probabilità di trovare $n+1$ biglie al tempo $t$ moltiplicata per la probabilità di estrarre una biglia dall'urna $U_r$.

La probabilità di estrarre una biglia da una delle due urne viene calcolata a priori tramite il rapporto fra _casi favorevoli_ (numero di biglie nell'urna) e _casi totali_ (numero di biglie totali).
L'equazione di evoluzione temporale risulta quindi:
$$ P_n(t+1) = P_{n-1}(t) \frac{N-n+1}{N} + P_{n+1}(t) \frac{n+1}{N}$$
### Funzione generatrice
$$ \rho(x, t) = \sum_{n=0}^N P_n(t) \ x^n $$
Da notare che:
1. è un polinomio di grado $N$ nella variabile $x$, che era estranea dal problema originario;
2. è dipendente dal tempo tramite i coefficienti $P_n(t)$;
3. il suo valore (o delle derivate) in $x=0, x=1$ offre informazioni sui coefficienti.
	- $\rho(x=1, t) = \sum_{n=0}^N P_n(t) = 1$ è la condizione di normalizzazione;
	- $\rho(x=0, t) = P_0(t)$ 
	- $\frac{d}{dx} \rho(x,t) = \sum_{n=1}^N P_n(t) \, n \, x^{n-1} \Rightarrow \frac{d}{dx} \rho(x=0,t) = P_1(t)$ 
	- $\frac{d^2}{dx^2} \rho(x,t) = \sum_{n=2}^N P_n(t) \, n (n-1) \, x^{n-2} \Rightarrow \frac{d^2}{dx^2} \rho(x=0,t) = 2 P_2(t)$ 
		...
	- $\frac{d^n}{dx^n} \rho(x=0,t) = n! \, P_n(t)$ 

Riscrivendo l'equazione di evoluzione temporale in termini della funzione generatrice, si ottiene:
$$ \sum_{n=0}^N P_n(t+1) x^n = \rho(x, t+1) = \frac{1}{N} \sum_{n=1}^N P_{n-1}(t) (N-n+1) x^n + \frac{1}{N} \sum_{n=0}^N P_{n+1}(t) (n+1) x^n $$
$$ = \sum_{n=1}^N P_{n-1}(t) x^n - \frac{1}{N} \sum_{n=1}^N P_{n-1}(t) (n-1) x^n + \frac{1}{N} \sum_{n=0}^N P_{n+1}(t) (n+1) x^n$$
Per quanto detto fin ora, vale che:
- $\sum_{n=1}^N P_{n-1}(t) x^n = x \sum_{n=1}^N P_{n-1}(t) x^{n-1} = x \ \rho(x,t)$  (primo termine); 
- $\sum_{n=1}^N P_{n-1}(t) (n-1) x^n = x^2 \sum_{n=2}^N P_{n-1}(t)(n-1)x^{n-2} =x^2 \frac{d}{dx} \rho(x, t)$  (secondo termine);
- $\sum_{n=0}^N P_{n+1}(t)(n+1)x^n = \frac{d}{dx} \rho(x,t)$  (terzo termine).

Per cui, $$ \rho(x, t+1) = x \ \rho(x,t) - \frac{1}{N} \ x^2 \frac{d}{dx} \rho(x, t) + \frac{1}{N} \frac{d}{dx} \rho(x,t)$$
e, moltiplicando entrambi i termini per $N$, si ottiene:
$$ N \rho(x, t+1) = N x \ \rho(x,t) - x^2 \frac{d}{dx} \rho(x, t) + \frac{d}{dx} \rho(x,t) $$
$$ = x \ \rho(x,t) + \left(1-x^2\right) \ \frac{d}{dx} \rho(x,t) $$

Dopo aver dimostrato queste proprietà, si ricorda che l'obiettivo è quello di studiare la quantità $$ p_n = \lim_{t \to \infty}{P_n(t)} $$se questa quantità esiste, allora vale anche: $$ \lim_{t \to \infty}{\rho(x, t)} = \rho(x) = \sum_n \, p_n \, x^n$$che, detto in altri termini, indica la perdita di dipendenza dal parametro $t$ nel limite.
Facendo uso dei passaggi elencati sopra, è possibile dire che:
$$ N \rho(x) = N x \ \rho(x) + \left(1-x^2\right) \ \frac{d}{dx} \rho(x) $$
$$ = N(1-x)\rho(x) = \left(1 - x^2\right) \frac{d}{dx} \rho(x) $$
$$ = \frac{\frac{d}{dx} \rho(x)}{\rho(x)} = \frac{N}{1+x} $$
Quest'ultima è una _equazione differenziale del prim'ordine_, dato che:
- la funzione $\rho(x)$ è incognita;
- la funzione $\rho(x)$ deve soddisfare delle relazioni che legano tra di loro:
	- una funzione di $x$, ovvero il secondo termine dell'equazione;
	- la funzione incognita stessa;
	- la derivata della funzione incognita;
- la derivata di grado massimo è la prima.

Se si definisce $\rho(x) = \mathcal{N} (1+x)^N$ è possibile notare che, per ogni $\mathcal{N}$ costante, vale:
$$ \frac{d}{dx} \mathcal{N} (1+x)^N = \mathcal{N} N (1+x)^{N-1} \Longrightarrow 
 \frac{\frac{d}{dx} \mathcal{N} (1+x)^N}{\mathcal{N} (1+x)^N} = \frac{N}{1+x} $$
Per la condizione di normalizzazione già esplicitata in precedenza, è necessario ottenere: $$ \rho(x=1) = \mathcal{N} (1+x)^N = 1 $$Si riprende utilizzando il [binomio di Newton](https://it.wikipedia.org/wiki/Teorema_binomiale), da cui segue
$$ (1+x)^N = \sum_{n=0}^N \binom{N}{n} x^n \Longrightarrow \rho(x) = \mathcal{N} \, \sum_{n=0}^N \binom{N}{n} x^n $$
e, dato che deve valere $\rho(x) = \sum_n \, p_n \, x^n$, si conclude facilmente che:
$$ p_n = \mathcal{N} \, \binom{N}{n}$$
Inoltre, dalla condizione di normalizzazione, deve valere:
$$ \sum_{n=1}^N \mathcal{N} \, \binom{N}{n} = 1 = \rho(x=1)$$
Unendo ora la definizione di funzione generatrice con i passaggi svolti fin ora, si ottiene:
$$ \rho(x) = \mathcal{N} (1+x)^N \Longrightarrow \rho(x=1) = \mathcal{N}(1+1)^N = \mathcal{N} \, 2^N \Longrightarrow \mathcal{N} = 2^{-N}$$
Si può riscrivere tutto in termini del valore di $\mathcal{N}$:
$$ \rho(x) = 2^{-N} \sum_{n=0}^N \binom{N}{n} x^n = \sum_{n=0}^N p_n \, x^n 
\Longrightarrow p_n = 2^{-N} \binom{N}{n} $$
Possiamo riscrivere le probabilità $p_n$ in questo modo:
$$ p_n = \binom{N}{n} \left(\frac{1}{2}\right)^n \left(1 - \frac{1}{2}\right)^{N-n}$$
Convincendosi di questo, ci si accorge che la formula corrisponde alla _funzione di densità probabilistica_ della [distribuzione binomiale](https://it.wikipedia.org/wiki/Distribuzione_binomiale), ovvero:
$$\mathcal{B}_{N,\,p}(n) , \; p=\frac{1}{2} $$
Negli appunti a seguire verrà studiata più nel dettaglio questa distribuzione, con particolare attenzione ai [momenti](https://it.wikipedia.org/wiki/Momento_(probabilit%C3%A0)) e alla relazione con la [matrice stocastica](https://it.wikipedia.org/wiki/Matrice_stocastica) del processo.

