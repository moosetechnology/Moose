Class {
	#name : #FAMIXParameterizedType,
	#superclass : #FAMIXType,
	#traits : 'FamixTParameterizedType + FamixTWithParameterizedTypeUsers',
	#classTraits : 'FamixTParameterizedType classTrait + FamixTWithParameterizedTypeUsers classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXParameterizedType class >> annotation [

	<MSEClass: #ParameterizedType super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #accessing }
FAMIXParameterizedType >> allSubclassesDo: aBlock [
	"we override this traversal because we want to
	traverse the parameter type"

	self parameterizableClass ifNotNil: [ :a | a withSubclassesDo: aBlock ]
]

{ #category : #accessing }
FAMIXParameterizedType >> allSuperclassesDo: aBlock [
	"we override this traversal because we want to
	traverse the parameter type"

	self parameterizableClass ifNotNil: [ :a | a withSuperclassesDo: aBlock ]
]

{ #category : #testing }
FAMIXParameterizedType >> isParameterizedType [
	^ true
]

{ #category : #printing }
FAMIXParameterizedType >> mooseNameOn: aStream [ 
	self parameterizableClass notNil 
		ifTrue: [self parameterizableClass mooseNameOn: aStream].
	aStream nextPut: $<.
	self arguments 
		do: [:each | each mooseNameOn: aStream]
		separatedBy: [aStream nextPut: $,].  
	aStream nextPut: $>.  

]
