"
The scientific documentation of RoelTyper can be found in the article
 
	Fast Type Reconstruction for Dynamically Typed Programming Languages


I'm keeping the type information. I collaborate with a TypeCollector.


TypingResultKeeper forImage forClasses: { Array . Point }


TypingResultKeeper calculateTypesForClass: Point



TypingResultKeeper forImageExpanded
"
Class {
	#name : #TypingResultKeeper,
	#superclass : #Object,
	#instVars : [
		'timeTaken',
		'typeResults'
	],
	#category : #'RoelTyper-Core'
}

{ #category : #'instance creation' }
TypingResultKeeper class >> benchmarkImage [
	"self benchmarkImage"

	| keeper |
	^Time
		millisecondsToRun:
			[keeper := self forImage.
			keeper withAllInstvarResultsDo: [:cl :iv :result | result types]]
]

{ #category : #'instance creation' }
TypingResultKeeper class >> forImage [
	^self new forImage
]

{ #category : #'instance creation' }
TypingResultKeeper class >> forImageExpanded [
	| keeper |
	keeper := self forImage.
	keeper withAllInstvarResultsDo: [:cl :iv :result | result types].
	^keeper
]

{ #category : #private }
TypingResultKeeper >> addCollectorResult: collectorResult [
	collectorResult isEmpty ifTrue: [^self].
	typeResults
		at: collectorResult values first ivarClass
		put: collectorResult
]

{ #category : #private }
TypingResultKeeper >> addTypingResult: aTypeResult [
	| typeResultsForClass |
	typeResultsForClass := self typeResults
		at: aTypeResult ivarClass
		ifAbsentPut: [Dictionary new].
	typeResultsForClass
		at: aTypeResult ivarName
		put: aTypeResult
]

{ #category : #accessing }
TypingResultKeeper >> calculateTypesForClass: aClass [
	^TypeCollector typeInstvarsOfClass: aClass
]

{ #category : #public }
TypingResultKeeper >> forClasses: aClassList [
	| collector |
	collector := TypeCollector new.
	timeTaken := Time
		millisecondsToRun:
			[aClassList
				do:
					[:cl | 
					cl isMeta
						ifFalse:
							[self addCollectorResult: (collector typeInstvarsOfClass: cl)]]]
]

{ #category : #public }
TypingResultKeeper >> forImage [
	self forClasses: Object allSubclasses
]

{ #category : #'initialize-release' }
TypingResultKeeper >> initialize [
	typeResults := IdentityDictionary new
]

{ #category : #accessing }
TypingResultKeeper >> nrObjectTypes [
	| nr |
	nr := 0.
	self
		withAllInstvarResultsDo:
			[:cl :ivar :typeResult | (typeResult is: Object) ifTrue: [nr := nr + 1]].
	^nr
]

{ #category : #accessing }
TypingResultKeeper >> nrUniqueTypes [
	| nr |
	nr := 0.
	self
		withAllInstvarResultsDo:
			[:cl :ivar :typeResult | typeResult isSingularType ifTrue: [nr := nr + 1]].
	^nr
]

{ #category : #accessing }
TypingResultKeeper >> resetTypesForClass: aClass [
	^typeResults
		removeKey: aClass
		ifAbsent: []
]

{ #category : #private }
TypingResultKeeper >> resultsForClass: aClass instvar: instvar ifAbsent: absentBlock [
	| ivars |
	ivars := typeResults
		at: aClass
		ifAbsent: absentBlock.
	^ivars
		at: instvar
		ifAbsent: absentBlock
]

{ #category : #statistics }
TypingResultKeeper >> sameTypesAs: otherKeeper [
	| result correspondingResult |
	result := OrderedCollection new.
	self
		withAllInstvarResultsDo:
			[:cl :iv :res | 
			correspondingResult := otherKeeper
				typesForClass: cl
				instvar: iv.
			(res types sameElements: correspondingResult types)
				ifTrue: [result add: cl -> iv]].
	^result
]

{ #category : #accessing }
TypingResultKeeper >> timeTaken [
	^timeTaken
]

{ #category : #accessing }
TypingResultKeeper >> typeResults [
	^typeResults
]

{ #category : #accessing }
TypingResultKeeper >> typesForClass: aClass [
	^typeResults
		at: aClass
		ifAbsentPut: [self calculateTypesForClass: aClass]
]

{ #category : #accessing }
TypingResultKeeper >> typesForClass: aClass instvar: instvar [
	^(self typesForClass: aClass)
		at: instvar
		ifAbsent:
			[ExtractedType
				forInstvar: instvar
				inClass: aClass]
]

{ #category : #enumerating }
TypingResultKeeper >> withAllInstvarResultsDo: aBlock [
	self typeResults
		keysAndValuesDo:
			[:cl :instvarDict | 
			instvarDict
				keysAndValuesDo:
					[:ivar :typeResult | 
					aBlock
						value: cl
						value: ivar
						value: typeResult]]
]
