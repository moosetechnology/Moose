Class {
	#name : #MAComposedDescriptionBuilder,
	#superclass : #MADescriptionBuilder,
	#category : #'Magritte-Model-Builder'
}

{ #category : #visiting }
MAComposedDescriptionBuilder >> setBuiltDescription: aDescription [ 
	| builders |
	builders := self target magritteDescription descriptionBuilders.
	builtDescription := aDescription.
	builders do: [ :each | builtDescription := each buildFrom: builtDescription target: target model: model ]
]

{ #category : #visiting }
MAComposedDescriptionBuilder >> visitContainer: aContainer [
	| builders |
	builders := aContainer descriptionBuilders.
	builtDescription := aContainer.
	builders do: [ :each | builtDescription := each buildFrom: builtDescription target: self target model: self model ]
]

{ #category : #'visiting-description' }
MAComposedDescriptionBuilder >> visitRelationDescription: aDescription [
	| builders buildedReference relationValue |
	builders := self target magritteDescription descriptionBuilders.
	buildedReference := aDescription reference.
	relationValue := (target readUsing: aDescription).
	relationValue ifNotNil: [ 
		builders do: [ :each | buildedReference := each buildFrom: buildedReference target: relationValue model: self model ].
		aDescription reference: buildedReference].
	super visitRelationDescription: aDescription
]
