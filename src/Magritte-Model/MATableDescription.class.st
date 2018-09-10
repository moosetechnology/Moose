"
I am a description of tables, their cells and labels. I hold a reference to the description of my cells, that are all described using the same description. Possible values include instances of *MATableModel*.
"
Class {
	#name : #MATableDescription,
	#superclass : #MAReferenceDescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MATableDescription class >> defaultColumnLabels [
	^ OrderedCollection with: 'a' with: 'b' with: 'c'
]

{ #category : #'accessing-defaults' }
MATableDescription class >> defaultKind [
	^ MATableModel
]

{ #category : #'accessing-defaults' }
MATableDescription class >> defaultRowLabels [
	^ OrderedCollection with: '1' with: '2' with: '3'
]

{ #category : #testing }
MATableDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MATableDescription class >> label [
	^ 'Table'
]

{ #category : #visiting }
MATableDescription >> acceptMagritte: aVisitor [
	aVisitor visitTableDescription: self
]

{ #category : #accessing }
MATableDescription >> columnCount [
	^ self columnLabels size
]

{ #category : #'accessing-properties' }
MATableDescription >> columnLabels [
	^ self propertyAt: #columnLabels ifAbsent: [ self class defaultColumnLabels ]
]

{ #category : #'accessing-properties' }
MATableDescription >> columnLabels: aCollection [
	self propertyAt: #columnLabels put: aCollection
]

{ #category : #'accessing-textual' }
MATableDescription >> columnLabelsTextual [
	^ (MAStringDescription new toStringCollection: self columnLabels)
		asMultilineString
]

{ #category : #'accessing-textual' }
MATableDescription >> columnLabelsTextual: aString [
	self columnLabels: (MAStringDescription new fromStringCollection: aString lines)
]

{ #category : #'acessing-magritte' }
MATableDescription >> descriptionColumnLabels [
	<magritteDescription>
	^ MAMemoDescription new
		accessor: #columnLabelsTextual;
		label: 'Column Labels';
		priority: 250;
		yourself
]

{ #category : #'acessing-magritte' }
MATableDescription >> descriptionDefault [
	<magritteDescription>
	^ nil
]

{ #category : #'acessing-magritte' }
MATableDescription >> descriptionRequired [
	<magritteDescription>
	^ nil
]

{ #category : #'acessing-magritte' }
MATableDescription >> descriptionRowLabels [
	<magritteDescription>
	^ MAMemoDescription new
		accessor: #rowLabelsTextual;
		label: 'Row Labels';
		priority: 250;
		yourself
]

{ #category : #accessing }
MATableDescription >> rowCount [
	^ self rowLabels size
]

{ #category : #'accessing-properties' }
MATableDescription >> rowLabels [
	^ self propertyAt: #rowLabels ifAbsent: [ self class defaultRowLabels ]
]

{ #category : #'accessing-properties' }
MATableDescription >> rowLabels: aCollection [
	self propertyAt: #rowLabels put: aCollection
]

{ #category : #'accessing-textual' }
MATableDescription >> rowLabelsTextual [
	^ (MAStringDescription new toStringCollection: self rowLabels)
		asMultilineString
]

{ #category : #'accessing-textual' }
MATableDescription >> rowLabelsTextual: aString [
	self rowLabels: (MAStringDescription new fromStringCollection: aString lines)
]

{ #category : #'validation-private' }
MATableDescription >> validateSpecific: anObject [
	| errors |
	super validateSpecific: anObject.
	(anObject rowCount ~= self rowCount or: [ anObject columnCount ~= self columnCount ])
		ifTrue: [ MAKindError description: self signal: self kindErrorMessage ].
	errors := OrderedCollection new.
	anObject do: [ :row :value :each | 
		[ self reference validate: each ]
			on: MAValidationError
			do: [ :err | errors add: err ] ].
	errors isEmpty ifFalse: [
		MAMultipleErrors
			description: self 
			errors: errors
			signal: self label ]
]
