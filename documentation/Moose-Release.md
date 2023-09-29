# Moose Release

## How we manage Moose versions

We create dedicated branches for each new stable version of Moose (see branches `v8` and `v9`).
These branches will not evolve much. Commits will mostly be bugfixes and back-port of cherry-picked features.
The latest Moose version, on branch `development`is not considered stable.

## [ Optional ] Release stable versions of Moosetechnology projects
It may be necessary for the stable version to point to a specific commit of Moosetechnology repositories (Famix, FamixTagging, MooseIDE, etc). In this case, follow these steps in each repository:
- Create a release for the stable version, following semantic versionning (vX.Y.Z). This can be done using Github interface.
- Move or create generic tags to this release commit:
    - If you released `v2.0.0`, create tags `v2.x.x`and `v2.0.x`.
    - If you released `v2.3.5`, move tags `v2.x.x` and `v2.3.x`.

  This can't be done via Github interface. Use command line or a tool like Gitkraken (free version is ok):
  - Fast-forward the tag to `master`
  - Push the tag

You should always get 3 tags ponting to your release commit.

## Create a branch for the stable version

Create the new branch from development. Please name it following the existing scheme: `v8`, `v9`, `v10`, etc.

If you released stable versions of a Moose repository, update BaselineOfMoose accordingly: point to a specific tag instead of the generic one.

## Update `MooseVersion>>#initialize`

This class is responsible for holding and printing the correct Moose version. It is used in `MooseHelp`, the Moose welcome window.
Update the major number in `#initialize` to the new version number.

## Update CI files

Update the file Moose/.github/workflows/versions.json with the correct:
  - Moose version name
  - Compatible Pharo version(s)
  - Name for the release that will be updated when stable version evolves (should be vN.x.x).

If you want to build a new image after each push on the stable branch, add it to Moose/.github/workflows/continuous.yml in `development` branch:
```yaml
on:
  push:
    branches:
      - development
      - v9
      - # new stable branch vN
```

## Create a branch rule for the new branch

Go to Settings>Branches and add a rule.
Set the name pattern to the new branch name.
- Check 'Require a pull request before merging'
  - Uncheck 'Require approvals'
- Check 'Require status checks to pass before merging' then choose the version(s) of Pharo that should always pass before merging a PR.
- Check 'Include administrators'.

You may also have to edit the mandatory passing pharo versions in `development` rule.

## Update smalltalkCI

SmalltalkCI is a framework for testing Smalltalk projects. It is used on CIs by many users, including moosetechnology.
We provide Moose images so users can test directly on them instead of having to load Moose each time.

Fork the repository: https://github.com/hpi-swa/smalltalkCI and modify these files:
- /pharo/run.sh
- run.sh
- main.yml
- README.md

You can follow this commit: https://github.com/hpi-swa/smalltalkCI/commit/91d6f937173426baf03645e5a79fd488e0836006 for a precise example.

## Update Pharo Launcher sources

The images available on Pharo Launcher are defined in the file `your/path/to/Pharo/sources.list`.
You can also provide your own images by defining a new file `your/path/to/Pharo/mysources.list`
### 1- Test your sources locally by creating `mysources.list`.

Here is an example:
```
[
	PhLTemplateSource {
		#type : #URLGroup,
		#name : 'Moose 9 - stable',
		#templates : [
			PhLTemplateSource {
				#type : #URL,
				#name : 'Moose9',
				#url : 'https://github.com/moosetechnology/Moose/releases/download/v9.x.x/Moose9-stable-Pharo64-10.zip'
			}
		]
	}
]
```
You should see the changes in your pharo launcher. Please test your new sources by loading and launching the new images.

### 2- Update `sources.list`.

Fork Pharo launcher repository : https://github.com/pharo-project/pharo-launcher.
Modify `sources.list` with the sources you created for Moose. Remove any version that is not maintained nor used anymore.

Open a PR to Pharo launcher repository. Ask in this PR for your changes to be uploaded to https://files.pharo.org. This last step is mandatory for your changes to be integrated. If your PR is not noticed or the source file not updated to files.pharo.org, please contact Christophe Demarrey, Markus Denker, Guille Polito or Stéphane Ducasse directly. They will help you.

When your changes are uploaded, each Pharo Launcher will propose the source update (on restart). Please accept it and test your changes by loading Moose images.

## Inform Moose users
Send a mail to moose@inria.fr and give the links to the latest builds of Moose images. You can also do it via the Moose channel of the RMoD Discord.
