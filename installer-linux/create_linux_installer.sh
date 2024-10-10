#!/usr/bin/bash -e

SCRIPT_PATH=$(dirname -- "${BASH_SOURCE[0]}")

PROGRAM_DIR=${SCRIPT_PATH}/program
LICENSE_FILE=${SCRIPT_PATH}/../LICENSE
APP_FILE=${SCRIPT_PATH}/../dist/erriez-test
APP_ICON=${SCRIPT_PATH}/../images/test.ico
OUTPUT_FILE=$1
LABEL="Erriez Test"

echo "Preparing install dir"
cp ${APP_ICON} ${PROGRAM_DIR}/
cp ${APP_FILE} ${PROGRAM_DIR}/

echo "Creating Linux installer"
makeself --sha256 --license "${LICENSE_FILE}" "${PROGRAM_DIR}" "${OUTPUT_FILE}" "${LABEL}" ./install.sh

echo "Created installer:"
./"${OUTPUT_FILE}" --check
./"${OUTPUT_FILE}" --info
./"${OUTPUT_FILE}" --list
