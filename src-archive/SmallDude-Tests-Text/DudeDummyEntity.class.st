Class {
	#name : #DudeDummyEntity,
	#superclass : #Object,
	#instVars : [
		'name',
		'code',
		'referenceModel',
		'mooseModel'
	],
	#category : #'SmallDude-Tests-Text'
}

{ #category : #'initialize-release' }
DudeDummyEntity class >> name: aString code: anotherString [ 
	 
	^self new name: aString code: anotherString
]

{ #category : #'initialize-release' }
DudeDummyEntity class >> new [ 
	"Answer a newly created and initialized instance." 
	 
	^super new
]

{ #category : #'initialize-release' }
DudeDummyEntity class >> wrappedName: eName code: code [ 
	 
	^self name: eName code: code
]

{ #category : #accessing }
DudeDummyEntity >> mooseModel [ 

	^ mooseModel ifNil: [mooseModel := DudeDummyModel new].
]

{ #category : #accessing }
DudeDummyEntity >> mooseName [ 
	 
	^name
]

{ #category : #'initialize-release' }
DudeDummyEntity >> name: aString code: anotherString [ 
	 
	name := aString. 
	code := anotherString. 
	referenceModel := DudeDummyModel new
]

{ #category : #accessing }
DudeDummyEntity >> sourceText [ 
	 
	^code
]
