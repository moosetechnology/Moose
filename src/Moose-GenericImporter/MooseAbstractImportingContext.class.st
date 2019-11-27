"
This class represent a context retrieved from a metaModel (for exemple FAMIX). A context is a set of elements of the metamodel for which we tell if they have to be imported or not. For exemple, using the FAMIX MetaModel , we have elements such as 'FAMIXClass', 'FAMIXInvocation'. 'FAMIXInheritance' , .....
This class is building a dependency-tree according the dependencies present in  the MetaDescriptions of the metamodel classes. For example, when you choose to import methods (represented by FAMIXMethod) you will need to import classes too (represented by FAMIXClass). 
As several MetaModel can be used in Moose, this 'importingContext' should not be hardcoded but either retrieved from the metaModel used. 


Instance Variables

"
Class {
	#name : #MooseAbstractImportingContext,
	#superclass : #Object,
	#instVars : [
		'entityDependencies',
		'meta',
		'entitiesToBeExtracted',
		'fm3Elements'
	],
	#classInstVars : [
		'entityDependencies'
	],
	#category : #'Moose-GenericImporter-Contexts'
}

{ #category : #'instance creation' }
MooseAbstractImportingContext class >> fromMeta: aCollectionOfFM3Elements [


	^ super new initialize: aCollectionOfFM3Elements .
]

{ #category : #private }
MooseAbstractImportingContext >> allSubclassTypesNotAbstractFor: aFM3Property [
	| result |
	result := OrderedCollection new.
	(self hasSubclasses: aFM3Property type)
		ifTrue: [ aFM3Property implementingType allSubclasses
				do: [ :each | 
					(each ~= FAMIXPrimitiveType and: [ (self hasSubclasses: each asMooseDescription) not and: [ meta includes: each asMooseDescription ] ])
						ifTrue: [ result add: each asMooseDescription name ] ] ]
		ifFalse: [ (meta includes: aFM3Property type) ifTrue: [ result add: aFM3Property type name ] ].
	^ result
]

{ #category : #'initialize-release' }
MooseAbstractImportingContext >> defineEntityDependencies [
	| dependenciesElements dependenciesTypes |
	"we iterate over all elements (FM3Classes) of the metamodel"
	meta
		do: [ :element | 
			"we just keep classes that are not abstract (an abstract class will never be instanciated and therefore will never be a Moose Element)."
			(element isFM3Class and: [ (self hasSubclasses: element) not ])
				ifTrue: [ fm3Elements add: element.
					"we retrieve all attributes of this class"
					dependenciesElements := element allProperties
						select: [ :each | each isDerived not and: [ (#(#String #Number #Boolean #Object) includes: each type name) not ] ].

					dependenciesTypes := OrderedCollection new.
					dependenciesElements
						do: [ :each | 
							dependenciesTypes addAll: (self allSubclassTypesNotAbstractFor: each)
							"( #(#String #Number #Boolean #Object  ) includes: each  type superclass  name) 
					ifFalse: [ dependenciesTypes add: each type superclass name. ]" ].

					entityDependencies at: element name put: dependenciesTypes asSet asOrderedCollection ] ]
]

{ #category : #accessing }
MooseAbstractImportingContext >> entityDependencies [
	^ entityDependencies
]

{ #category : #private }
MooseAbstractImportingContext >> hasSubclasses: aFM3Class [
	^ aFM3Class implementingClass subclasses isNotEmpty
]

{ #category : #'importing - filters' }
MooseAbstractImportingContext >> importAll: aCollectionOfSymbols [
	aCollectionOfSymbols do: [ :each | self importEntityWithDependents: each ]
]

{ #category : #'importing - filters' }
MooseAbstractImportingContext >> importEntityWithDependents: aSymbol [
	entitiesToBeExtracted
		add: aSymbol;
		addAll: (entityDependencies at: aSymbol)
]

{ #category : #'initialize-release' }
MooseAbstractImportingContext >> initialize: aCollectionOfFM3Elements [
	super initialize.
	meta := aCollectionOfFM3Elements.
	entityDependencies := Dictionary new.
	entitiesToBeExtracted := Set new.
	fm3Elements := OrderedCollection new.
	self defineEntityDependencies
]
