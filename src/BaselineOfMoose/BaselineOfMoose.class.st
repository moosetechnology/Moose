"
rce: 22987863
"
Class {
	#name : #BaselineOfMoose,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoose
}

{ #category : #baselines }
BaselineOfMoose >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self
			famix: spec;
			famixTagging: spec;
			famixReplication: spec;
			mooseEasy: spec;
			mooseIDE: spec;
			neoCSV: spec.

		spec
			package: 'Moose-MenuBar' with: [
				spec requires:
						#( 'Famix' 'FamixTagging' 'FamixReplication' 'NeoCSV' 'MooseIDE' ) ];
			package: 'Moose-Configuration';
			package: 'Famix-Visualizations' ].

	spec for: #( #'pharo10.x' #'pharo9.x' #'pharo8.x' ) do: [
		spec package: 'Moose-Help-ToRemove'.
		spec postLoadDoIt: #registerMooseWelcome ].

	spec for: #'pharo11.x' do: [
		spec
			package: 'Moose-WelcomeBrowser'
			with: [ spec requires: #( 'Moose-Configuration' ) ].
		spec postLoadDoIt: #registerMooseWelcomeBrowser ]
]

{ #category : #dependencies }
BaselineOfMoose >> famix: spec [
	spec baseline: 'Famix' with: [ spec repository: 'github://moosetechnology/Famix:development/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> famixReplication: spec [

	spec
		baseline: 'FamixReplication'
		with: [ 
		spec repository: 'github://moosetechnology/FamixReplication:' ]
]

{ #category : #dependencies }
BaselineOfMoose >> famixTagging: spec [

	spec baseline: 'FamixTagging' with: [
		spec repository:
			'github://moosetechnology/FamixTagging:master/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> mooseEasy: spec [
	spec baseline: 'MooseEasy' with: [ spec repository: 'github://moosetechnology/Moose-Easy:v2/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> mooseIDE: spec [

	spec
		baseline: 'MooseIDE'
		with: [ 
		spec repository: 'github://moosetechnology/MooseIDE:development/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> neoCSV: spec [
	spec
		baseline: 'NeoCSV'
		with: [ spec
				loads: 'core';
				repository: 'github://svenvc/NeoCSV/repository' ]
]

{ #category : #accessing }
BaselineOfMoose >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #actions }
BaselineOfMoose >> registerMooseWelcome [
	"For Pharo 10 and before"

	Smalltalk
		at: #MooseWelcome
		ifPresent: [ :mooseWelcome | mooseWelcome register ]
]

{ #category : #actions }
BaselineOfMoose >> registerMooseWelcomeBrowser [
	"For Pharo 11 and after"

	Smalltalk
		at: #MooseWelcomeBrowser
		ifPresent: [ :mooseWelcome | mooseWelcome register ]
]
