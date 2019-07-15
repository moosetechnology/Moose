Extension { #name : #MetacelloToolBox }

{ #category : #'*Moose-Development-Tools' }
MetacelloToolBox class >> mooseCreateFixedDevelopment: developmentVersionString for: configurationBasename importFromBaseline: baselineVersionString description: aString [

	<apiDocumentation>
	| toolbox versionSpec |
	(toolbox := self configurationNamed: configurationBasename)
		createVersionMethod: 'version' , (self stripVersionStringForSelector: developmentVersionString) , ':'
			inCategory: 'versions'
			forVersion: developmentVersionString;
		fixedImportFrom: baselineVersionString
			updateProjects: false
			updatePackages: true
			versionSpecsDo: [ :anAttribute :aVersionSpec | 
				anAttribute == #common
					ifTrue: [ 
						"update the author, blessing, description and timeStamp"
						aVersionSpec
							author: MetacelloPlatform current authorName;
							blessing: #stable;
							description: aString;
							timestamp: MetacelloPlatform current timestamp ].
				true ].

	versionSpec := toolbox methodSpec methodSections first versionSpec.
	(versionSpec packages list collect: #spec) do: [ :spec |
		spec 	
			projectDo: [ :projectSpec | projectSpec versionString: #'stable' ] 
			packageDo: [ :ignore| ] 
			groupDo: [ :ignore| ] ].
	versionSpec packages clearMemberMap.

	toolbox commitMethod.

	^ toolbox
]

{ #category : #'*Moose-Development-Tools' }
MetacelloToolBox class >> mooseCreateFixedVersion: targetVersionString for: configurationBasename from: sourceVersionString description: aString [
	
	<apiDocumentation>
	| toolbox sourceVersion |
	toolbox := self configurationNamed: configurationBasename.
	sourceVersion := toolbox project version: sourceVersionString.
	(targetVersionString indexOfSubCollection: 'baseline') > 0 
		ifTrue: [ self error: '' ].

	"create development version version from development version"
	self
		mooseCreateFixedDevelopment: targetVersionString
		for: configurationBasename
		importFromBaseline: sourceVersion versionString
		description: aString.

]
