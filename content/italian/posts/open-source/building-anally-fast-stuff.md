---
date: "2023-07-31"
author: "Airscript"
title: "Building Anally Fast Stuff"
categories: ["open source", "esolangs"]
tags: ["airscript", "open source", "esolangs"]
images: ["/images/cover-analscript.png", "/logo-open-graph.png"]
summary: "A modern approach for writing anally fast stuff with Analscript."
---

![name](/images/cover-analscript.png#center)

## Introduzione
Ehilà! Sono Francesco conosciuto come Airscript sul web.  
Oggi vorrei condividere con te la mia prima esperienza nella costruzione di un [linguaggio di programmazione esoterico][esolang] volto allo scherzo: [Analscript](https://github.com/airscripts/analscript).  
Vedremo come ho cominciato, cosa ho imparato e come ho realizzato tutto questo.

## Storia Dietro Lo Scherzo
Tutto è iniziato il giorno che ho deciso di dare ai miei sponsors su GitHub dei vantaggi.  
Uno dei vantaggi è la possibilità di avere il loro username scritto in una grande varietà di esolangs.  
Perciò, quando è arrivato un nuovo sponsor, ho dovuto chiedere con quale esolang avrei dovuto scrivere il suo username...ed è stato allora che un AnalLang selvaggio è apparso.  
Sì, hai capito bene: [AnalLang][anallang].  

## Il Padre Di Analscript
Mi sono fiondato subito nell'azione e ho letto riguardo AnalLang sulla [bibbia degli esolangs][esolangs-org]. 
La prima cosa che mi salta all'attenzione, durante la lettura, è che il progetto è stato cancellato. E con lui anche il suo creatore.  
Tutto andato. Tutto.  
Ho provato a recuperarlo da [npm][npm-js] ma non è servito a niente, anche se avevo trovato il progetto originale.  
L'ho presa sul personale e ho deciso di creare un nuovo AnalLang, qualcosa che avesse tutto ciò che suo padre aveva ma con un approccio moderno.  
Ed è così che il mio viaggio ha inizio.  

## Anal-izzare Il Progetto
La prima cosa che ho fatto è stata quella di capire come AnalLang funzionasse, o almeno come era stato pensato di farlo funzionare originariamente.  
Il tutto è veramente semplice: converti i caratteri del codice [ASCII][ascii] corrispondente e scrivi N volte questa combinazione di emoji: 🍑🍆.  
Questo è, praticamente, AnalLang. Semplice, vero?

## Buttare Giù Le Fondamenta
Adesso che avevo idea di come funzionasse il tutto, mi sono fiondato a prendere delle decisioni.  
L'obiettivo era quello di realizzare tutto ciò che il papà aveva, anche il runtime di base che usava: [Node.js][node-js].  
Ho messo in piedi un progetto con l'ultima LTS fino ad oggi, la v18, e ho cominciato a sviluppare la libreria standard.  
La prima cosa su cui ho lavorato, sono state due funzioni principali: **anallify** e **stringify**. Rispettivamente una per trasformare da stringa a contenuto anal e l'altra per il contrario.  
Una volta fatto questo, ero letteralmente ad un ottimo punto del linguaggio.

## Esporre Tutto
Una volta completata la libreria standard, avevo bisogno di scegliere come gli utenti l'avrebbero utilizzato il linguaggio.  
Ho pensato di partire con due modi molto semplici: una CLI e una semplice importazione come libreria.  
Per l'ultima citata, è stato relativamente semplice: ho solamente esposto i moduli che volevo tramite l'uso di [ES Modules][javascript-modules].  
La CLI è stata leggermente più interessante da realizzare.  
Sapevi che puoi aggiungere una chiave bin nel tuo package.json e solamente quello già ti permette di generare un binario per la tua libreria? È veramente fantastico.  

```json
{
  "bin": {
    "analscript": "analscript.js"
  }
}
```
> Con questa semplice linea, quando crei un pacchetto del tuo progetto, avrai un fantastico binario da cui eseguire tutto quello che vuoi.  

Una volta fatto questo, dovevo scegliere i comandi da esporre e tutto sarebbe stato completato.  
Alla fine ho scelto di esporre anallify e stringify per fare [JIT][jit] econding e decoding per vari casi d'uso. Come fare qualcosa in una semplice pipeline per esempio.  
Allora ho aggiunto due comandi speciali che hanno donato la possibilità di usare i files .anal: **run** e **compile**.  
Compile effettua la compilazione di qualsiasi cosa tu gli dia in pasto, trasformandola in un .anal file. Run invece...puoi immaginare o provare da te.  

## Confezionare L'Intero Pacchetto
Alla fine della giornata, ho voluto donare più robustessa a tutto.  
I miei obiettivi principali erano: testing, documentazione, listing, automazione e inclusione.  
- **Testing**: questo obiettivo è stato molto semplice da realizzare e ho usato semplicemente vitest per scrivere tutti gli unit tests.  
Con l'aiuto di [@mateonunez][mateo-nunez], abbiamo anche migliorato la code coverage di tutto il progetto.  
- **Documentazione**: su questo passo ci sto ancora lavorando. Ho deciso di utilizzare [Docusaurus][docusaurus], giusto per mantere tutto dentro l'ecosistema JavaScript e ovviamente per rendere tutto più comprensibile per i futuri Analscripters.  
- **Listing**: il mondo doveva conoscere chi era il nuovo capo in città. Per questo motivo, ho aggiunto [Analscript a esolangs.org][esolangs-analscript].
- **Automazione**: chi non ama l'automazione? Analscript certamente la ama. Grazie a [CircleCI][circleci] sono stato in grado di impostare un fantastico workflow per lanciare i miei tests automatici. E questo chiude il Circle...CI.  
- **Inclusione**: che succede se non so come lanciare il progetto sulla mia macchina o se sto avendo problemi nel farlo? Semplice: ho creato una [container image][docker-hub-analscript] pronta per te. Nient'altro da aggiungere.  

## Cosa Ho Imparato
Dopo aver creato Analscript ho imparato qualcosa di valore, aldilà di tutta la conoscenza tecnica che ho ricevuto da esso: anche il più semplice dei progetti puo' esser di valore se gli dai la possibilità di esserlo.  
Pertanto fa ciò che vuoi fare! Anche se è un semplice Hello World.  
Puoi sempre imparare qualcosa di nuovo e ottenere una lezione da esso.

## Conclusione
Quindi mettendo insieme tutto, abbiamo visto la storia dietro l'idea, cos'è era AnalLang, come ho costruito Analscript e i principali aspetti su cui mi sono focalizzato per completare il progetto.  
Alla fine di tutto ogni cosa ha una lezione perciò perché non condividere anche quella con te?
Spero che questo post sia stato divertente ed informativo. Ci rivediamo in undefined giorni. Grazie.  

## Condivisione E Supporto
Se ti è piaciuto questo post, vieni a dirmelo!  
Troppa timidezza per farlo? Nessun problema. Visita [airscript.it][airscript-it] e mostra il tuo supporto seguendomi su una delle tue piattaforme social preferite.  
Se vuoi rendermi ancora più felice, seguimi, condividi o metti una stella a me e ai miei progetti su [GitHub][github].

[node-js]: https://nodejs.org
[npm-js]: https://npmjs.com
[circleci]: https://circleci.com
[docusaurus]: https://docusaurus.io/
[airscript-it]: https://airscript.it
[esolangs-org]: https://esolangs.org
[github]: https://github.com/airscripts
[ascii]: https://en.wikipedia.org/wiki/ASCII
[mateo-nunez]: https://github.com/mateonunez
[anallang]: https://esolangs.org/wiki/AnalLang
[jit]: https://en.wikipedia.org/wiki/Lean_manufacturing
[esolangs-analscript]: https://esolangs.org/wiki/Analscript
[esolang]: https://esolangs.org/wiki/Esoteric_programming_language
[docker-hub-analscript]: https://hub.docker.com/r/airscript/analscript
[javascript-modules]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules
