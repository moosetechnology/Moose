Extension { #name : #FMModel }

{ #category : #'*Fame-Tests-Core' }
FMModel >> selectKindOf: smalltalkOrFameClass [

	^smalltalkOrFameClass isBehavior 
		ifTrue: [ self elements select: [ :each | each isKindOf: smalltalkOrFameClass ] ]
		ifFalse: [ self elements select: [ :each | (self metaDescriptionOf: each) = smalltalkOrFameClass ] ]
]
