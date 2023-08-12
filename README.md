# Blog
This repository contains source code and content of my blog hosted on [blog.airscript.it](https://blog.airscript.it).

## Contents
- [Installation](#installation)
- [Usage](#usage)
- [Resources](#resources)
- [Contributing](#contributing)
- [Support](#support)
- [License](#license)

## Installation
In order to contribute to this project, you need an up and running development environment.  
Follow the steps below in order to have one fully functional.  
Please note that only one path between *Classic* and *Dev Container* has to be followed.

### Classic  
Make sure to have these dependencies installed on your machine:
- [Bash](https://www.gnu.org/software/bash/)
- [Make](https://www.gnu.org/software/make/)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

Then, clone this repository:
```bash
git clone https://github.com/Airscripts/blog.git
```

### Dev Container  
Make sure to have these dependencies installed on your machine:
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
- [Bash](https://www.gnu.org/software/bash/)
- [Docker](https://docs.docker.com/get-docker/)
- [Visual Studio Code](https://code.visualstudio.com/Download)
- [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

Then, clone this repository:  
```bash
git clone https://github.com/Airscripts/blog.git
```

## Usage
To use this project, you have also two different possibilities:

### Classic
Run the following commands in the repository's root folder:
```bash
make all
```

Everything should be set up and running on port 25001.

### Dev Container
Open it in Visual Studio Code and then confirm the will to open it into a devcontainer.  
To make it work here, be sure to have installed *Dev Containers* extension.

Run the following commands in the repository's root folder:
```bash
make all
```

Everything should be set up and running on port 25001.

## Resources
- [PageSpeed Insights Report](https://pagespeed.web.dev/report?url=https%3A%2F%2Fblog.airscript.it%2F)  
- [Mozilla Observatory](https://observatory.mozilla.org/analyze/blog.airscript.it)  
- [Security Headers](https://securityheaders.com/?q=blog.airscript.it&hide=on&followRedirects=on)

## Contributing
Contributions and suggestions about how to improve the blog are welcome!

## Support
If you want to support my work you can do it following me, leaving a star, sharing my projects or also with the links below.  
Choose what you find more suitable for you:  

<a href="https://sponsor.airscript.it" target="blank">
  <img src="https://raw.githubusercontent.com/airscripts/assets/main/images/github-sponsors.svg" alt="GitHub Sponsors" width="30px" />
</a>&nbsp;
<a href="https://kofi.airscript.it" target="blank">
  <img src="https://raw.githubusercontent.com/airscripts/assets/main/images/kofi.svg" alt="Kofi" width="30px" />
</a>&nbsp;

*As of my personal preference, I'do go with GitHub Sponsors.*

## License
This repository has dual-licensing.  
This means that for its source code [MIT License](https://github.com/Airscripts/blog/blob/main/LICENSE_MIT) applies and for blog posts [Creative Commons Attribution 4.0 International](https://github.com/Airscripts/blog/blob/main/LICENSE_CC_BY_4.0) is applied.
