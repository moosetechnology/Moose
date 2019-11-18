"
Description
--------------------

I am a model containing the description of the Fame meta-model. I contain instances of FM3Element describing the FM3Elements.

I am using a Singleton design pattern since I should only have one instance at a time in the image. (All meta-models should have the same meta-meta-model)

I am my own meta-model.

For example, in the Smalltalk metamodel of Famix, if we want to represent the Point class we will have:
- A FMModel containing an instance of FamixStClass representing the Point class.
- A FMMetaModel containing instances of FM3Elements describing FamixStClass.
- A FMMetaMetaModel containing instances of FM3Element describing FM3 meta model (Package, Class and Property).

Examples
--------------------

	FMMetaMetaModel default.
	
	FMMetaMetaModel testMetaMetaModel. ""This one will return a new instance if you wish to do some testing.""
"
Class {
	#name : #FMMetaMetaModel,
	#superclass : #FMMetaModel,
	#classVars : [
		'UniqueInstance'
	],
	#category : #'Fame-Core-Models'
}

{ #category : #accessing }
FMMetaMetaModel class >> default [
	^ UniqueInstance
		ifNil: [ UniqueInstance := super new
				metamodel;
				beReadOnlyObject;
				yourself ]
]

{ #category : #'instance creation' }
FMMetaMetaModel class >> new [
	^ self error: 'The FMMetaMetaModel should be accessed via the #default method. In case you need a new instance for tests purposes you can use #testMetaMetaModel.'
]

{ #category : #initialization }
FMMetaMetaModel class >> reset [
	<script>
	UniqueInstance := nil
]

{ #category : #accessing }
FMMetaMetaModel class >> testMetaMetaModel [
	^ super new
]

{ #category : #initialization }
FMMetaMetaModel >> defaultMetamodel [
	"The Meta Meta Model is its own Meta model."
	^ self
]

{ #category : #initialization }
FMMetaMetaModel >> initialize [
	super initialize.
	self
		addAll:
			(FMMetaModelBuilder new
				buildFM3;
				elements)
]

{ #category : #testing }
FMMetaMetaModel >> isMetaMetamodel [
	^ true
]
