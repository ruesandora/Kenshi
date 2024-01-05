<h1 align="center">Kenshi</h1>

> Kurulumu kolay - ne kadar süreceğini bilmiyorum belli değil - donanım için yeni sunucuya gerek yok

> Ödüllü evet - ama top 200'e - herkes kurabilir ama en iyi performansı veren 200 node ödül alabilir.

> TOPLULUK KANALLARI: [Sohbet Kanalımız](https://t.me/RuesChat) - [Duyurular ve Gelişmeler](https://t.me/RuesAnnouncement) - [Whatsapp](https://whatsapp.com/channel/0029VaBcj7V1dAw1H2KhMk34) - [Kenshi Telegram](https://t.me/KenshiTech)

#

<h1 align="center">Donanım</h1>

> Bir cihaz temin etmedim mevcut nodeların yanına kurdum - ario, santiment, voi yanlarında denedim problem olmadı.

> top 200'de olmak için en önemli kriter internet olacak, [Hetzner](https://hetzner.cloud/?ref=gIFAhUnYYjD3) kullandım.

> illa temin edilecekse 2 CPU 2 RAM ideal 'şimdilik'

#

<h1 align="center">Kurulum</h1>

```console
# sunucu güncelleme
sudo apt update -y && sudo apt upgrade -y

# burada 20 ve 60 saniye bekliyoruz
# komutları sırasıyla girelim:
curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt install nodejs
npm install -g npm@10.2.5
sudo npm i -g @kenshi.io/unchained
sudo npm i -g @kenshi.io/unchained@latest
```

<h1 align="center">Yapılandırma işlemleri ve başlatma</h1>

```console
# conf.yaml içine girelim
sudo nano conf.yaml

# burada sadece Rues kısmını kendi adınız yapın - gerisini ben ayarladım
log: info
name: Rues
lite: true
gossip: 5
rpc:
  ethereum:
    - https://ethereum.publicnode.com
    - https://eth.llamarpc.com
    - wss://ethereum.publicnode.com
    - https://eth.rpc.blxrbdn.com
database:
  url: mongodb+srv://<user>:<password>@<url>/?retryWrites=true&w=majority
  name: unchained

> CTRL X Y Enter ile çıkıyoruz.


# Screen içine girelim
screen -S kenshi

# Başlatalım
unchained start conf.yaml --generate

> CTRL A D ile screenden çıkıyoruz.

# Notlar:
> Son komuttan sonra loglar akmaya başlayacak ve sync olmaya başlayacaksınız
> 5 dakikada bir gözüken Leaderboard'da siz OLMAYACAKSINIZ
> Bu leaderboard - sizin node'larınız tarafından diğer nodelara verilen puanlardır
> Sizde başkaların nodelarından puan alacaksınız - hetzner'iniz varsa kafanız rahat olabilir.
```

> WinSCP veya mobaxterm benzeri bir uygulama ile conf.yaml dosyasını yedekleyelim.

> Veya `cat conf.yaml` komut ile çıktıyı kaydedebilirsiniz.

> conf.yaml içinde ki secret key önemli olan.

> Kendinizi [burada](https://charts.mongodb.com/charts-unchained-gpust/public/dashboards/cbb6ccf6-15b2-4187-be56-ff9d2e25a48a) contributions kısmında bulabilirsiniz.

> Güncel score'unuza bakmak için [bu](https://kenshi.io/unchained) adresini tercih edebiliriz, siteye girdikten sonra hiçbir şey yapmadan biraz beklemeniz lazım score'ların yüklenmesi için.

