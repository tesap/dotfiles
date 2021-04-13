tmp='tmp1234'

# /usr/lib/firefox/omni.ja

mkdir $tmp
cp $1 ./$tmp/
cd $tmp
mv omni.ja omni.zip
unzip omni.zip
rm omni.zip

cat greprefs.js | python3 -c "import re, sys; x = lambda s: re.sub(r'''((https://)([-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?))''', '', s); print(x(sys.stdin.read()));" > new.js
mv new.js greprefs.js

zip -0DXqr omni.ja *
mv omni.ja ../
cd ../
rm -rf $tmp

sudo mv $1 /usr/lib/firefox/omni.ja.bak
sudo mv ./omni.ja /usr/lib/firefox/omni.ja
