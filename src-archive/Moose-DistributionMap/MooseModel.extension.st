Extension { #name : #MooseModel }

{ #category : #'*Moose-DistributionMap' }
MooseModel >> allWithSmalltalkType: aClass [

	"return all entities of type aClass"
	"^ self entities select: [:each | each class = aClass ]."
	^ self allWithType: aClass
	
]

{ #category : #'*Moose-DistributionMap' }
MooseModel >> classConcernedByProperty: aSelector appliedTo: aClass [

	| concernedEntities type propertyResult |
	concernedEntities := self allWithSmalltalkType: aClass.
	concernedEntities do: [:each | 
		[propertyResult := (each perform: aSelector)] on: Error do: [:er | ^ nil].
		propertyResult isNil 
			ifTrue: [^ nil]
			ifFalse: [
				propertyResult isCollection
					ifFalse: [^ nil]
					ifTrue: [
						propertyResult ifNotEmpty: [
							type ifNil: [type := propertyResult anyOne class].
							(propertyResult anyOne class = type)  
								ifFalse: [^ nil]
							]
						]
				] 
		].
	^ type.
	
	
	
]

{ #category : #'*Moose-DistributionMap' }
MooseModel >> includesElementsOfType: aClass [

	"self entities detect: [:each | each class = aClass] ifNone: [^ false].
	^true"
	^ (self allWithType: aClass) isEmpty not
]

{ #category : #'*Moose-DistributionMap' }
MooseModel >> resultOfProperty: aSelectorOrAblock appliedTo: aClass [

	| concernedEntities  |
	concernedEntities := self allWithSmalltalkType: aClass.
	concernedEntities isEmpty ifFalse: [
		|result|
		result := concernedEntities detect: [:each | 
			|propertyResult|
			propertyResult := (aSelectorOrAblock rtValue: each).
			propertyResult isNil not] ifNone: [nil].
	
		result ifNotNil: [
			|propertyResult|
			propertyResult := aSelectorOrAblock rtValue: result.
			^ propertyResult 
			].	
		].
		
	^ nil
	
]
