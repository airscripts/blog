# 🪶 Blog 
[English](./README.md) | [Italian](./README.it-IT.md)  

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/Airscripts/blog/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/Airscripts/blog/tree/main) [![Netlify Status](https://api.netlify.com/api/v1/badges/59826574-7ccb-4c30-a776-942044cf9520/deploy-status?branch=main)](https://app.netlify.com/sites/regal-sunshine-3cc2d8/deploys)  

Questo repository contiene il codice sorgente e i contenuti del mio blog ospitato su [blog.airscript.it](https://blog.airscript.it).

## 📦 Installazione  
Per poter contribuire a questo progetto, è necessario avere un ambiente di sviluppo funzionante.  
Seguite gli step descritti di seguito per averne uno completamente funzionante.  
E' necessario seguire un solo percorso tra *Classic* e *Dev Container*.

### Classic  

1. Assicuratevi che queste dipendenze siano installate sul vostro computer:
- [Bash](https://www.gnu.org/software/bash/)
- [Make](https://www.gnu.org/software/make/)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

2. Clonate questo repository: 
    ```bash
    git clone https://github.com/Airscripts/blog.git
    ```

3. Eseguite i seguenti comandi nella cartella principale del repository:
    ```bash
    make all
    ```

4. Tutto dovrebbe essere configurato e funzionante sulla porta 25001.  

### Dev Container  

1. Assicuratevi che queste dipendenze siano installate sul vostro computer:
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Bash](https://www.gnu.org/software/bash/)
- [Docker](https://docs.docker.com/get-docker/)
- [Visual Studio Code](https://code.visualstudio.com/Download)
- [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

2. Clonate questo repository: 
    ```bash
    git clone https://github.com/Airscripts/blog.git
    ```

3. Aprite Visual Studio Code e confermate la volontà di aprire il repository in un devcontainer.  
Per farlo funzionare, assicuratevi di aver installato l'estensione *Dev Containers*.

4. Eseguite i seguenti comandi nella cartella principale del repository:
    ```bash
    make all
    ```

5. Tutto dovrebbe essere configurato e funzionante sulla porta 25001.

## 🤝 Contribuire  
Contributions and suggestions about how to improve the blog are welcome!

## 💚 Supporto  
Se volete sostenere il mio lavoro potete farlo con i link qui sotto.

Scegliete quello che trovate più adatto a voi:
- [Support me on GitHub](https://github.com/sponsors/Airscripts)
- [Support me via ko-fi](https://ko-fi.com/airscript)
- [Support me via linktr.ee](https://linktr.ee/airscript)

## 💳 Licenze  
Questo repository ha una doppia licenza.  
Ciò significa che per il codice sorgente si applica la [Licenza MIT](https://github.com/Airscripts/blog/blob/main/LICENSE_MIT) e per i post del blog la [Creative Commons Attribution 4.0 International](https://github.com/Airscripts/blog/blob/main/LICENSE_CC_BY_4.0).

## 📚 Risor
- PageSpeed Insights Report: [Link](https://pagespeed.web.dev/report?url=https%3A%2F%2Fblog.airscript.it%2F)  
- Mozilla Observatory: [Link](https://observatory.mozilla.org/analyze/blog.airscript.it)
- Security Headers: [Link](https://securityheaders.com/?q=blog.airscript.it&hide=on&followRedirects=on)
