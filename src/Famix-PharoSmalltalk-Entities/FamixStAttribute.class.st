Class {
	#name : #FamixStAttribute,
	#superclass : #FamixStStructuralEntity,
	#traits : 'FamixTAttribute + FamixTWithClassScope',
	#classTraits : 'FamixTAttribute classTrait + FamixTWithClassScope classTrait',
	#instVars : [
		'#hasClassScope'
	],
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAttribute class >> annotation [

	<MSEClass: #Attribute super: #FamixStStructuralEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStAttribute class >> generatedSlotNames [
	<generated>
	'FamixStAttribute class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStAttribute class >> generatedTraitNames [
	<generated>
	^ #(FamixTAttribute FamixTWithClassScope)
]

{ #category : #meta }
FamixStAttribute class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> beSharedVariable [

	self propertyNamed: #sharedVariable put: true 
]

{ #category : #accessing }
FamixStAttribute >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixStAttribute >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]

{ #category : #testing }
FamixStAttribute >> hasClassScope [
	<MSEProperty: #hasClassScope type: #Boolean>
	<MSEComment: 'True if class-side attribute'>

	^ hasClassScope
]

{ #category : #testing }
FamixStAttribute >> hasClassScope: aBoolean [

	hasClassScope := aBoolean
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> hierarchyNestingLevel [
	<MSEProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<MSEComment: 'Attribute hierarchy nesting level'>
		
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> hierarchyNestingLevel: aNumber [

	self privateState propertyAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> initialize [
	super initialize.
	hasClassScope := false.

]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> isSharedVariable [

	^ self propertyNamed: #sharedVariable ifNil: [false]
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> mooseNameOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil: 
		[ parent mooseNameOn: aStream.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
]

{ #category : #'Famix-Implementation' }
FamixStAttribute >> typeScope [
	^ self parentType
]
