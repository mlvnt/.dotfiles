base64_imggen() {
    # list=$( dir -AN1 )
    # IFS='
    # '
    # len=${#list[*]}
    # i=0
    # while [ $i -lt $len ]; do
    #     echo "$i: ${list[$i]}"
    #     let i++
    # done

    # extention=$(identify -format "%m" "$element" | tr '[A-Z]' '[a-z]')

    remove_base() {
        readarray list < <(dir -AN1)
        for element in "${list[@]}"; do
            local extention=$(echo $element | tr '.' $'\n' | tr '[A-Z]' '[a-z]' | tail -n1 | tr -d '\n')
            if [ "$extention" == "base64" ]; then
                rm -v $element
                # echo "[remove] $element"
            fi
        done
    }


    create_base() {
        readarray list < <(dir -AN1)
        for element in "${list[@]}"; do
            if [ "$extention" == "base64" ]; then
                :
            else
                local file=$(echo $element | tr '.' $'\n' | head -n1)
                local extention=$(echo $element | tr '.' $'\n' | tr '[A-Z]' '[a-z]' | tail -n1 | tr -d '\n')
                # echo "data:image/$extention;base64,$(base64 -w 0 $element)" > "$file.base64"
                echo "PHOTO;ENCODING=b;TYPE=$extention:$(base64 -w 0 $element)" > "$file.base64"
                echo "[created] $file.base64"
            fi;
        done;
    }

    remove_base
    create_base
    unset -f remove_base create_base;
}

# animated gifs from any video
# from Alex Sexton gist.github.com/SlexAxton/4989674
gifify() {
  if [[ -n "$1" ]]; then
  if [[ $2 == '--good' ]]; then
    ffmpeg -i "$1" -r 10 -vcodec png out-static-%05d.png
    time convert -verbose +dither -layers Optimize -resize 900x900\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > "$1.gif"
    rm out-static*.png
  else
    ffmpeg -i "$1" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$1.gif"
  fi
  else
  echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}
