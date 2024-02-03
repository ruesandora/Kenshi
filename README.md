# Kenshi-Go-Docker-Kurulumu

> [!NOTE]
> Kenshi yakın zamanda typescript yerine GOLang ile çalışmaya başladı. JS versiyonunda çalışmaya devam edecek nodelar için puan vermeyi bıraktığını duyurdu. 
<br>
Kenshi Go versiyonunu Docker çalıştırmak isterseniz aşağıda detaylı anlatımını bulabilirsiniz.
<br>

## Sunucu Güncelleme ve Docker Kurulumu
```
# Öncelikle sunucudaki güncellemelerimizi ve yükseltmelerimizi yapalım.
sudo apt update -y && sudo apt upgrade -y

# Ardından sunucumuza HTTPS üzerinden indireceğimiz kaynak için sorun çıkmaması adına ve linkten indirdiğimiz zip dosyasını unzip ederken sorun yaşamamak için aşağıda yazan kodları girelim.
sudo apt install apt-transport-https ca-certificates curl software-properties-common wget unzip

# Docker GPG anahtarını sunucumuza ekleyelim
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Docker'ı kaynaklarımıza ekleyelim 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Eklediğimiz kaynağın tanınması için yeniden güncelleyelim
sudo apt update

# Ubuntu yerin Docker üzerinden kurulum yapacağımızı garanti altına alalım
apt-cache policy docker-ce

```
> [!WARNING]
> En son yazmış olduğumuz kod bize bir ekran çıktısı verecektir. Buradaki çıktıda Installed: (none) olmasına dikkat edelim.
```
docker-ce:
  Installed: (none)
  ...
  ...
  5:20.10.14~3-0~ubuntu-focal 500
  500 https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
  5:20.10.13~3-0~ubuntu-focal 500
  500 https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
  ...
  ...

## Yukarıdaki komuttan sonra ekrandan çıkamıyorsanız terminali kapatıp tekrar açabilirsiniz. 

## Ve ardından Docker'ı yükleyelim
sudo apt install docker-ce

## Docker'ın kurulduğundan emin olmak için aşağıdaki kodu çalıştıralım.
sudo systemctl status docker
```
> [!WARNING]
> En son yazmış olduğumuz kod bize aşağıdaki gibi bir çıktı vermelidir.

```
Output
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
     ...
     ...
     ...
```
<br>

## Kenshi Unchained Go Versiyon Kurulumu

```
# wget ile dosyamızı indirelim
wget https://github.com/KenshiTech/unchained/releases/download/v0.11.1/unchained-v0.11.1-docker.zip

# İndirmiş olduğumuz dosyamızı unzipleyelim
unzip  unchained-v0.11.1-docker.zip

# Unzip ile ortaya çıkan dosyamızın içine girelim
cd unchained-v0.11.1-docker

# Aşağıdaki kod ile conf adında bir dosya oluşturalım.
mkdir conf

# cp komutu ile dosya içerisinde bulunan conf.worker.yaml.template isimli dosyamızı conf dosyası içerisine conf.worker.yaml olarak kopyalayalım.
cp conf.worker.yaml.template conf/conf.worker.yaml

# Aşağıdaki kod ile worker'ı çalıştıralım. Ardından hemen durduracağız. 
./unchained.sh worker up -d

# Worker'ı durduralım. Lütfen sayımın bitmesini (yani workerın durmasını) bekleyin 
./unchained.sh worker stop

# Aşağıdaki komut ile conf içerisine girelim. Bu komuttan sonra aşağıda 2 ayrı anlatım bulunacak. Daha önce Kenshi kullananlar ve kulllanmayanlar için. Lütfen warning kısımlarından size hangisi uygunsa ona göre hareket edin!
cd conf 
```

> [!WARNING]
> Bu aşama Kenshi'yi daha önce kuranlar için! (Elinizde secretKey ve publicKey bulunuyorsa)
> Daha önca çalıştırdıysanız Kenshi TypeScript ile çalıştırdığımız conf.yaml içerisinde bu bilgiler bulunur. 


```
# conf.worker.yaml  içerisine gidelim;
nano conf.worker.yaml

# Ekranda olan "name" bölümünü düzenleyin ve ardından sırasıyla CTRL +X, Y ve enter diyerek çıkın.

# secrets.worker.yaml  içerisine gidelim;
nano secrets.worker.yaml

# Bu kısımda secretKey ve publicKey alanlarını düzenleyin ve ardından sırasıyla CTRL +X, Y ve enter diyerek çıkın.
```

> [!WARNING]
> Bu aşama Kenshi'yi ilk defa kuracaklar içindir! Daha önce hiç TypeScript dahi çalıştırmamış kullanıcılar içindir!

```
# conf.worker.yaml  içerisine gidelim ve name içerisine kullanmak istediğiniz (Websitesinde görünecek adınız) nickinizi yazın;
nano conf.worker.yaml

# Ekranda olan "name" bölümünü düzenledikten sonra CTRL +X, Y ve enter diyerek çıkın.
```

> [!CAUTION]
> Lütfen yukarıdaki seçeneklerden size uygun olan adımı yaptığınızdan emin olun! Her ikisini aynı anda yapmayacaksınız, yalnızca size uygun olan "WARNING" seçeneğinin altındaki adımları uygulayın!<br><br>

```
# Aşağıdaki kod ile ana klasörümüze dönelim.
cd ..

# Yukarıdaki işlemleri hallettiysek şimdi dosyamıza çalıştırma izni verelim.
chmod +x unchained.sh

# Artık çalıştırmaya hazırız! Aşağıdaki kod ile çalıştıralım.
./unchained.sh worker up -d
```

> [!TIP]
> ./unchained.sh worker logs -f  kodu ile loglarınızı kontrol edebilirsiniz.<br><br>
> Herhangi bir sorun yoksa ekran görüntünüz aşağıdaki gibi olmalıdır.<br><br>

![Screenshot_6](https://github.com/Dtractus/Kenshi-Go-Docker-Kurulumu/assets/55835876/9060921b-9e56-401e-bba1-9c0ba4b290fa)



[Dtractus](https://github.com/Dtractus)