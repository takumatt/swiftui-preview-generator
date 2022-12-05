source .env

echo $1
echo $2
echo $#

if [[ $# -ne 2 ]]; then
    echo "Usage: $CMDNAME [UDID] [target-runtime]"
    exit 1
fi

UDID=$1
TARGET_RUNTIME=$2

swift PreviewProviderExtractor.swift DemoView.swift | xargs swift PreviewCodeBuilder.swift $OUTPUT_DIR > ./app/main.swift
cp DemoView.swift ./app
sh -x $SCRIPT_DIR/run-on-simulator.sh $UDID $TARGET_RUNTIME

