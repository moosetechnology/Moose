Class {
	#name : #DudeUnclutterEngine,
	#superclass : #Object,
	#instVars : [
		'itCount',
		'upperLimit',
		'data1'
	],
	#category : #'SmallDude-Utils'
}

{ #category : #'instance creation' }
DudeUnclutterEngine class >> new: aCollectionOfNumbers [ 
	"	for an array of numbers sorted descending  
		ensures that the diference between any number and it's successor is larger than a givven value 
		this is achived by incrementally trying to push the numbers appart 
		why? so that clusters of numbers with very close values remain visible  
	" 
	 
	^(super new) 
		data: aCollectionOfNumbers; 
		maxIterations: 100; 
		upperBound: aCollectionOfNumbers first; 
		yourself
]

{ #category : #'initialize-release' }
DudeUnclutterEngine >> data: aCollectionOfNumbers [ 
	 
	data1 := aCollectionOfNumbers
]

{ #category : #engine }
DudeUnclutterEngine >> iteration: minDist on: clutteredData [ 
	 
	| last upperBound mod uData | 
	uData := OrderedCollection withAll: clutteredData. 
	upperBound := upperLimit - minDist. 
	mod := false. 
	last := upperLimit. 
	uData 
		doWithIndex: 
			[:m :i |  
			| dist | 
			dist := last - m. 
			dist < minDist 
				ifTrue: 
					[| shift | 
					mod := true. 
					shift := ((minDist - dist) / 2) ceiling. 
					uData 
						at: i 
						put: m - shift. 
					i > 1 
						ifTrue: 
							[| nld | 
							nld := last + shift. 
							nld > upperBound 
								ifTrue: 
									[uData 
										at: i - 1 
										put: upperBound. 
									upperBound := upperBound - minDist. 
									uData at: i put: upperBound] 
								ifFalse: 
									[uData 
										at: i - 1 
										put: nld]]]. 
			last := uData at: i]. 
	mod 
		ifTrue: [^uData] 
		ifFalse: [^clutteredData]	"changes have been made"	"no change needed"
]

{ #category : #'initialize-release' }
DudeUnclutterEngine >> maxIterations: numberOfIterations [ 
	 
	itCount := numberOfIterations
]

{ #category : #engine }
DudeUnclutterEngine >> unclutteredWith: minDist [ 
	"unclutter: anArray withMinDist: minDist andMaxIterations: itCount andUpperLimit: upperLimit" 
	 
	| mod itc uData | 
	itc := 0. 
	mod := true. 
	uData := data1. 
	[mod and: [itc < itCount]] 
		whileTrue: 
			[| uuData | 
			"self halt: 'cucu'." 
			uuData := self iteration: minDist on: uData. 
			mod := (uData == uuData) not. 
			uData := uuData. 
			itc := itc + 1]. 
	^mod 
		ifTrue: [^data1] 
		ifFalse: [^uData]	"failed"	"success"
]

{ #category : #'initialize-release' }
DudeUnclutterEngine >> upperBound: bound [ 
	 
	upperLimit := bound
]
