Class {
	#name : #FamixTagTestClass,
	#superclass : #FamixTagTestEntity,
	#traits : 'FamixTClass + FamixTSourceEntity',
	#classTraits : 'FamixTClass classTrait + FamixTSourceEntity classTrait',
	#category : #'Famix-Tagging-Tests-Entities-Entities'
}

{ #category : #meta }
FamixTagTestClass class >> annotation [

	<FMClass: #Class super: #FamixTagTestEntity>
	<package: #'Famix-Tagging-Tests-Entities'>
	<generated>
	^self
]

{ #category : #ambiguous }
FamixTagTestClass >> numberOfLinesOfCode [
	<FMProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<FMComment: 'The number of lines of code in a class'>
	^ self lookUpPropertyNamed: #numberOfLinesOfCode computedAs: [ self methodsGroup sumNumbers: #numberOfLinesOfCode ]
]

{ #category : #ambiguous }
FamixTagTestClass >> numberOfLinesOfCode: aNumber [

	self privateState propertyAt: #numberOfLinesOfCode put: aNumber
]
