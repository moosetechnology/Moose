Class {
	#name : #DudeSourceCodeFragment,
	#superclass : #FAMIXEntity,
	#instVars : [
		'beginLine',
		'endLine',
		'entity',
		'fragmentLength'
	],
	#category : #'SmallDude-Core'
}

{ #category : #meta }
DudeSourceCodeFragment class >> annotation [
	<MSEClass: #CodeFragment super: #FAMIXEntity>
	<package: #Dude>
]

{ #category : #'instance creation' }
DudeSourceCodeFragment class >> entity: anEntity beginLine: aLong endLine: anotherLong fragmentLength: fragmentLength [ 
	 
	^self new entity: anEntity beginLine: aLong endLine: anotherLong fragmentLength: fragmentLength
]

{ #category : #comparing }
DudeSourceCodeFragment >> = other [ 
	 
	^(self beginLine = other beginLine and: [self endLine = other endLine]) 
		and: [self entity = other entity]
]

{ #category : #accessing }
DudeSourceCodeFragment >> beginLine [ 
	 
	^beginLine
]

{ #category : #accessing }
DudeSourceCodeFragment >> clonedExternally [ 
	 
	^self privateState 
		propertyAt: #ClonedExternally 
		ifAbsent: [false]
]

{ #category : #accessing }
DudeSourceCodeFragment >> clonedExternally: aBoolean [ 
	 
	^self privateState propertyAt: #ClonedExternally put: aBoolean
]

{ #category : #accessing }
DudeSourceCodeFragment >> clonedInternally [ 
	 
	^self privateState 
		propertyAt: #ClonedInternally 
		ifAbsent: [false]
]

{ #category : #accessing }
DudeSourceCodeFragment >> clonedInternally: aBoolean [ 
	 
	^self privateState propertyAt: #ClonedInternally put: aBoolean
]

{ #category : #calculation }
DudeSourceCodeFragment >> codeLines [ 
	self flag: 'we should store the detector in the class side of DudeDetector'.
	^(self entity mooseModel smallDude codeBase at: entity) copyFrom: 
			beginLine to: endLine
]

{ #category : #accessing }
DudeSourceCodeFragment >> endLine [ 
	 
	^endLine
]

{ #category : #accessing }
DudeSourceCodeFragment >> entity [ 
	 
	^entity
]

{ #category : #'initialize-release' }
DudeSourceCodeFragment >> entity: anEntity beginLine: aLong endLine: anotherLong fragmentLength: aFragmentLength [ 
	 
	entity := anEntity. 
	beginLine := aLong. 
	endLine := anotherLong.
	self fragmentLength: aFragmentLength
]

{ #category : #'redirected access' }
DudeSourceCodeFragment >> entityName [ 
	 
	^entity mooseName
]

{ #category : #accessing }
DudeSourceCodeFragment >> fragmentLength [
	^ fragmentLength
]

{ #category : #accessing }
DudeSourceCodeFragment >> fragmentLength: anObject [
	fragmentLength := anObject
]

{ #category : #accessing }
DudeSourceCodeFragment >> mooseNameOn: stream [
	stream nextPutAll: self entity mooseName.
	stream nextPutAll: ' lines: '.
	stream nextPutAll: beginLine printString.
	stream nextPutAll:  ' - '.
	stream nextPutAll: endLine printString
]

{ #category : #accessing }
DudeSourceCodeFragment >> shortName [
	^ entity mooseName , '(' , beginLine printString , '-' , endLine printString , ')'
]

{ #category : #calculation }
DudeSourceCodeFragment >> textLines [ 
	 
	^(String textLinesFor: entity sourceText) copyFrom: beginLine to: endLine
]
