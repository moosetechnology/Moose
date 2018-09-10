Class {
	#name : #HismoInheritanceDefinitionHistory,
	#superclass : #HismoAbstractHistory,
	#instVars : [
		'subHistory',
		'superHistory'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoInheritanceDefinitionHistory class >> annotation [
	<MSEClass: #InheritanceDefinitionHistory super: #HismoAbstractHistory>
	<package: #Hismo>

]

{ #category : #'public interface' }
HismoInheritanceDefinitionHistory >> subHistory [
	
	subHistory isNil
		ifTrue:
			[subHistory := self referenceHistory allClassHistories
				detect: [:each | each mooseName = self first subclass mooseName]
				ifNone: [nil]].
	^subHistory
]

{ #category : #'public interface' }
HismoInheritanceDefinitionHistory >> superHistory [
	
	superHistory isNil
		ifTrue:
			[superHistory := self referenceHistory allClassHistories
				detect: [:each | each mooseName = self first superclass mooseName]
				ifNone: [nil]].
	^superHistory
]
