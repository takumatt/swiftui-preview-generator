source .env

echo $1
echo $2
echo $#

if [[ $# -le 2 ]]; then
    echo "Usage: $CMDNAME [UDID] [target-runtime]"
    exit 1
fi

UDID=$1
TARGET_RUNTIME=$2
SWIFT_FILE=$3

swift PreviewProviderExtractor.swift $SWIFT_FILE | xargs swift PreviewCodeBuilder.swift $OUTPUT_DIR > ./app/main.swift
cp $SWIFT_FILE ./app
sh -x $SCRIPT_DIR/run-on-simulator.sh $UDID $TARGET_RUNTIME

