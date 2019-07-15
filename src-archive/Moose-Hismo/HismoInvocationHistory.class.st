Class {
	#name : #HismoInvocationHistory,
	#superclass : #HismoAbstractHistory,
	#instVars : [
		'candidateHistories',
		'invokedByHistory',
		'receivingClassHistory'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoInvocationHistory class >> annotation [
	<MSEClass: #InvocationHistory super: #HismoAbstractHistory>
	<package: #Hismo>

]

{ #category : #'public interface' }
HismoInvocationHistory >> candidateHistories [
	
	candidateHistories isNil
		ifTrue:
			[candidateHistories := self first candidates
				collect:
					[:eachCandidate | 
					(self referenceHistory allMethodHistories
						select: [:each | each mooseName = eachCandidate mooseName]) first]].
	^candidateHistories
]

{ #category : #'public interface' }
HismoInvocationHistory >> invokedByHistory [
	
	invokedByHistory isNil
		ifTrue:
			[invokedByHistory := (self referenceHistory allMethodHistories
				select: [:each | each mooseName = self first invokedBy mooseName])
				first].
	^invokedByHistory
]

{ #category : #'public interface' }
HismoInvocationHistory >> invokes [
	
	^self first invokes
]

{ #category : #'public interface' }
HismoInvocationHistory >> receivingClassHistory [
	
	receivingClassHistory isNil
		ifTrue:
			[receivingClassHistory := self first receivingClass isNil
				ifTrue: [nil]
				ifFalse:
					[(self referenceHistory allClassHistories
						select: [:each | each mooseName = self first receivingClass asSymbol])
						first]].
	^receivingClassHistory
]
