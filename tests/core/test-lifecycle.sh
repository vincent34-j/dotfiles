#!/usr/bin/env bash

set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/scripts/core/runtime.sh"

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/scripts/core/lifecycle.sh"

# shellcheck source=/dev/null
source "${PROJECT_ROOT}/tests/lib/assert.sh"

HOOK_DIR="${PROJECT_ROOT}/hooks/pre-install"

mkdir -p "${HOOK_DIR}"

cat > "${HOOK_DIR}/99-test.sh" <<'EOF'
#!/usr/bin/env bash

printf "HOOK EXECUTED\n"
EOF

chmod +x "${HOOK_DIR}/99-test.sh"

output="$(run_hook pre-install)"

expected="$(printf "%s\n%s" \
    "=== PRE-INSTALL HOOK ===" \
    "HOOK EXECUTED")"

assert_equals \
    "${expected}" \
    "${output}" \
    "Lifecycle hook executed"

rm -f "${HOOK_DIR}/99-test.sh"
