Class {
	#name : #DudeCleaningDecorator,
	#superclass : #Object,
	#instVars : [
		'nextComponent'
	],
	#category : #'SmallDude-Text'
}

{ #category : #'instance creation' }
DudeCleaningDecorator class >> new [ 
	"Answer a newly created and initialized instance." 
	 
	^super new initialize
]

{ #category : #'instance creation' }
DudeCleaningDecorator class >> next: aCleaningDecorator [ 
	 
	^(self new) 
		next: aCleaningDecorator; 
		yourself
]

{ #category : #actions }
DudeCleaningDecorator >> clean: aStringList [ 
	 
	| newStr | 
	newStr := self specificClean: aStringList. 
	nextComponent ~= nil ifTrue: [^nextComponent clean: newStr]. 
	^newStr
]

{ #category : #'initialize-release' }
DudeCleaningDecorator >> initialize [ 
	"Initialize a newly created instance. This method must answer the receiver." 
	" *** Edit the following to properly initialize instance variables ***" 
	 
	nextComponent := nil.	" *** And replace this comment with additional initialization code *** " 
	^self
]

{ #category : #'initialize-release' }
DudeCleaningDecorator >> next: aCleaningDecorator [ 
	 
	nextComponent := aCleaningDecorator
]

{ #category : #actions }
DudeCleaningDecorator >> specificClean: aText [ 
	 
	^self subclassResponsibility
]
