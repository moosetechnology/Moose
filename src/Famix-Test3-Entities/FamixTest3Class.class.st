Class {
	#name : #FamixTest3Class,
	#superclass : #FamixTest3Types,
	#traits : 'FamixTClass + FamixTContainingWithInvocationsGlue + FamixTLCOMMetrics + FamixTWithMethods',
	#classTraits : 'FamixTClass classTrait + FamixTContainingWithInvocationsGlue classTrait + FamixTLCOMMetrics classTrait + FamixTWithMethods classTrait',
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3Class class >> annotation [

	<MSEClass: #Class super: #FamixTest3Types>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixTest3Class class >> generatedSlotNames [
	<generated>
	'FamixTest3Class class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTest3Class class >> generatedTraitNames [
	<generated>
	^ #(FamixTClass FamixTContainingWithInvocationsGlue FamixTLCOMMetrics FamixTWithMethods)
]

{ #category : #meta }
FamixTest3Class class >> requirements [

	<generated>
	^ {  }
]
