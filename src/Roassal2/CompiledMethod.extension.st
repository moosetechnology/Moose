Extension { #name : #CompiledMethod }

{ #category : #'*roassal2' }
CompiledMethod >> ageInDays [

	^ (DateAndTime now - self date) asDays
]

{ #category : #'*roassal2' }
CompiledMethod >> ageInDaysAsInteger [

	^ self ageInDays asInteger
]

{ #category : #'*roassal2' }
CompiledMethod >> ageInDaysRounded [
	^ self ageInDays rounded
]

{ #category : #'*roassal2' }
CompiledMethod >> computeDate [
	"Return the DateAndTime associated to this method"
	| s nbOfSpaces |
	s := self timeStamp.
	nbOfSpaces := s select: [ :c | c = $  ].
	nbOfSpaces size = 1
		ifTrue: [ ^ DateAndTime fromString: s ].

	nbOfSpaces size = 2
		ifTrue: [ ^ DateAndTime fromString: (s copyAfter: $ ) ].
	
	"Default date, as it happens that some methods do not have a date"
	^ DateAndTime epoch
]

{ #category : #'*roassal2' }
CompiledMethod >> date [
	"Return the DateAndTime associated to me"
	^ (self properties includesKey: #date)
		ifTrue: [ self properties at: #date ]
		ifFalse: [ 
			| m |
			m := self computeDate.
			self properties at: #date put: m.
			m ]
]

{ #category : #'*roassal2' }
CompiledMethod >> dateSinceEpoch [
	^ self date - DateAndTime dosEpoch
]

{ #category : #'*roassal2' }
CompiledMethod >> dependentClasses [
	"Return the list of classes used myself. The result contains my superclass."
	
	"(Morph>>#drawOn:) dependentClasses"
	| cll | 
	cll := Set new.
	
	"We unify a class and its metaclass"
	self literalsDo: [ :l | 
					"We also check if the method is not an extension"
					((l isVariableBinding 
					and: [ l value notNil ]) 
					and: [ l value isBehavior ])  ifTrue: [ cll add: l value ] ].
	^ cll asArray
]

{ #category : #'*Roassal2' }
CompiledMethod >> dependentClassesWithOccurences [
	"Return the list of classes used myself. The result contains my superclass. The result may contains multiple times the same element."
	
	"(Morph>>#drawOn:) dependentClassesWithOccurences"
	"(CompiledMethod>>#dependentClassesWithOccurences) dependentClassesWithOccurences"
	| cll | 
	cll := OrderedCollection new.
	
	"We unify a class and its metaclass"
	self literalsDo: [ :l | 
					"We also check if the method is not an extension"
					((l isVariableBinding 
					and: [ l value notNil ]) 
					and: [ l value isBehavior ])  ifTrue: [ cll add: l value ] ].
	^ cll asArray
]

{ #category : #'*roassal2' }
CompiledMethod >> dependentMethods [
	"Return the list of methods defined in my class for which I may invoke"
	"(self >> #dependentMethods) dependentMethods"
	^ self messages
		select: [ :k | self methodClass methodDict includesKey: k ]
		thenCollect: [ :k | self methodClass >> k ]
]

{ #category : #'*roassal2' }
CompiledMethod >> livingInDays [

	^ (DateAndTime now - self date) asDays
]

{ #category : #'*roassal2' }
CompiledMethod >> numberOfLinesOfCode [
	(self propertyValueAt: #numberOfLinesOfCode)
		ifNil: [ self
				propertyValueAt: #numberOfLinesOfCode
				put: self sourceCode lineCount ].
	^ self propertyValueAt: #numberOfLinesOfCode
]

{ #category : #'*roassal2' }
CompiledMethod >> sourceCodeCached [
	"Retrieve or reconstruct the source code for this method.
	Cache the source to speedup accesses"
	
	"
	[ 10000 timesRepeat: [ (self >> #sourceCodeCached) sourceCode ] ] timeToRun
	[ 10000 timesRepeat: [ (self >> #sourceCodeCached) sourceCodeCached ] ] timeToRun
	"
	
	(self hasProperty: #sourceCode) 
		ifFalse: [ 
			self propertyValueAt: #sourceCode put: self sourceCode.
			self propertyValueAt: #sourceCode ].
	^ self propertyValueAt: #sourceCode
]

{ #category : #'*roassal2' }
CompiledMethod >> sourceCodeLinesCached [
	"Retrieve or reconstruct the source code for this method.
	Return the list of lines defining the source code.
	Cache the source to speedup accesses"
	
	"
	[ 10000 timesRepeat: [ (self >> #sourceCodeCached) sourceCode ] ] timeToRun
	[ 10000 timesRepeat: [ (self >> #sourceCodeCached) sourceCodeCached ] ] timeToRun
	"
	
	(self hasProperty: #sourceCodeLinesCached) 
		ifFalse: [ 
			self propertyValueAt: #sourceCodeLinesCached put: self sourceCode lines.
			self propertyValueAt: #sourceCodeLinesCached ].
	^ self propertyValueAt: #sourceCodeLinesCached
]

{ #category : #'*roassal2' }
CompiledMethod >> sourceNonEmptyCodeLinesCached [
	"Retrieve or reconstruct the source code for this method.
	Return the list of lines defining the source code.
	Cache the source to speedup accesses"
	
	"
	[ 10000 timesRepeat: [ (self >> #sourceNonEmptyCodeLinesCached) sourceCodeLinesCached ] ] timeToRun
	[ 10000 timesRepeat: [ (self >> #sourceNonEmptyCodeLinesCached) sourceNonEmptyCodeLinesCached ] ] timeToRun
	"
	
	(self hasProperty: #sourceNonEmptyCodeLinesCached) 
		ifFalse: [ 
			self propertyValueAt: #sourceNonEmptyCodeLinesCached put: (self sourceCode lines reject: [ :l | l trim isEmpty ]).
			self propertyValueAt: #sourceNonEmptyCodeLinesCached ].
	^ self propertyValueAt: #sourceNonEmptyCodeLinesCached
]
