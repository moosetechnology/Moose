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
			mooseIDE: spec.

		spec
			package: 'Moose-MenuBar' with: [
				spec requires:
						#( 'Famix' 'FamixTagging' 'FamixReplication' 'MooseIDE' ) ];
			package: 'Moose-Configuration';
			package: 'Moose-WelcomeBrowser'
			with: [ spec requires: #( 'Moose-Configuration' ) ].
		
		self groups: spec.
		spec postLoadDoIt: #registerMooseWelcomeBrowser ]
]

{ #category : #dependencies }
BaselineOfMoose >> famix: spec [

	spec
		baseline: 'Famix'
		with: [
		spec repository: 'github://moosetechnology/Famix:development/src' ]
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

	spec
		baseline: 'FamixTagging'
		with: [
		spec repository: 'github://moosetechnology/FamixTagging/src' ]
]

{ #category : #baselines }
BaselineOfMoose >> groups: spec [

	spec group: 'Metamodel' with: #( 'Famix' )
]

{ #category : #dependencies }
BaselineOfMoose >> mooseEasy: spec [

	spec
		baseline: 'MooseEasy'
		with: [
		spec repository: 'github://moosetechnology/Moose-Easy:v3/src' ]
]

{ #category : #dependencies }
BaselineOfMoose >> mooseIDE: spec [

	spec
		baseline: 'MooseIDE'
		with: [ 
		spec repository: 'github://moosetechnology/MooseIDE:development/src' ]
]

{ #category : #accessing }
BaselineOfMoose >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : #actions }
BaselineOfMoose >> registerMooseWelcomeBrowser [
	"For Pharo 11 and after"

	Smalltalk
		at: #MooseWelcomeBrowser
		ifPresent: [ :mooseWelcome | mooseWelcome register ]
]
