#!/usr/bin/env bash
set -euo pipefail

# Dependencies
for cmd in sfp; do
  command -v "$cmd" >/dev/null || {
    echo "::error title=Missing dependency::'$cmd' is not installed or not on PATH"
    exit 1
  }
done

# Inputs and defaults
SFDX_PROJECT_PATH="${SFDX_PROJECT_PATH:-$GITHUB_WORKSPACE/sfdx-project.json}"

if [ ! -f "$SFDX_PROJECT_PATH" ]; then
  echo "::error title=Missing File::sfdx-project.json not found at '$SFDX_PROJECT_PATH'"
  exit 1
fi

if [ -z "${DEV_HUB:-}" ]; then
  echo "::error title=Missing Variable::Environment variable 'DEV_HUB' is not set."
  exit 1
fi

if [ -z "${POOL_CONFIG_PATH:-}" ]; then
  echo "::error title=Missing Variable::Environment variable 'POOL_CONFIG_PATH' is not set."
  exit 1
fi

if [ ! -f "$POOL_CONFIG_PATH" ]; then
  echo "::error title=Missing File::Pool config not found at '$POOL_CONFIG_PATH'"
  exit 1
fi

# Prepare Pool (conditionally add --keys)
args=(pool prepare --poolconfig "$POOL_CONFIG_PATH" --targetdevhubusername "$DEV_HUB")
if [ -n "${CRM_PACKAGE_KEY_PAIRS:-}" ]; then
  echo "::notice title=Package Keys::Using provided package keys"
  args+=(--keys "$CRM_PACKAGE_KEY_PAIRS")
else
  echo "::notice title=Package Keys::No package keys provided; proceeding without --keys"
fi

sfp "${args[@]}"