# Modelli-di-variabili-aleatorie

---
**Indice**
```table-of-contents
```
---

Alcuni tipi di variabili aleatorie compaiono molto frequentemente in natura

## Variabili aleatorie di Bernoulli

Una variabile aleatoria $X$ si dice di **Bernoulli** se può assumere solo i valori $0$ e $1$, con probabilità rispettivamente $1 - p$ e $p$, dove $p \in [0, 1]$. La sua funzione di massa di probabilità è:

$$
P(X = x) = \begin{cases}
p & \text{se } x = 1, \\
1 - p & \text{se } x = 0.
\end{cases}
$$

Il suo **valore atteso** è $E[X] = p$, mentre la sua **varianza** è $\operatorname{Var}(X) = p(1 - p)$.

Un **processo di Bernoulli** è una successione di variabili aleatorie indipendenti $X_i$ con uguale distribuzione di Bernoulli $\mathcal{B}(p)$.

La **distribuzione binomiale** descrive la probabilità del numero di successi in $n$ prove di Bernoulli indipendenti, ovvero della variabile aleatoria:

$$
S_n = X_1 + X_2 + \dots + X_n.
$$

## Variabili aleatorie binomiali

Quando si effettuano $n$ ripetizioni **indipendenti** di un esperimento binario, ciascuna con probabilità di successo $p$ e di fallimento $1 - p$, il numero totale di successi $S_n$ è una variabile aleatoria **binomiale** $\mathcal{B}(n, p)$.

Il coefficiente binomiale è definito come:

$$
\binom{n}{i} = \dfrac{n!}{i! (n - i)!}.
$$

La **funzione di massa di probabilità** di una variabile aleatoria binomiale è:

$$
P(S_n = i) = \binom{n}{i} p^i (1 - p)^{n - i}, \quad \text{per } i = 0, 1, \dots, n.
$$

Il suo **valore atteso** è:

$$
E[S_n] = n p,
$$

mentre la sua **varianza** è:

$$
\operatorname{Var}(S_n) = n p (1 - p).
$$

La figura rappresenta il grafico della funzione di massa di una variabile binomiale con parametri $n = 10$ e $p = 0{,}5$, che risulta simmetrica rispetto al valore medio.

![[Pasted image 20241103164907.png|350]]

## Variabili aleatorie di Poisson

Una variabile aleatoria $X$ che assume valori interi non negativi $i = 0, 1, 2, \dots$ si dice **di Poisson** di parametro $\lambda > 0$ se la sua funzione di massa di probabilità è:

$$
P(X = i) = \dfrac{e^{-\lambda} \lambda^i}{i!}.
$$

Il parametro $\lambda$ rappresenta sia il **valore atteso** $E[X] = \lambda$ sia la **varianza** $\operatorname{Var}(X) = \lambda$.

**Nota.** Le variabili di Poisson vengono spesso utilizzate come approssimazione delle variabili binomiali $\mathcal{B}(n, p)$ quando $n$ è molto grande e $p$ è molto piccolo, mantenendo $\lambda = n p$ costante.

La figura illustra il grafico della funzione di massa di una variabile di Poisson con parametro $\lambda = 4$.

![[Pasted image 20241103165152.png|300]]

**Nota.** La distribuzione di Poisson viene spesso utilizzata per modellare il numero di eventi in un intervallo di tempo, dato un tasso medio di occorrenza $\lambda$
## Variabili aleatorie gaussiane

Una variabile aleatoria $X \sim \mathcal{N}(\mu, \sigma^2)$ si dice **gaussiana** (o **normale**) di parametri $\mu$ e $\sigma^2$ se ha la seguente funzione di densità di probabilità:

$$
f(x) = \dfrac{1}{\sqrt{2\pi \sigma^2}} \exp\left( -\dfrac{(x - \mu)^2}{2\sigma^2} \right).
$$

La funzione di densità è una curva a campana, detta **curva di Gauss**, simmetrica rispetto a $x = \mu$, con massimo in $x = \mu$ di altezza $(\sigma \sqrt{2\pi})^{-1} \approx 0{,}399/\sigma$.

Il **valore atteso** è $E[X] = \mu$, mentre la **varianza** è $\operatorname{Var}(X) = \sigma^2$.

