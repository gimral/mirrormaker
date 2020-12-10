# !/bin/bash
export KAFKA_HEAP_OPTS="-Xmx2G -Xms2G"

CONFIGURATIONS_FILEPATH="/opt/kafka/config/mm2.properties"

# Start kafka mirror maker.
/opt/kafka/bin/connect-mirror-maker.sh $(echo "${CONFIGURATIONS_FILEPATH}")