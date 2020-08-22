fullName=$(realpath $3)
fileName=$(basename $3)
args=${@:4}

echo "Mounting \"$fullName\" in a docker container and executing it in k6"

echo $@

docker run \
    -it \
    --volume $fullName:/mount/$fileName:ro \
    --rm loadimpact/k6 \
    $2 \
    /mount/$fileName \
    $args