if [ $1 ] ; then
    case $1 in
        tbz)       tar cjvf $2.tar.bz2 $2      ;;
        tgz)       tar czvf $2.tar.gz  $2       ;;
        txz)       tar -caf $2.tar.xz  $2       ;;
        tar)       tar cpvf $2.tar  $2       ;;
        bz2)       bzip2 $2 ;;
        gz)        gzip -c -9 -n $2 > $2.gz ;;
        zip)       zip -r "$2.zip" $2   ;;
        7z)        7z a $2.7z $2    ;;
        zip)       zip -r "$1.zip" $1   ;;
    esac
else
    echo "'$1' Error"
fi
