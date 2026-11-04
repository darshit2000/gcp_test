#!/usr/bin/env bash
set -e
EXPECTED_SHA=46e2f3de72eb48bf2cd775254e7d5391f09a419a8508ff215d1185b185e05484
mkdir -p poc-v2
base64 -d poc-v2.1.b64.txt | tar xz -C poc-v2
ACTUAL_SHA=$(base64 -d poc-v2.1.b64.txt | sha256sum | awk '{print $1}')
echo "expected $EXPECTED_SHA"
echo "actual   $ACTUAL_SHA"
[ "$EXPECTED_SHA" = "$ACTUAL_SHA" ] && echo MATCH || echo MISMATCH
echo "--- extracted files ---"; find poc-v2 -type f | sort