**Nota.** Il momento secondo è $E[X^2] = \sigma^2 + \mu^2$.

**Proposizione.** Se $X \sim \mathcal{N}(\mu, \sigma^2)$ e $Y = \alpha X + \beta$ con $\alpha \neq 0$, allora $Y \sim \mathcal{N}(\alpha \mu + \beta, \alpha^2 \sigma^2)$.

La variabile standardizzata:

$$
Z = \dfrac{X - \mu}{\sigma}
$$

segue una distribuzione **normale standard** $\mathcal{N}(0, 1)$.

 Il grafico della funzione di densità di una normale standard mostra la classica forma a campana centrata in zero.

![[Pasted image 20241103170100.png|300]]

La **funzione di ripartizione** della normale standard è indicata con $\Phi$ ed è definita come:

$$
\Phi(x) = P(Z \leq x) = \dfrac{1}{\sqrt{2\pi}} \int_{-\infty}^{x} e^{-y^2/2} \, dy.
$$

Poiché $Z = \dfrac{X - \mu}{\sigma}$, possiamo esprimere le probabilità relative a $X$ in termini di $\Phi$:

$$
P(X < b) = \Phi\left( \dfrac{b - \mu}{\sigma} \right).
$$

Per $a < b$:

$$
P(a < X < b) = \Phi\left( \dfrac{b - \mu}{\sigma} \right) - \Phi\left( \dfrac{a - \mu}{\sigma} \right).
$$

L'integrale che definisce $\Phi(x)$ non ha una soluzione analitica esatta; si utilizzano tabelle o approssimazioni numeriche.

![[Pasted image 20241107114743.png]]

Poiché la normale standard è simmetrica rispetto a zero:

$$
\Phi(-x) = 1 - \Phi(x).
$$

Per ogni $\alpha \in (0, 1)$, definiamo $z_\alpha$ come:

$$
P(Z > z_\alpha) = \alpha \quad \Rightarrow \quad z_\alpha = \Phi^{-1}(1 - \alpha).
$$

Il **quantile** $k$-esimo della normale standard è il valore $m$ tale che:

$$
\Phi(m) = \dfrac{k}{100}.
$$

Ponendo $k = 100(1 - \alpha)$, otteniamo $z_\alpha$, indicando che la normale standard è inferiore a $z_\alpha$ nel $k\%$ dei casi.

## Variabili aleatorie esponenziali

Una variabile aleatoria continua $X$ si dice **esponenziale** con parametro $\lambda > 0$ se la sua funzione di densità di probabilità è:

$$
f(x) = \begin{cases}
\lambda e^{-\lambda x} & \text{se } x \geq 0, \\
0 & \text{se } x < 0.
\end{cases}
$$

La **funzione di ripartizione** è:

$$
F(x) = P(X \leq x) = \begin{cases}
1 - e^{-\lambda x} & \text{se } x \geq 0, \\
0 & \text{se } x < 0.
\end{cases}
$$

La distribuzione esponenziale modella tipicamente il **tempo di attesa** prima che si verifichi un evento casuale. Il suo **valore atteso** è:

$$
E[X] = \dfrac{1}{\lambda},
$$

il **momento secondo** è:

$$
E[X^2] = \dfrac{2}{\lambda^2},
$$

e la **varianza** è:

$$
\operatorname{Var}(X) = \dfrac{1}{\lambda^2}.
$$

La proprietà fondamentale è l'**assenza di memoria**:

$$
P(X > s + t \mid X > t) = P(X > s), \quad \forall s, t \geq 0.
$$

---

**Esempio.** Se $X$ rappresenta il tempo di vita di un oggetto, sapendo che ha già funzionato per un tempo $t$, la probabilità che continui a funzionare per un ulteriore tempo $s$ è la stessa che avrebbe avuto all'inizio.

---

Per la distribuzione esponenziale, vale:

$$
P(X > s + t) = P(X > s) P(X > t).
$$

Questo riflette la proprietà di assenza di memoria, poiché la probabilità che l'evento non si sia verificato entro $s + t$ è il prodotto delle probabilità di non verificarsi in $s$ e $t$.
