# Secret key ile public key bulmak için

> Herhangi bir sunucuda ya da lokalinizde aşağıdaki komutları sırası ile çalıştırın.

```console
# Kenshi-pubkey-finder klasörünü oluştur ve içine git
mkdir kenshi-pubkey-finder
cd kenshi-pubkey-finder

# package.json ve index.js dosyalarını GitHub'dan indir
wget https://raw.githubusercontent.com/ruesandora/Kenshi/main/pubkey-finder/package.json
wget https://raw.githubusercontent.com/ruesandora/Kenshi/main/pubkey-finder/index.js

# Node.js bağımlılıklarını yükle
npm install

# Uygulamayı çalıştır
node index.js

```

> Çıkan soruya secret keyinizi yazın ve output olarak public keyinizi alın :)
