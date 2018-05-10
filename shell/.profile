# Add below content to ~/.profile or ~/.zshrc

GIT_PROXY_ADDRESS="Replace this with your git proxy"
HTTP_PROXY_ADDRESS="Replace this with your http proxy"

gitproxy() {
    git config --global http.proxy ${GIT_PROXY_ADDRESS}
    git config --global https.proxy ${GIT_PROXY_ADDRESS}
    git config --global http.sslVerify false
}

disgitproxy() {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    git config --global --unset http.sslVerify
    git config --global --remove-section http
    git config --global --remove-section https
}

goproxy() {
    export http_proxy=${HTTP_PROXY_ADDRESS}
    export https_proxy=${HTTP_PROXY_ADDRESS}
}

disproxy() {
    export http_proxy=''
    export https_proxy=''
}

randpw() {
    LC_CTYPE=C tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+= < /dev/urandom | head -c 16 | xargs
}

