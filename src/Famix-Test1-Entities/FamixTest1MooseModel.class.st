Class {
	#name : #FamixTest1MooseModel,
	#superclass : #MooseModel,
	#category : #'Famix-Test1-Entities'
}

{ #category : #generator }
FamixTest1MooseModel class >> generatedSlotNames [
	<generated>
	'FamixTest1MooseModel class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest1MooseModel class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #initialization }
FamixTest1MooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: FamixTest1Generator metamodel
]
