@Echo off

git pull

RD /S /Q _book

gitbook build

scp -r _book/* sn:~/blog

cp -rf _book/* .

git add .

git commit -m "auto deploy website"

git push origin 