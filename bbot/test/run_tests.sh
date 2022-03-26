#!/bin/bash

bbot_dir="$( realpath "$(dirname "$(dirname "${BASH_SOURCE[0]}")")")"
echo -e "[+] BBOT dir: $bbot_dir\n"

echo "[+] Checking code formatting with black"
echo "======================================="
black --check "$bbot_dir" || exit $?
echo

echo "[+] Linting with flake8"
echo "======================="
flake8 --select F --ignore F403,F405,F541 --per-file-ignores="*/__init__.py:F401,F403" "$bbot_dir" || exit $?
echo

echo "[+] Testing with pytest"
pytest "$bbot_dir" || exit $?