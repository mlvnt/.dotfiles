#   -------------------------------
#   NETWORK DISCOVERY
#   -------------------------------

ipdiscovery() {
    local re='((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)';
    local os=$(currentdevice -o);
    local macs=~/.dotfiles/wsl/net/mac.txt;

    help() {
        clear && echo && echo "DESCRIPTION"
        echo "        ipdiscovery - find device ip by mac and run a service" && echo
        echo "USAGE"
        echo "        ipdiscovery [DEVICE] [SERVICE]" && echo
        echo "OPTIONS"
        echo "    Devices"
        echo "        1   |  s8"
        echo "        2   |  s8hotspot"
        echo "        3   |  tab"
        echo "        4   |  p8"
        echo "        5   |  pclan"
        echo "        6   |  pcwifi"
        echo "        7   |  surface"
        echo "        8   |  delllan"
        echo "        9   |  dellwifi"
        echo "        10  |  msilan"
        echo "        11  |  msiwifi"
        echo "    Services"
        echo "        1   |  ssh"
        echo "        2   |  ftp" && echo
    }

    if [[ -z $1 ]] ; then
        echo && echo "no device selected"
        help
    else
        case $1 in
            s8|1)          local mac="$(tail -n+1 $macs | head -n1)";
                           local device='s8';
                           local type='mobile'; ;;
            s8hotspot|2)   local mac="$(tail -n+2 $macs | head -n1)";
                           local device='s8hotspot';
                           local type='mobile'; ;;
            tab|3)         local mac="$(tail -n+3 $macs | head -n1)";
                           local device='tab';
                           local type='mobile'; ;;
            p8|4)          local mac="$(tail -n+4 $macs | head -n1)";
                           local device='p8';
                           local type='mobile'; ;;
            pclan|5)       local mac="$(tail -n+5 $macs | head -n1)";
                           local device='pclan';
                           local type='desktop'; ;;
            pcwifi|6)      local mac="$(tail -n+6 $macs | head -n1)";
                           local device='pcwifi';
                           local type='desktop'; ;;
            surface|7)     local mac="$(tail -n+7 $macs | head -n1)";
                           local device='surface';
                           local type='desktop'; ;;
            delllan|8)     local mac="$(tail -n+8 $macs | head -n1)";
                           local device='delllan';
                           local type='desktop'; ;;
            dellwifi|9)    local mac="$(tail -n+9 $macs | head -n1)";
                           local device='dellwifi';
                           local type='desktop'; ;;
            msilan|10)     local mac="$(tail -n+10 $macs | head -n1)";
                           local device='msilan';
                           local type='desktop'; ;;
            msiwifi|11)    local mac="$(tail -n+11 $macs | head -n1)";
                           local device='msiwifi';
                           local type='desktop'; ;;
            *)             local mac='n'; ;;
        esac

        if [ "$mac" == "n" ] ; then
            echo && echo "wrong device"
            help
        else
            case $os in
                win)  local arplist=$(cmd.exe /c arp -a);
                      echo && echo "[mac] $(echo "$mac" | sed 's/\[//g ; s/\]//g ; s/://g')"; ;;
                unix) local arplist=$(arp -a);
                      echo && echo "[mac] $(echo "$mac" | sed 's/\[//g ; s/\]//g ; s/-//g')"; ;;
            esac

            local ip=$(echo "$arplist" | awk '{print tolower($0)}' | grep "$mac" | grep -oE "$re");

            if [[ $ip =~ $re ]]; then
                echo "[$device] $ip" && echo
                if [ -z "$2" ]; then
                        :
                else
                    case $2 in
                        ssh|1)
                                if [ "$type" == "mobile" ]; then
                                    ssh "$ip" -p 8022
                                else
                                    ssh -t mlvnt@"$ip" -p 2222
                                fi
                                    ;;
                        ftp|2)
                                if [ "$type" == "mobile" ]; then
                                    cmd.exe /c start "C:\Windows\explorer.exe" ftp://$ip:2121/
                                else
                                    cmd.exe /c start "C:\Windows\explorer.exe" ftp://$ip:2121/
                                fi
                                    ;;
                        *)     service='n' ;;
                    esac

                    if [ "$service" == "n" ]; then
                        echo && echo "wrong service"
                        help
                    fi
                fi
            else
                echo  && echo "arp entry ip unavailable" && echo
            fi
        fi
    fi

    functions=(
        "help"
    )

    variables=(
        # "re"
        # "os"
        # "macs"
        # "mac"
        # "device"
        # "type"
        # "os"
        # "arplist"
        # "ip"
        "service"
    )

    unset -f "${functions[@]}";
    unset -v functions "${variables[@]}" variables;
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
getcertnames() {
    if [ -z "${1}" ]; then
        echo "ERROR: No domain specified.";
        return 1;
    fi;

    local domain="${1}";
    echo "Testing ${domain}...";
    echo ""; # newline

    local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
        | openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

    if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
        local certText=$(echo "${tmp}" \
            | openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
            no_serial, no_sigdump, no_signame, no_validity, no_version");
        echo "Common Name:";
        echo ""; # newline
        echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
        echo ""; # newline
        echo "Subject Alternative Name(s):";
        echo ""; # newline
        echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
            | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
        return 0;
    else
        echo "ERROR: Certificate not found.";
        return 1;
    fi;
}

# Run `dig` and display the most useful info
digga() {
    dig +nocmd "$1" any +multiline +noall +answer;
}

# Create a data URL from a file
dataurl() {
    local mimeType=$(file -b --mime-type "$1");
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8";
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Start an HTTP server from a directory, optionally specifying the port
httpserver() {
    local port="${1:-8000}";
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn't break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
phpserver() {
    local port="${1:-4000}";
    local ip=$(ipconfig getifaddr en1);
    sleep 1 && open "http://${ip}:${port}/" &
    php -S "${ip}:${port}";
}

# whois a domain or a URL
# whois() {
#   local domain=$(echo "$1" | awk -F/ '{print $3}') # get domain from URL
#   if [ -z $domain ] ; then
#     domain=$1
#   fi
#   echo "Getting whois record for: $domain ..."

#   # avoid recursion
#           # this is the best whois server
#                           # strip extra fluff
#   /usr/bin/whois -h whois.internic.net $domain -H # | sed '/NOTICE:/q'
# }

ssh_key() {
    # Print public SSH key to clipboard. Generate it if necessary

    local file="$HOME/.ssh/id_rsa.pub"
    if [ ! -f "$file" ]; then
        ssh-keygen -t rsa
    fi

    cat "$file";
}

serve() {
    #
    # serve <port>
    #
    # Serve the current directory. Default port is 8000. Uses python's
    # SimpleHTTPServer module.

    if [ -z $1 ]
    then        # no arguments
        open http://127.0.0.1:8000
        python3 -m http.server  8000
    else
        open http://127.0.0.1:$1
        python3 -m http.server  $1
    fi
}


local_ip() {
    ifconfig eth0 | grep inet | awk '{print $2}' | head -n 1
    ifconfig eth0 | grep inet6 | awk '{print $2}' | head -n 1
    # ip addr show eth0 | grep inet | awk '{print $2}' | head -n 1
    # ip addr show eth0 | grep inet6 | awk '{print $2}' | head -n 1
}

public_ip() {
    # curl https://ipinfo.io
    # curl https://ipinfo.io/ip
    # dig +short myip.opendns.com @resolver1.opendns.com
    curl ipv4.icanhazip.com
    curl ipv6.icanhazip.com
    curl -4 https://icanhazip.com/
    curl -6 https://icanhazip.com/
    # curl ident.me
    # curl v4.ident.me
    # curl v6.ident.me
    curl 'https://api.ipify.org?format=json'
    curl 'https://api6.ipify.org?format=json'
}

# /sbin/ip
# /sbin/ifconfig
# /sbin/iptables
# /sbin/ip6tables
# route
# traceroute
