# 🪶 blog.airscript.it  
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/Airscripts/blog.airscript.it/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/Airscripts/blog.airscript.it/tree/main) [![Netlify Status](https://api.netlify.com/api/v1/badges/59826574-7ccb-4c30-a776-942044cf9520/deploy-status?branch=main)](https://app.netlify.com/sites/regal-sunshine-3cc2d8/deploys)  

This repository contains source code and content of my blog hosted on [blog.airscript.it](https://blog.airscript.it).  
&nbsp;

## 📦 Installation  
In order to the use correct version of Hugo it is **recommended** to use Docker.  
&nbsp;

### 🐳 Containerized Environment
1. Install Docker and Docker Compose on your machine following these links:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

2. Run the following commands in the repository's root folder:
    ```bash
    docker compose build
    docker compose up
    ```

3. Everything should be set up and running on port 25001.  
&nbsp;

### 💻 Local Environment
1. Clone this repository: 
    ```bash
    git clone https://github.com/Airscripts/blog.airscript.it.git
    ```

2. Update git submodules:
    ```bash
    git submodule update --init --recursive
    ```
    
3. Install Hugo following this [guide](https://gohugo.io/getting-started/installing/).

4. Run the following command:
    ```bash
    hugo server
    ```  
&nbsp;

## 🤝 Contributing  
Contributions and suggestions about how to improve the blog are welcome!  
&nbsp;  

## 💚 Support  
If you want to support my work you can do it with the links below.  

Choose what you find more suitable for you:  
- [Support me on GitHub](https://github.com/sponsors/Airscripts)  
- [Support me via linktr.ee](https://linktr.ee/airscript)  

Thank you so much, it means a lot for me!  
&nbsp;  

## 💳 License  
This repository has dual-licensing.  
 
This means that for its source code [MIT License](https://github.com/Airscripts/blog.airscript.it/blob/main/LICENSE_MIT) applies and for blog posts [Creative Commons Attribution 4.0 International](https://github.com/Airscripts/blog.airscript.it/blob/main/LICENSE_CC_BY_4.0) is applied.  
