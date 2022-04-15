#!/bin/sh
#
# changed_templates_latest_commit.sh
# similar to the changed_templates.sh script in common/travis, but it gets the
# changed packages since the latest commit instead of only ones that are from
# other branches or whatever exactly the other script does.

if command -v chroot-git >/dev/null 2>&1; then
	GIT_CMD=$(command -v chroot-git)
elif command -v git >/dev/null 2>&1; then
	GIT_CMD=$(command -v git)
fi

changed_packages=$($GIT_CMD diff-tree -r --no-renames --name-only --diff-filter=AM "HEAD^" "HEAD" 'srcpkgs/*/template' | cut -d/ -f 2)
changed_count=$(printf '%s\n' "$changed_packages" | wc -l)

# only accept 1 changed package per build
if [ -z "$changed_packages" ]; then
	printf 'No changed packages\n'
	exit 1
elif [ "$changed_count" -ne 1 ]; then
	printf 'More than 1 package was changed\n'
	exit 1
fi

printf '%s\n' "$changed_packages"
exit 0
