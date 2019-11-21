"
Description
--------------------

I am a concrete validator that runs multiple checks on a FMMetaModelBuilder.
"
Class {
	#name : #FMMetamodelValidator,
	#superclass : #FMAbstractMetamodelValidator,
	#category : #'Fame-Core-Utilities'
}

{ #category : #'instance creation' }
FMMetamodelValidator class >> for: aPragmaProcessor [
	self new
		metaModelBuilder: aPragmaProcessor;
		validate
]

{ #category : #accessing }
FMMetamodelValidator >> validate [
	self
		validateLinksAreBijectifs;
		validatePropertiesHaveOpposites;
		validateContainersAreNotMultivalued
]

{ #category : #accessing }
FMMetamodelValidator >> validateContainersAreNotMultivalued [
	"It is not possible to have <multivalue> and <container> on the same method. A container represents a aggregation UML link that is incompatible with the multivalue kind of the link."

	| iterator |
	iterator := 
		self metaModelBuilder elements iterator
			| [ :element | element isFM3Property ] selectIt
			| [ :property | property isContainer ] selectIt
			| [ :property | property isMultivalued ] selectIt.

	self assert: iterator atEnd description: 'It is not possible to have <multivalue> and <container> on the same method. A container represents a aggregation UML link that is incompatible with the multivalue kind of the link.'
]

{ #category : #accessing }
FMMetamodelValidator >> validateLinksAreBijectifs [
	"Check that opposite link is bijective, i.e. there are not 2 values that references the same opposite."

	self metaModelBuilder elements iterator
		| #isFM3Property selectIt
		| #hasOpposite selectIt
		| #opposite groupedByIt
		| #value collectIt
		| [ :props | self assert: props size = 1 description: 'Link to opposite links should be a bijective operation... Please check your model because here you have a property with multiple opposites!' ] doIt
		| [ :props | self assert: props anyOne hasOpposite description: 'Some opposite links are not definied in your model.. Please check your model because here you have a property that is the opposite of another one but that is not referencing it back!' ] doIt
		> NullAddableObject
]

{ #category : #accessing }
FMMetamodelValidator >> validatePropertiesHaveOpposites [
	"In a metamodel some properties should have opposites. Those properties are:
	- containers
	- sources
	- targets
	
	We validate here that it is the case."

	| iterator |
	iterator := 
		self metaModelBuilder elements iterator
			| [ :element | element isFM3Property ] selectIt
			| [ :property | property isContainer or: [ property isSource or: [ property isTarget ] ] ] selectIt
			| [ :property | property hasOpposite ] rejectIt.

	self assert: iterator atEnd description: 'In a metamodel all container, source and target properties should have an opposite.'
]
