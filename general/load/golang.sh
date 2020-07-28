# PATH for Go
GOPATH=""
GOROOT=""
if [ $CURRENT_OS = "Darwin" ]; then
  GOPATH="${HOME}/.go"
  GOROOT="/usr/local/opt/go/libexec"
elif [ $CURRENT_OS = "Linux" ]; then
  GOPATH="$PROJECTS/golang"
  GOROOT="/usr/local/go"
fi
export GOPATH
export GOROOT

export PATH="${GOPATH}/bin:${GOROOT}/bin:$PATH"
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"