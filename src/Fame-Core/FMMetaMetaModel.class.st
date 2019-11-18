"
Description
--------------------

I am a model containing the description of the Fame meta-model. I contain instances of FM3Element describing the FM3Elements.

Ideally, all my instances should be equivalent and I could be a singleton in read-only.
This is currently not the case because some tests are using me in a write mode but it might be a good idea to refactore this in the future.

I am my own meta-model.

For example, in the Smalltalk metamodel of Famix, if we want to represent the Point class we will have:
- A FMModel containing an instance of FamixStClass representing the Point class.
- A FMMetaModel containing instances of FM3Elements describing FamixStClass.
- A FMMetaMetaModel containing instances of FM3Element describing FM3 meta model (Package, Class and Property).

Examples
--------------------

	FMMetaMetaModel new
"
Class {
	#name : #FMMetaMetaModel,
	#superclass : #FMMetaModel,
	#category : #'Fame-Core-Models'
}

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
