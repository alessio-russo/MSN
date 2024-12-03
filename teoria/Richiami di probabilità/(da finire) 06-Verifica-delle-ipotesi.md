# Verifica delle ipotesi

---
**Indice**
```table-of-contents
```
---

Supponiamo, ancora una volta, di disporre di un campione aleatorio proveniente da una distribuzione che ci è nota tranne che per uno o più parametri incogniti. La nuova chiave di lettura non prevede più di stimare direttamente questi parametri, ma piuttosto di utilizzare il campione raccolto, per verificare qualche ipotesi che li coinvolga.

Un'**ipotesi statistica** è normalmente un'affermazione su uno o più parametri della distribuzione di popolazione. Ovviamente, si parla di ipotesi perché a priori non sappiamo determinare se i valori di un campione aleatorio e l'ipotesi fatta siano compatibili oppure no.

**Nota.** Quando accettiamo (o rifiutiamo) un'ipotesi, non stiamo affermando che essa sia necessariamente vera (o falsa), ma soli che i dati raccolti sono accettabilmente in accordo (o in disaccordo) con essa.
## Livelli di significatività

Data una popolazione avente distribuzione $F_\theta$ che dipende da un parametro incognito $\theta$, supponiamo di voler verificare una qualche ipotesi su $\theta$, che chiameremo **ipotesi nulla**, e denoteremo con $H_0$. 

Se $F_\theta$ è una distribuzione normale con media $\theta$ e varianza $1$, due possibili ipotesi nulle su $\theta$ sono:

1. $H_0 : \theta = 1$
2. $H_0 : \theta \le 1$

La prima di queste ipotesi afferma che la popolazione ha distribuzione $\mathcal{N}(1,1)$, mentre la seconda sostiene che essa è normale, con varianza $1$ e media non superiore a $1$. 

Si noti che l'ipotesi nulla $1$, quando è vera, caratterizza completamente la distribuzione della popolazione, mentre questo non è vero per l'ipotesi nulla $2$. Nel primo caso si parla allora di ipotesi **semplice**, mentre nel secondo si parla di ipotesi **composta**.

Supponiamo di disporre di un campione aleatorio $X_1, \dots, X_n$, proveniente da questa popolazione, e di volerlo utilizzare per eseguire una verifica (o **test**) di una certa ipotesi nulla $H_0$. Siccome bisogna decidere se accettare o meno $H_0$ basandosi esclusivamente sugli $n$ valori dei dati, il test sarà definito da una regione $C$ nello spazio a $n$ dimensioni, con l'intesa che se il vettore $(X_1, \dots, X_n)$ cade all'interno di $C$ l'ipotesi viene rifiutata, mentre viene accattata in caso contrario.  Una regione $C$ con queste caratteristiche viene detta **regione critica** del test. Schematizzando quanto detto, il **test statistico** determinato dalla regione critica $C$ è quello che accetta $H_0$ se $(X_1, \dots, X_n) \notin C$ e rifiuta $H_0$ se $(X_1, \dots, X_n) \in C$


**Nota.** Il **p dei dati** (o **p-value** del test) è quel particolare valore del livello di significatività per cui la decisione cambia da $H_0$ a $H_1$
