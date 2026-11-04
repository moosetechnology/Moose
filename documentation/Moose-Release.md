# Moose Release

This document describes how to release a new stable version of Moose.
In the examples below, we release **Moose N** (e.g. Moose 13) while `development` moves on to **Moose N+1** (e.g. Moose 14).

## How we manage Moose versions

We create a dedicated branch for each stable version of Moose (`v8`, `v9`, ..., `v13`).
These branches do not evolve much: commits are mostly bugfixes and back-ports of cherry-picked features.
The latest Moose version, on branch `development`, is not considered stable.

Each stable branch has a GitHub release with a generic tag (`vN.x.x`, e.g. `v13.x.x`).
The CI updates the assets (zipped images) of this release every time the branch is built.
`development` builds update the `continuous` pre-release.

## 1. Release stable versions of Moosetechnology projects

The stable branch must not depend on the `development` branches of the other Moosetechnology repositories (Famix, FamixTagging, FamixReplication, MooseIDE, etc.), otherwise it will change every time these projects evolve.
In each of these repositories:

- Create a release for the stable version, following semantic versioning (`vX.Y.Z`). This can be done using the GitHub interface.
- [ Optional ] Move or create generic tags to this release commit:
  - If you released `v2.0.0`, create tags `v2.x.x` and `v2.0.x`.
  - If you released `v2.3.5`, move tags `v2.x.x` and `v2.3.x`.

  This cannot be done via the GitHub interface. Use the command line (`git tag -f v2.x.x <commit> && git push -f origin v2.x.x`) or a tool like GitKraken.

## 2. Create the branch for the stable version

Create the new branch from `development`. Name it following the existing scheme: `v8`, `v9`, ..., `vN`.

On this new branch, update `BaselineOfMoose>>#baseline:` so that each Moosetechnology dependency points to the release tag created in step 1 instead of `development`.
For example, on `v13`:

```smalltalk
spec repository: 'github://moosetechnology/Famix:v1.2.1/src'
```

## 3. Update `MooseVersion>>#initialize`

`MooseVersion` holds and prints the Moose version. It is shown in the Moose welcome window.

- On the new `vN` branch, check that the major number is `N`.
- On `development`, set the major number to `N+1`.

The commit hash is set automatically by the CI (see the `pre-upload-script` in `.github/workflows/test-and-release.yml`).

## 4. Update the CI

