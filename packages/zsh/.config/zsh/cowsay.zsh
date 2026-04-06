# Load extra cowfiles if exist

if type cowsay > /dev/null; then
    EXTRACOWS="${HOME}/.cowsay/cowfiles"
    [ -d "${EXTRACOWS}" ] && export COWPATH="${EXTRACOWS}:$COWPATH"
fi
