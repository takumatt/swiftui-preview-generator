source .env

swift PreviewProviderExtractor.swift DemoView.swift | xargs swift PreviewCodeBuilder.swift > ./app/main.swift
cp DemoView.swift ./app
sh -x $SCRIPT_DIR/run-on-simulator.sh $UDID $TARGET_RUNTIME

