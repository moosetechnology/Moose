"
Description
--------------------

Baseline for the Famix project
"
Class {
	#name : #BaselineOfFamix,
	#superclass : #BaselineOf,
	#category : #BaselineOfFamix
}

{ #category : #baseline }
BaselineOfFamix >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Dependencies"
			spec baseline: 'Famix' with: [ spec repository: 'github://moosetechnology/Famix:v1.x.x/src' ].

			self
				famixGroup: 'Core' with: spec;
				famixGroup: 'Minimal' with: spec;
				famixGroup: 'Basic' with: spec;
				famixGroup: 'CommentAnalyzes' with: spec;
				famixGroup: 'TestsResources' with: spec;
				famixGroup: 'BasicTraits' with: spec;
				famixGroup: 'EntitiesCompatibility' with: spec;
				famixGroup: 'ModelCompatibility' with: spec;
				famixGroup: 'EntitiesJava' with: spec;
				famixGroup: 'ModelJava' with: spec;
				famixGroup: 'EntitiesSmalltalk' with: spec;
				famixGroup: 'ModelSmalltalk' with: spec;
				famixGroup: 'Importers' with: spec;
				famixGroup: 'TestModels' with: spec;
				famixGroup: 'Tests' with: spec ]
]

{ #category : #dependencies }
BaselineOfFamix >> famix: spec [
	spec baseline: 'Famix' with: [ spec repository: 'github://moosetechnology/Famix:development/src' ]
]

{ #category : #dependencies }
BaselineOfFamix >> famixGroup: aString with: spec [
	| groupName |
	groupName := 'Famix' , aString.
	spec project: groupName copyFrom: 'Famix' with: [ spec loads: aString ].

	spec group: aString with: {groupName}
]

{ #category : #accessing }
BaselineOfFamix >> projectClass [
	^ MetacelloCypressBaselineProject
]
