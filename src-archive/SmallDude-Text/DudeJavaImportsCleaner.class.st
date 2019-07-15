Class {
	#name : #DudeJavaImportsCleaner,
	#superclass : #DudeCleaningDecorator,
	#category : #'SmallDude-Text'
}

{ #category : #'instance creation' }
DudeJavaImportsCleaner class >> new [ 
	"Answer a newly created and initialized instance." 
	 
	^super new initialize
]

{ #category : #actions }
DudeJavaImportsCleaner >> specificClean: text [ 
	 
	| crtLine | 
	1 
		to: text size 
		do: 
			[:lineNo |  
			crtLine := text at: lineNo. 
			(crtLine beginsWith: 'import ') ifTrue: [text at: lineNo put: '']]. 
	^text
]
