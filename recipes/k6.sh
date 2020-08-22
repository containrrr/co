fullName=$2
fileName=$(basename $2)

docker run \
    -it \
    --volume $fullName:/mount/$fileName:ro \
    --rm loadimpact/k6 \
    $1 \
    /mount/$fileName \
    ${@:3}