Class {
	#name : #FAMIXAttribute,
	#superclass : #FAMIXStructuralEntity,
	#traits : 'FamixTAttribute + FamixTWithClassScope',
	#classTraits : 'FamixTAttribute classTrait + FamixTWithClassScope classTrait',
	#instVars : [
		'#hasClassScope'
	],
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXAttribute class >> annotation [

	<MSEClass: #Attribute super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXAttribute class >> requirements [

	<generated>
	^ { FAMIXType }
]

{ #category : #'Famix-Smalltalk' }
FAMIXAttribute >> beInstanceVariable [

	self propertyNamed: #sharedVariable put: false 
]

{ #category : #'Famix-Smalltalk' }
FAMIXAttribute >> beSharedVariable [

	self propertyNamed: #sharedVariable put: true 
]

{ #category : #accessing }
FAMIXAttribute >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FAMIXAttribute >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]

{ #category : #accessing }
FAMIXAttribute >> hasClassScope [
	<MSEProperty: #hasClassScope type: #Boolean>
	<MSEComment: 'True if class-side attribute'>

	^ hasClassScope
]

{ #category : #accessing }
FAMIXAttribute >> hasClassScope: aBoolean [

	hasClassScope := aBoolean
]

{ #category : #'Famix-Extensions' }
FAMIXAttribute >> hierarchyNestingLevel [
	<MSEProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<MSEComment: 'Attribute hierarchy nesting level'>
		
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #'Famix-Extensions' }
FAMIXAttribute >> hierarchyNestingLevel: aNumber [

	self privateState propertyAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #initialization }
FAMIXAttribute >> initialize [
	super initialize.
	hasClassScope := false.

]

{ #category : #'Famix-Smalltalk' }
FAMIXAttribute >> isSharedVariable [

	"^ self propertyNamed: #sharedVariable ifAbsent: [false] "
	^ self propertyNamed: #sharedVariable ifNil: [false]
]

{ #category : #'Famix-Implementation' }
FAMIXAttribute >> mooseNameOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: aStream.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
]

{ #category : #'Famix-Implementation' }
FAMIXAttribute >> printOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil:
		[ aStream nextPutAll: parent name.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Attribute)'
]
