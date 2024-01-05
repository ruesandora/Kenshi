## güncelleme

```console
# içersine girelim bu komutla
screen -r kenshi
# ctrl c yaparak durduralım.

# kaldıralım eski versionu
sudo npm uninstall -g prisma
sudo npm uninstall -g @kenshi.io/unchained
sudo npm uninstall -g npm
sudo rm -rf /usr/local/bin/node /usr/local/bin/npm /usr/local/bin/npx

# yeni version yükleyelim
npm install -g npm@latest
npm install -g @kenshi.io/unchained
nvm install node


# komutlarımızı tek tek girelim
sudo sysctl -w fs.nr_open=33554432
echo "ulimit -Hn 33554432" >> ~/.bashrc
echo "ulimit -Sn 33554432" >> ~/.bashrc
nvm use --delete-prefix v21.5.0 --silent
source ~/.bashrc

# başlatalım
unchained start conf.yaml
# ctrl a d ile screenden çıkabilirsiniz.
```

> Loglar akıyorsa ve görseldeki gibiyse tamamdır.

<img width="870" alt="Ekran Resmi 2024-01-05 22 53 23" src="https://github.com/ruesandora/Kenshi/assets/101149671/43f59bef-7130-41bf-bd46-da17778f0432">




