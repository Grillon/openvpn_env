#installation gestionnaire de cles
sudo apt-get update
sudo apt-get install easy-rsa -y
#prep emplacement
mkdir placard
cd placard
#prep env de gestion des clés
make-cadir monca
cd monca
#configuration
sed -i.old -e /KEY_COUNTRY/d -e /KEY_CITY/d -e /KEY_ORG/d -e /KEY_EMAIL/d -e /KEY_OU/d vars 
echo '
export KEY_COUNTRY="FR"
export KEY_PROVINCE="HERAULT"
export KEY_CITY="Montpellier"
export KEY_ORG="hello"
export KEY_EMAIL="thierry.grillon@gmail.com"
export KEY_OU="MyOrganizationalUnit"
' >> vars
source ./vars
#net fichiers tempos
./clean-all
#supression de l'option interaction
for prg in build-ca build-key-server build-key;do sed -i.old -e 's/--interact//' $prg;done
#creation certificat racine
./build-ca
#gen clé serveur
./build-key-server srvvpn
#Diffie-Hellman
./build-dh
#gen clés client
for client in client1 client2;do ./build-key $client;done
