# openvpn_env
Creation d'un vpn sous vagrant (tuto linuxPratique97 offert au POSS)

## Quickstart

git clone git@github.com:Grillon/openvpn_env.git #This repo
./start.sh

## composition

* un serveur de clé
* un serveur vpn
* un client vpn desktop
* et bientôt un client vpn android

chacun a son environnement vagrant. J'ai hésité a faire un environnement unique en renommant les vagrantfile mais cette solution me semble la plus sage.

## organisation technique

### serveur de clé

1.installation easy-rsa
2.il genere ensuite le certificat racine, les clés publique et privée du serveur vpn ainsi que celles des clients.
3.enfin il copie les clés privées et publiques de chacun et garde ce qui ne doit pas être partagé.

### serveur vpn

1.installation openvpn
2.modification du fichier de configuration serveur
3.lancement openvpn

### client vpn

1. installation openvpn
2. ajout du nom et de l'ip du serveur dans le fichier host
3. modification du fichier de configuration client
4. lancement openvpn

### script de lancement

1. creation du sous repertoire keys dans srv_cle
2. vagrant up de srv_cle
3. transfert du certificat racine et des clés serveur publique/privé vers srv_vpn
4. transfert du certificat racine et des clés client publique/privé vers cli_vpn
5. vagrant up srv_vpn
6. vagrant up cli_vpn

et voilà

### axes d'amélioration

1. mieux proteger les clés privées en changeant les droits et en les suprimants du rep initial après copie
2. rendre le tout generique à l'aide de variables d'environnement
3. adapter tt ça à docker
4. adapter le tt à docker cloud à l'aide de stackfile

