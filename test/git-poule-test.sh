#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

bin_dir="$tmp_dir/bin"
mkdir -p "$bin_dir"

assert_contains() {
  local file="$1"
  local text="$2"
  if ! grep -Fq "$text" "$file"; then
    echo "Expected $file to contain: $text" >&2
    echo "--- $file ---" >&2
    cat "$file" >&2
    exit 1
  fi
}

assert_not_contains() {
  local file="$1"
  local text="$2"
  if grep -Fq "$text" "$file"; then
    echo "Expected $file not to contain: $text" >&2
    echo "--- $file ---" >&2
    cat "$file" >&2
    exit 1
  fi
}

write_fake_git() {
  cat > "$bin_dir/git" <<'FAKE_GIT'
#!/usr/bin/env bash
printf '%s\n' "$*" > "$FAKE_GIT_ARGS_FILE"
if [ "${FAKE_GIT_EXIT:-0}" -ne 0 ]; then
  echo "git pull failed"
  exit "$FAKE_GIT_EXIT"
fi
echo "git pull succeeded"
FAKE_GIT
  chmod +x "$bin_dir/git"
}

write_fake_say() {
  cat > "$bin_dir/say" <<'FAKE_SAY'
#!/usr/bin/env bash
printf '%s\n' "$*" > "$FAKE_SAY_ARGS_FILE"
FAKE_SAY
  chmod +x "$bin_dir/say"
}

test_success_forwards_args_and_prints_chicken() {
  write_fake_git
  write_fake_say

  export PATH="$bin_dir:$PATH"
  export FAKE_GIT_ARGS_FILE="$tmp_dir/git-args"
  export FAKE_SAY_ARGS_FILE="$tmp_dir/say-args"
  export FAKE_GIT_EXIT=0

  "$repo_root/git-poule" --rebase origin main > "$tmp_dir/stdout" 2> "$tmp_dir/stderr"

  assert_contains "$tmp_dir/git-args" "pull --rebase origin main"
  assert_contains "$tmp_dir/say-args" "cot cot cot"
  assert_contains "$tmp_dir/stdout" "git pull succeeded"
  assert_contains "$tmp_dir/stdout" "cot cot"
}

test_failure_preserves_exit_and_skips_chicken() {
  write_fake_git
  write_fake_say

  export PATH="$bin_dir:$PATH"
  export FAKE_GIT_ARGS_FILE="$tmp_dir/git-args-fail"
  export FAKE_SAY_ARGS_FILE="$tmp_dir/say-args-fail"
  export FAKE_GIT_EXIT=7

  set +e
  "$repo_root/git-poule" --ff-only > "$tmp_dir/stdout-fail" 2> "$tmp_dir/stderr-fail"
  status="$?"
  set -e

  if [ "$status" -ne 7 ]; then
    echo "Expected exit status 7, got $status" >&2
    exit 1
  fi

  assert_contains "$tmp_dir/git-args-fail" "pull --ff-only"
  assert_contains "$tmp_dir/stdout-fail" "git pull failed"
  assert_not_contains "$tmp_dir/stdout-fail" "cot cot"
  assert_contains "$tmp_dir/stdout-fail" "KO"
  assert_contains "$tmp_dir/stdout-fail" "pull rate"
  if [ -e "$tmp_dir/say-args-fail" ]; then
    echo "Expected say not to be called on failure" >&2
    exit 1
  fi
}

test_success_forwards_args_and_prints_chicken
test_failure_preserves_exit_and_skips_chicken
echo "git-poule tests passed"
