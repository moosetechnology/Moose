Class {
	#name : #FMMetamodelValidator,
	#superclass : #Object,
	#instVars : [
		'processor'
	],
	#category : #'Fame-SmalltalkBinding'
}

{ #category : #'instance creation' }
FMMetamodelValidator class >> for: aPragmaProcessor [
	self new
		processor: aPragmaProcessor;
		validate
]

{ #category : #accessing }
FMMetamodelValidator >> processor [
	^ processor
]

{ #category : #accessing }
FMMetamodelValidator >> processor: anObject [
	processor := anObject
]

{ #category : #accessing }
FMMetamodelValidator >> validate [
	self
		validateLinksAreBijectifs;
		validatePropertiesHaveOpposites
]

{ #category : #accessing }
FMMetamodelValidator >> validateLinksAreBijectifs [
	| fullDict wronglySetOpposites |
	"Check that opposite link is bijective, i.e. there are not 2 values that references the same opposite."
	fullDict := Dictionary new.
	self processor oppositeDict keysAndValuesDo: [ :prop :oppName | (fullDict at: (prop type propertyNamed: oppName) ifAbsentPut: [ Set new ]) add: prop originClass ].
	wronglySetOpposites := fullDict select: [ :e | e size ~= 1 ].

	self assert: wronglySetOpposites isEmpty description: 'Link to opposite links should be a bijective operation... Please check your model!'.

	self assert: (fullDict at: nil ifAbsent: [ #() ]) isEmpty description: 'Some opposite links are not definied in your model.. Please check your model!'
]

{ #category : #accessing }
FMMetamodelValidator >> validatePropertiesHaveOpposites [
	"In a metamodel some properties should have opposites. Those properties are:
	- containers
	- sources
	- targets
	
	We validate here that it is the case."

	self flag: #todo. "There is a bug in Fame currently preventing me to enable this check for now."
	"| properties propertiesThatShouldHaveOpposites wrongProperties |
	properties := self processor elements select: [ :element | element isFM3Property ].

	propertiesThatShouldHaveOpposites := properties select: [ :property | property isContainer or: [ property isSource or: [ property isTarget ] ] ].

	wrongProperties := propertiesThatShouldHaveOpposites reject: [ :property | property hasOpposite ].

	self assert: wrongProperties isEmpty description: 'In a metamodel all container, source and target properties should have an opposite.'"
]
