Per iniziare a familiarizzare con il termine *simulazione*, si consideri il famoso [Problema di Monty Hall](https://it.wikipedia.org/wiki/Problema_di_Monty_Hall), rappresentato in questo caso da 3 carte, di cui una sola vincente.

Dopo una prima scelta del giocatore a carte coperte, il mazziere scopre una carta NON vincente tra le carte NON scelte. A questo punto al giocatore viene chiesto se vuole mantenere la sua scelta o cambiarla con l'altra carta rimasta. Quale scelta conviene prendere al giocatore per vincere?

Utilizzando la cosiddetta formula classica della probabilità a priori è possibile descrivere bene il problema e dare una risposta consistente, ma per il momento verrà utilizzato un approccio più intuitivo. 

Uno dei modi per farlo è, infatti, cercare di simulare il problema al calcolatore, seguendo uno schema ben preciso:
1. individuare i *gradi di libertà del sistema e farli corrispondere a variabili nel programma;
2. descrivere la *dinamica del sistema*, ovvero le regole che ne descrivono l'*evoluzione*, in termini di codice. 

### Approccio frequentista

La simulazione calcola le frequenze di vittoria a seconda della strategia scelta dal giocatore, che possiamo riassumere in 3 casi:
- mantenere la scelta originale;
- cambiare scelta;
- scegliere a caso se mantenere o cambiare scelta.

La frequenza di realizzazione di un evento è calcolabile come numero di realizzazioni diviso numero di tentativi effettuati. Queste frequenze tendono a stabilizzarsi su valori precisi, che corrispondono proprio ai valori delle probabilità a priori. 
In particolare, le strategie descritte sopra hanno probabilità di vittoria $1 \over 3$, $2 \over 3$ e $1 \over 2$, rispettivamente.
