Class {
	#name : #HismoAccessHistory,
	#superclass : #HismoAbstractHistory,
	#instVars : [
		'accessesHistory',
		'accessedInHistory'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoAccessHistory class >> annotation [
	<MSEClass: #AccessHistory super: #HismoAbstractHistory>
	<package: #Hismo>

]

{ #category : #'public interface' }
HismoAccessHistory >> accessedInHistory [
	
	accessedInHistory isNil
		ifTrue:
			[accessedInHistory := (self referenceHistory allMethodHistories
				select: [:each | each mooseName = self first accessedIn mooseName])
				first].
	^accessedInHistory
]

{ #category : #'public interface' }
HismoAccessHistory >> accessesHistory [
	
	accessesHistory isNil
		ifTrue:
			[| candidateList |
			candidateList := self referenceHistory allAttributeHistories
				select: [:each | each mooseName = self first accesses mooseName].
			accessesHistory := candidateList isEmpty
				ifFalse: [candidateList first]
				ifTrue: [nil]].
	^accessesHistory
]
