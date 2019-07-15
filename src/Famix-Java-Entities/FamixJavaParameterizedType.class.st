Class {
	#name : #FamixJavaParameterizedType,
	#superclass : #FamixJavaType,
	#traits : 'FamixTParameterizedType + FamixTWithParameterizedTypeUsers',
	#classTraits : 'FamixTParameterizedType classTrait + FamixTWithParameterizedTypeUsers classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaParameterizedType class >> annotation [

	<MSEClass: #ParameterizedType super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaParameterizedType class >> generatedSlotNames [
	<generated>
	'FamixJavaParameterizedType class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaParameterizedType class >> generatedTraitNames [
	<generated>
	^ #(FamixTParameterizedType FamixTWithParameterizedTypeUsers)
]

{ #category : #meta }
FamixJavaParameterizedType class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
FamixJavaParameterizedType >> allSubclassesDo: aBlock [
	"we override this traversal because we want to
	traverse the parameter type"

	self parameterizableClass ifNotNil: [ :a | a withSubclassesDo: aBlock ]
]

{ #category : #'as yet unclassified' }
FamixJavaParameterizedType >> allSuperclassesDo: aBlock [
	"we override this traversal because we want to
	traverse the parameter type"

	self parameterizableClass ifNotNil: [ :a | a withSuperclassesDo: aBlock ]
]

{ #category : #'as yet unclassified' }
FamixJavaParameterizedType >> isParameterizedType [
	^ true
]

{ #category : #'as yet unclassified' }
FamixJavaParameterizedType >> mooseNameOn: aStream [ 
	self parameterizableClass notNil 
		ifTrue: [self parameterizableClass mooseNameOn: aStream].
	aStream nextPut: $<.
	self arguments 
		do: [:each | each mooseNameOn: aStream]
		separatedBy: [aStream nextPut: $,].  
	aStream nextPut: $>.  

]

{ #category : #'as yet unclassified' }
FamixJavaParameterizedType >> namespaceScope [
	"we ask the namespaceScope of the parameterizable class"
	
	^ self parameterizableClass ifNotNil: [
		self parameterizableClass namespaceScope ]
]
