# ./updateAndRestart.sh --build_number 87c87qe


while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    --build_number)
    BUILD_NUMBER="$2"
    shift # past argument
    ;;
    --environment)
    ENVIRONMENT="$2"
    shift # past argument
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

BUILD_NUMBER="${BUILD_NUMBER:-$(cat /proc/sys/kernel/random/uuid)}"
ENVIRONMENT="${ENVIRONMENT:-default}"
DEPLOY_DATE=$(date)


echo build number $BUILD_NUMBER is being processed
echo environment is $ENVIRONMENT

echo $BUILD_NUMBER $DEPLOY_DATE start deploy>> ~/.deploy.log
echo $BUILD_NUMBER $DEPLOY_DATE end deploy>> ~/.deploy.log
