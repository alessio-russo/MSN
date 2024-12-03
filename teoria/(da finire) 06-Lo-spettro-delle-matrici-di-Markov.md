
# Lo spettro delle matrici di Markov

---
**Indice**
```table-of-contents
```
---

## Richiami di algebra lineare

Gli autovalori e gli autovettori sono concetti fondamentali dell'algebra lineare, utilizzati per analizzare matrici e trasformazioni lineari. Gli autovalori, indicati generalmente con la lettera $\lambda$, sono numeri associati a una matrice quadrata o a una trasformazione lineare. Gli autovettori, invece, sono vettori non nulli che, quando sottoposti alla trasformazione rappresentata dalla matrice, mantengono la loro direzione originale, variando solo in lunghezza.

Matematicamente, se $A$ è una matrice quadrata, un autovalore $\lambda$ e un autovettore $v$ soddisfano la relazione $A\cdot v = \lambda\cdot v$, dove $v$ è un vettore non nullo e $\lambda$ è uno scalare. Per trovare gli autovalori, si risolve l'equazione caratteristica $\det(A - \lambda I) = 0$, dove $I$ è la matrice identità e $⁡\det$ rappresenta il determinante della matrice. Le soluzioni di questa equazione sono gli autovalori della matrice. Una volta determinati gli autovalori, è possibile calcolare gli autovettori risolvendo il sistema lineare $(A - \lambda I)v = 0$.

## Autovalori e autovettori di una matrice stocastica

Il calcolo degli autovalori e degli autovettori per una matrice stocastica, ovvero tale che 1) $W_{i,j} \ge 0$
e 2) $\sum_i\ W_{i,j} = 1$, 