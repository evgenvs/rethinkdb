set -e

apt-get update
apt-get install -y lsb-release wget gnupg
echo "deb http://download.rethinkdb.com/apt `lsb_release -cs` main" | tee /etc/apt/sources.list.d/rethinkdb.list
wget -qO- https://download.rethinkdb.com/apt/pubkey.gpg | apt-key add -
apt-get update
apt-get install -y rethinkdb
rethinkdb --daemon

nimble install -yd
nim c -r test.nim
