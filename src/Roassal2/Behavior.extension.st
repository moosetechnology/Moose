Extension { #name : #Behavior }

{ #category : #'*Roassal2' }
Behavior >> dependentClassesWithOccurences [
	"Return the list of classes used myself. The result may contains multiple times the same element."
	
	"Morph dependentClassesWithOccurences"
	| cll | 
	cll := OrderedCollection new.
	"A class depends on its superclass"
	self superclass ifNotNil: [ cll add: self superclass ].
	
	"We unify a class and its metaclass"
	(self methods, self classSide methods) 
		do: [ :m | m literalsDo: [ :l | 
					"We also check if the method is not an extension"
					((((l isVariableBinding 
					and: [ l value notNil ]) 
					and: [ l value isBehavior ])
					and: [ m category notEmpty ] )
					and: [ m category first ~= $* ])  ifTrue: [ cll add: l value ] ]  ].
	^ cll asArray
]

{ #category : #'*Roassal2-Core' }
Behavior >> numberOfLinesOfCode [ 
	"Return the amount of lines of code"
	
	^ 5 + ((self rtmethods, self class rtmethods) inject: 0 into: [:sum :el | sum + el numberOfLinesOfCode ])
]

{ #category : #'*Roassal2-Core' }
Behavior >> numberOfVariables [
	"Return the number of variables"
	
	^ self instVarNames size
]
