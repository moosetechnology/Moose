"
MADescriptionFlattener  builds from a description with references to single objects a description, that is more flat. This allows us to render these descriptions, without ""cluttered"" labels. I.E. a nested description (MAInternalEditor) would render two labels: one for the ""main"" object and one for the ""fields"" in that object. Replacing a MAInternalEditor would not help, since this would not replace the label in front of this editor.

This description is used in a QCMultipartComponent and this is extracted since, visiting gives us more elegant code for this ""complex"" behaviour.

"
Class {
	#name : #MADescriptionFlattener,
	#superclass : #MADescriptionBuilder,
	#category : #'Magritte-Model-Builder'
}

{ #category : #visiting }
MADescriptionFlattener >> addToBuildedDescription: aDescription for: aValue [
	"aValue is the intermediate value that can be processed by further expansion"
	aDescription canExpand
		ifTrue: [ self expandDescription: aDescription for: aValue ]
		ifFalse: [ builtDescription add: aDescription ]
]

{ #category : #visiting }
MADescriptionFlattener >> expandDescription: aDescription for: aValue [
	aValue magritteDescription do: [ :each |
		| val |
		val := aValue readUsing: each.
		each
			addToAccessor: aDescription accessor;
			priority: aDescription priority + (each priority / 1000).
		aDescription groupExpandOnLabel
			ifTrue: [ each group: aDescription label ]
			ifFalse: [ each group: aDescription group ].
		self addToBuildedDescription: each for: val ]
]

{ #category : #'visiting-description' }
MADescriptionFlattener >> visitToOneRelationDescription: aDescription [
	| sample |
	aDescription canExpand ifFalse: [ ^ super visitToOneRelationDescription: aDescription ].
	sample := self target isCollection
		ifTrue: [
			self target ifEmpty: [ ^ super visitToOneRelationDescription: aDescription ].
			self target anyOne ]
		ifFalse: [ self target ].
	(sample readUsing: aDescription)
		ifNil: [ super visitToOneRelationDescription: aDescription ]
		ifNotNil: [ :value | self expandDescription: aDescription for: value ]
]
