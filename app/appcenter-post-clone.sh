#!/usr/bin/env bash

PROJECT_ID=31567
SUITE_ID=20933
CRT_API_URL="https://api.robotic.copado.com/pace/v4/projects/${PROJECT_ID}/jobs/${SUITE_ID}/builds"
CRT_ACCESS_KEY=9953f71d-f466-4c5e-b88a-31291deeef81
echo Start the build
BUILD=$(curl -sS -H 'X-Authorization: '"${CRT_ACCESS_KEY}"'' -d '{"inputParameters": [{"key": "BROWSER", "value": "firefox"}]}' -H "Content-Type: application/json" -X POST ${CRT_API_URL})
echo "${BUILD}"
BUILD_ID=$(echo "${BUILD}" | grep -Po '"id":\K[0-9]+')
if [ -z "${BUILD_ID}" ]; then
  exit 1
fi
echo -n "Executing tests "
STATUS='"executing"'
# Poll every 10 seconds until the build is finished
while [ "${STATUS}" == '"executing"' ]; do
  sleep 10
  RESULTS=$(curl -sS -H 'X-Authorization: '"${CRT_ACCESS_KEY}"'' ${CRT_API_URL}/${BUILD_ID})
  STATUS=$(echo "${RESULTS}" | grep -Po '"status": *\K"[^"]*"' | head -1)
  echo -n "."
done
echo " done!"
FAILURES=$(echo ${RESULTS} | grep -Po '"failures":\K[0-9]+')
LOG_REPORT_URL=$(echo "${RESULTS}" | grep -Po '"logReportUrl": *\K"[^"]*"')
echo "Report URL: ${LOG_REPORT_URL}"