The Moose workflows (`.github/workflows/test.yml` and `.github/workflows/test-and-release.yml`) only call the reusable workflows of the [moosetechnology/.github](https://github.com/moosetechnology/.github) repository.
Their configuration (Pharo versions, image name, release tag) is stored in GitHub variables, not in files.
See the [README of moosetechnology/.github](https://github.com/moosetechnology/.github#readme) for details.

### 4.1 Add the branch to the workflow triggers

In `.github/workflows/test-and-release.yml`, add the new branch to the `push` triggers:

```yaml
on:
  push:
    branches:
      - development
      - v12
      - v13
      - vN # new stable branch
```

Do it **on both `development` and the new `vN` branch**: GitHub uses the workflow file of the branch that received the push, so a branch missing from its own file will not be built.

### 4.2 Update the organization variable `MOOSE_PHARO_VERSIONS`

In the moosetechnology organization settings (Settings > Secrets and variables > Actions > Variables), `MOOSE_PHARO_VERSIONS` maps each Moose version to the Pharo versions it is tested and built on:

```json
{
  "Moose-latest": ["Pharo64-13", "Pharo64-14"],
  "Moose14": ["Pharo64-14"],
  "Moose13": ["Pharo64-13", "Pharo64-14"],
  "Moose12": ["Pharo64-12", "Pharo64-13"]
}
```

- Add an entry `MooseN` with the Pharo version(s) compatible with the stable version.
- Update `Moose-latest` if `development` now targets a new Pharo version.

This variable is shared by all Moosetechnology repositories that use the reusable workflows.

### 4.3 Update the repository variable `BRANCHES_CONFIGURATION`

In the Moose repository settings (Settings > Secrets and variables > Actions > Variables), `BRANCHES_CONFIGURATION` gives, for each branch, its Moose version, the name of the generated image and the release to update:

```json
{
  "development": {
    "moose-version": "Moose-latest",
    "image-name": "Moose14-development",
    "release-tag": "continuous"
  },
  "v13": {
    "moose-version": "Moose13",
    "image-name": "Moose13-stable",
    "release-tag": "v13.x.x"
  }
}
```

- Add an entry for `vN` (`MooseN`, `MooseN-stable`, `vN.x.x`).
- Set the `development` image name to `MooseN+1-development`.

The generated images are named `<image-name>-<pharo-version>` (e.g. `Moose13-stable-Pharo64-13.zip`). Pharo Launcher and smalltalkCI download them using these names.

## 5. Create the GitHub release

Create a release on the `vN` branch with tag `vN.x.x` (e.g. title "Moose 13 - Stable") and mark it as latest.
The CI attaches the images to it on each build of the branch. You can trigger a first build manually from the Actions tab (`workflow_dispatch`).

Check that the release assets are present and that the images open correctly before going further.

## 6. Create a branch rule for the new branch

Go to Settings > Branches (or Rules > Rulesets) and add a rule for the new branch name:

- Check 'Require a pull request before merging'
  - Uncheck 'Require approvals'
- Check 'Require status checks to pass before merging', then choose the Pharo version(s) that must pass before merging a PR.
- Check 'Do not allow bypassing the above settings' (formerly 'Include administrators').

You may also have to edit the mandatory Pharo versions in the `development` rule.

## 7. Update smalltalkCI

[smalltalkCI](https://github.com/hpi-swa/smalltalkCI) is used to test Smalltalk projects on CIs, including in moosetechnology.
It provides Moose images (`Moose64-N`, `Moose64-trunk`) so that users can test directly on them instead of loading Moose each time.

Fork the repository and update:

- `pharo/run.sh`: in `moose::get_image_url`, point `Moose64-N` to the stable release (`.../releases/download/vN.x.x/MooseN-stable-Pharo64-<P>.zip`) and `Moose64-trunk` to the new development image (`.../releases/download/continuous/MooseN+1-development-Pharo64-<P>.zip`); add the matching VM selection in `pharo::get_vm_url` if needed.
- The list of supported images in `README.md`.
- The CI test matrix (`.github/workflows/main.yml`).

Open a PR to hpi-swa/smalltalkCI.
You can follow this commit for an example: https://github.com/hpi-swa/smalltalkCI/commit/91d6f937173426baf03645e5a79fd488e0836006

## 8. Update Pharo Launcher sources

The images available in Pharo Launcher are defined in `sources.list` (in the [pharo-launcher](https://github.com/pharo-project/pharo-launcher) repository, published at https://files.pharo.org/pharo-launcher/sources.list).
You can also define your own images in a local file `your/path/to/Pharo/mysources.list`.

### 8.1 Test your sources locally with `mysources.list`

Example:

```
[
	PhLTemplateSource {
		#type : #URLGroup,
		#name : 'Moose',
		#templates : [
			PhLTemplateSource {
				#type : #URL,
				#name : 'Moose Suite 14 (development)',
				#url : 'https://github.com/moosetechnology/Moose/releases/download/continuous/Moose14-development-Pharo64-14.zip'
			},
			PhLTemplateSource {
				#type : #URL,
				#name : 'Moose Suite 13 (stable)',
				#url : 'https://github.com/moosetechnology/Moose/releases/download/v13.x.x/Moose13-stable-Pharo64-13.zip'
			}
		]
	}
]
```

Restart Pharo Launcher: the new templates should appear. Test them by creating and launching the new images.

### 8.2 Update `sources.list`

Fork the pharo-launcher repository and modify `sources.list`:

- add the new stable version (`MooseN (stable)`) and the new development version (`MooseN+1 (development)`);
- rename the previous stable version to "old-stable";
- move versions that are not maintained anymore to the older Moose group, or remove them.

Open a PR to pharo-launcher. Ask in this PR for the file to be uploaded to https://files.pharo.org: this step is mandatory for your changes to reach users.
If your PR is not noticed or the file is not uploaded, contact the Pharo team (e.g. on the Pharo Discord).

Once uploaded, Pharo Launcher proposes the sources update on restart. Accept it and test your changes by loading the Moose images.

## 9. Inform Moose users

Send a mail to moose@inria.fr with the links to the new Moose images and the release notes.
You can also announce it in the Moose channel of the Pharo / RMoD Discord.
