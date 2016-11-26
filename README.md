# openvpn_env
Creation d'un vpn sous vagrant (tuto linuxPratique97 offert au POSS)

## composition

* un serveur de clé
* un serveur vpn
* un client vpn desktop
* et bientôt un client vpn android

chacun a son environnement vagrant. J'ai hésité a faire un environnement unique en renommant les vagrantfile mais cette solution me semble la plus sage.

## organisation technique

### serveur de clé

#.installation easy-rsa
#.il genere ensuite le certificat racine, les clés publique et privée du serveur vpn ainsi que celles des clients.
#.enfin il copie les clés privées et publiques de chacun et garde ce qui ne doit pas être partagé.

### serveur vpn

#.installation openvpn
#.modification du fichier de configuration serveur
#.lancement openvpn

### client vpn

#. installation openvpn
#. ajout du nom et de l'ip du serveur dans le fichier host
#. modification du fichier de configuration client
#. lancement openvpn

### script de lancement

#. creation du sous repertoire keys dans srv_cle
#. vagrant up de srv_cle
#. transfert du certificat racine et des clés serveur publique/privé vers srv_vpn
#. transfert du certificat racine et des clés client publique/privé vers cli_vpn
#. vagrant up srv_vpn
#. vagrant up cli_vpn

et voilà

### axes d'amélioration

#. mieux proteger les clés privées en changeant les droits et en les suprimants du rep initial après copie
#. rendre le tout generique à l'aide de variables d'environnement
#. adapter tt ça à docker
#. adapter le tt à docker cloud à l'aide de stackfile

