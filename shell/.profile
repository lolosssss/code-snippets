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

## uses openssl aes 256 cbc encryption to encrypt file salting it with password designated by user
checkOpenSSL()
{
  if  ! command -v openssl &>/dev/null; then
    echo "Error: to use this tool openssl must be installed" >&2
    return 1
  else
    return 0
  fi
}

encrypt()
{
    checkOpenSSL || exit 1

    if [ ! -z $1 ] && [ ! -z $2 ]; then
        echo "Encrypting $1..."
        openssl enc -aes-256-cbc -salt -a in $1 -out $2 || { echo "File not found"; return 1; }
        echo "Successfully encrypted"
    else
        echo "Please give input file and output file."
    fi
}

## uses openssl aes 256 cbc decryption to decrypt file
decrypt()
{
    checkOpenSSL || exit 1

    if [ ! -z $1 ] && [ ! -z $2 ]; then
        echo "Decrypting $1..."
        openssl enc -aes-256-cbc -d -a -in $1 -out $2 || { echo "File not found"; return 1; }
        echo "Successfully decrypted"
    else
        echo "Please give input file and output file."
    fi
}

