echo "hej"
echo "$1:/mount/$(basename $1)"

#
# Due to docker creating directories for missing mount paths, we first touch the file to
# avoid confusing behavior.
#

fullName=$1
fileName=$(basename $1)


if [[ ! -f $1 ]]
then
  touch $1
fi

docker run \
    -it \
    --entrypoint= \
    --volume $fullName:/mount/$fileName \
    --rm lambdalisue/neovim-themis \
    nvim \
    /mount/$fileName \
    ${@:3}