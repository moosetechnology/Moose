Class {
	#name : #FamixJavaAttribute,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixJavaTStructuralEntity + FamixTAttribute + FamixTWithClassScope',
	#classTraits : 'FamixJavaTStructuralEntity classTrait + FamixTAttribute classTrait + FamixTWithClassScope classTrait',
	#instVars : [
		'#hasClassScope'
	],
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAttribute class >> annotation [

	<MSEClass: #Attribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixJavaAttribute >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixJavaAttribute >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hasClassScope [
	<MSEProperty: #hasClassScope type: #Boolean>
	<MSEComment: 'True if class-side attribute'>

	^ hasClassScope
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hasClassScope: aBoolean [

	hasClassScope := aBoolean
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hierarchyNestingLevel [
	<MSEProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<MSEComment: 'Attribute hierarchy nesting level'>
		
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hierarchyNestingLevel: aNumber [

	self privateState propertyAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> initialize [
	super initialize.
	hasClassScope := false.

]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> mooseNameOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: aStream.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> printOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil:
		[ aStream nextPutAll: parent name.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Attribute)'
]
