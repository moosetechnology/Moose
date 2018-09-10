"
I am a description of tokens all described by the referenced description, possible values are instances of ==SequenceableCollection==.
"
Class {
	#name : #MATokenDescription,
	#superclass : #MAReferenceDescription,
	#instVars : [
		'separators'
	],
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MATokenDescription class >> defaultKind [
	^ Array
]

{ #category : #'accessing-defaults' }
MATokenDescription class >> defaultSeparators [
	^ ' ,;', (String with: Character cr with: Character lf with: Character tab)
]

{ #category : #testing }
MATokenDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MATokenDescription class >> label [
	^ 'Token'
]

{ #category : #visiting }
MATokenDescription >> acceptMagritte: aVisitor [
	aVisitor visitTokenDescription: self
]

{ #category : #'acessing-magritte' }
MATokenDescription >> descriptionSeparators [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #separators;
		label: 'Separators';
		priority: 250;
		yourself
]

{ #category : #accessing }
MATokenDescription >> separators [
	^ separators ifNil: [ separators := self class defaultSeparators ]
]

{ #category : #accessing }
MATokenDescription >> separators: aString [
	"A string with the separator characters to split tokens, the first character is used as a default for printing."

	separators := aString
]
