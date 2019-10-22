#   -------------------------------
#   SERIES
#   -------------------------------

ydl() {
    # TODO: add audio only option
    # TODO: add playlist option

    # # Download Youtube playlist in a folder and indexing videos using youtube-dl
    # alias youtube-dl-playlist="youtube-dl --ignore-errors --output '%(playlist)s/%(playlist_index)s- %(title)s.%(ext)s'"

    # --config-location PATH
    # --write-info-json
    # --write-annotations

    # # the best .mp4 video with fps < 60
    # youtube-dl -f 'bestvideo[fps!=60]+bestaudio/best[ext=mp4]/best' -o '%(title)s.%(ext)s'

    # # the best .mp4 video with fps < 60 with en subs
    # youtube-dl -f 'bestvideo[fps!=60]+bestaudio/best[ext=mp4]/best' -o '%(title)s.%(ext)s' --restrict-filenames --write-sub --sub-format 'ass/srt/best' --sub-lang en

    help() {
        clear && echo && echo "DESCRIPTION";
        echo "        ydl - youtube-dl video downloader" && echo;
        echo "USAGE";
        echo "        ydl URL";
        echo "        ydl [OPTION] URL" && echo;
        echo "OPTIONS";
        echo "        s   download en subs";
        echo "        l   List all available formats of requested videos";
        echo "        u   update" && echo;
    }

    cmd_video() {
        youtube-dl --write-info-json -f '(bestvideo[ext=mp4])[fps!=60]+bestaudio[ext=m4a]/mp4' -o '%(title)s/%(title)s.%(ext)s' --write-description "$@";
    }

    cmd_audio() {
        youtube-dl --write-info-json -o '%(title)s.%(ext)s' "$@";
    }

    local re='https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/=]*)';
    local input="$1";
    shift 1;

    if [[ ${input} =~ $re ]]; then
        cmd_video "${input}";
    else
        case "${input}" in
            a) cmd_audio "$@"; ;;
            s)
                if [[ $1 =~ $re ]]; then
                    cmd --write-sub --sub-format 'ass/srt/best' --sub-lang en "$1";
                else
                    echo "Invalid url" && echo;
                fi; ;;
            u)  sudo -H pip install --upgrade youtube-dl; ;;
            l)  youtube-dl -F "$1"; ;;
            *)  help; ;;
        esac;
    fi;

    unset help cmd_video cmd_audio;
}

# turn that video into webm.
# brew reinstall ffmpeg --with-libvpx
webmify() {
  ffmpeg -i "$1" -vcodec libvpx -acodec libvorbis -isync -copyts -aq 80 -threads 3 -qmax 30 -y "$2" "$1.webm"
}
