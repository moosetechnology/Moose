Class {
	#name : #TokenCollectorMorph,
	#superclass : #Morph,
	#instVars : [
		'options',
		'tokenViewer',
		'textInput',
		'entryCompletion',
		'stringEncoder',
		'stringDecoder',
		'objects',
		'whenObjectsChangedBlock',
		'factory'
	],
	#category : #'Magritte-Morph-Morphs'
}

{ #category : #private }
TokenCollectorMorph >> accept: text [
	| object |
	object := self options
		detect: [ :e | self stringDecoder value: e value: text ]
		ifNone: [ factory value: text ].
	self objects add: object.
	whenObjectsChangedBlock ifNotNil: [ :blk | blk value: self objects ].
	self refresh
]

{ #category : #'private-building' }
TokenCollectorMorph >> entryCompletion [

	entryCompletion ifNotNil: [ ^ entryCompletion ].
	^ entryCompletion := EntryCompletion new
			dataSourceBlock: [ :currText | self options collect: self stringEncoder ];
			filterBlock: [ :currApplicant :currText | currApplicant asString asUppercase includesSubstring: currText asString asUppercase ];
			yourself.
]

{ #category : #accessing }
TokenCollectorMorph >> factory [

	^ factory ifNil: [ factory := [ :text | text ] ]
]

{ #category : #accessing }
TokenCollectorMorph >> factory: aBlock [

	factory := aBlock
]

{ #category : #initialization }
TokenCollectorMorph >> initialize [

	super initialize.
	self
		changeTableLayout;
		vResizing: #shrinkWrap.
	self
		addMorphBack: self textInput;
		addMorphBack: self tokenViewer
]

{ #category : #accessing }
TokenCollectorMorph >> objects [
	^ objects ifNil: [ objects := OrderedCollection new ]
]

{ #category : #accessing }
TokenCollectorMorph >> objects: aCollection [
	objects := aCollection.
	self refresh
]

{ #category : #accessing }
TokenCollectorMorph >> options [
	^ options
]

{ #category : #accessing }
TokenCollectorMorph >> options: anObject [
	options := anObject
]

{ #category : #private }
TokenCollectorMorph >> refresh [
	self textInput model model text: ''.
	self tokenViewer removeAllMorphs.
	self objects do: [ :object |
		self tokenViewer addMorphBack: (TokenMorph on: object) ]
					
]

{ #category : #'private-building' }
TokenCollectorMorph >> stringDecoder [
	"Test whether a string represents an object"
	^ stringDecoder ifNil: [ stringDecoder := [ :obj :str | obj asString = str ] ]
]

{ #category : #accessing }
TokenCollectorMorph >> stringDecoder: aBlock [
	stringDecoder := aBlock
]

{ #category : #'private-building' }
TokenCollectorMorph >> stringEncoder [
	^ stringEncoder ifNil: [ stringEncoder := [ :obj | obj asString ] ]
]

{ #category : #accessing }
TokenCollectorMorph >> stringEncoder: aBlock [
	"Turn data object into a string"
	stringEncoder := aBlock
]

{ #category : #'private-building' }
TokenCollectorMorph >> textInput [

	textInput ifNotNil: [ ^ textInput ].
	textInput := TextInputFieldModel new
		entryCompletion: self entryCompletion;
		acceptBlock: [ :text | self accept: text ];
		buildWithSpec.
	textInput
		vResizing: #rigid;
		height: textInput textFont height + (textInput borderWidth * 2).
	^ textInput
]

{ #category : #'private-building' }
TokenCollectorMorph >> tokenViewer [
	tokenViewer ifNotNil: [ ^ tokenViewer ].
	^ tokenViewer := Morph new
			color: UITheme current backgroundColor;
			changeTableLayout;
			vResizing: #shrinkWrap;
			hResizing: #spaceFill;
			listDirection: #leftToRight;
			wrapDirection: #topToBottom;
			cellInset: 5 @ 5;
			yourself.
]

{ #category : #accessing }
TokenCollectorMorph >> whenObjectsChanged: aBlock [

	whenObjectsChangedBlock := aBlock
]
