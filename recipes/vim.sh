#
# Due to docker creating directories for missing mount paths, we first touch the file to
# avoid confusing behavior.
#

if [[ ! -f $2 ]]
then
  touch $2
fi

fullName=$(realpath $2)
fileName=$(basename $2)
args=${@:3}

echo "Mounting \"$fullName\" in a docker container and opening it in nvim"

docker run \
    -it \
    --entrypoint= \
    --volume $fullName:/mount/$fileName \
    --rm lambdalisue/neovim-themis \
    nvim \
    /mount/$fileName \
    $args