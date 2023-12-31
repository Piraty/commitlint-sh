# commitlint-sh

Lint your commits per
[conventional commits specification](https://conventionalcommits.org/)

Use this in post-commit hook and in your pipelines.

Requires:

* cat
* grep
* head
* mktemp
* sh

Portable! Works with gnu-coreutils, busybox, toybox.


## Usage

`commitlint` fails with nonzero exit status if the provided commit subject
doesn't conform conventionalcommits spec.

    # good
    echo "fix: some bugz" | commitlint

    # bad
    echo "malformed" | commitlint
    commitlint "malformed"

    # example CI usage
    git show --no-patch --pretty='format:%s' "${REF:-HEAD}" | commitlint


## License

[0BSD](https://spdx.org/licenses/0BSD.html), see [LICENSE](./LICENSE).


## Similar Projects

* [conventional-changelog/commitlint](https://github.com/conventional-changelog/commitlint)
* [tomtom-international/commisery](https://github.com/tomtom-international/commisery)
