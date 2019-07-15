Class {
	#name : #MooseReleaser,
	#superclass : #Object,
	#category : #'Moose-Development-Tools'
}

{ #category : #release }
MooseReleaser class >> createStableVersioFor: aConfigurationClass withDescription: aString [
| developmentVersion project newVersionName devVersionString |
developmentVersion := aConfigurationClass project version: #development. 
project := MTProject
		newFromVersion: developmentVersion
		inConfiguration: aConfigurationClass.
		
newVersionName := VSCommitVersion major nextVersionOf: project.
devVersionString := developmentVersion versionString.

MetacelloToolBox
	mooseCreateFixedVersion: newVersionName
	for: project name
	from: devVersionString 
	description: (aString ifNil: [ 'version ' , newVersionName]).

project devWorkflow setStableBlessingFor: newVersionName.

MetacelloToolBox 
		stableVersion: newVersionName 
		for: project name
		platformAttribute: #'pharo5.x'.  "versioner uses $common"
		
"needed because the versioner script modified #development"
"project devWorkflow developmentVersion: devVersionString platformAttribute: #common."

project devWorkflow developmentVersion: #stable platformAttribute: #'pharo5.x'.	

]
