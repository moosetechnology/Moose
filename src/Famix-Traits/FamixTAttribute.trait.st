"
FAMIXAttribute represents a field of a class. It is an attribute of the parent type.

"
Trait {
	#name : #FamixTAttribute,
	#instVars : [
		'#isClassSide => FMProperty',
		'#parentType => FMOne type: #FamixTWithAttributes opposite: #attributes'
	],
	#traits : 'FamixTStructuralEntity',
	#category : #'Famix-Traits-Attribute'
}

{ #category : #meta }
FamixTAttribute classSide >> annotation [

	<FMClass: #TAttribute super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #metrics }
FamixTAttribute >> hierarchyNestingLevel [
	<FMProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<FMComment: 'Attribute hierarchy nesting level'>
		
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #metrics }
FamixTAttribute >> hierarchyNestingLevel: aNumber [
	self privateState cacheAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #testing }
FamixTAttribute >> isAttribute [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTAttribute >> isClassSide [
	<FMProperty: #isClassSide type: #Boolean>
	<FMComment: 'True if class-side attribute'>
	^ isClassSide ifNil: [ false ]
]

{ #category : #accessing }
FamixTAttribute >> isClassSide: anObject [
	<generated>
	isClassSide := anObject
]

{ #category : #printing }
FamixTAttribute >> mooseNameOn: aStream [
	self parentType
		ifNotNil: [ :parent | 
			parent mooseNameOn: aStream.
			aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ]
]

{ #category : #accessing }
FamixTAttribute >> parentType [
	"Relation named: #parentType type: #FamixTWithAttributes opposite: #attributes"

	<generated>
	<FMComment: 'Type declaring the attribute. belongsTo implementation'>
	<container>
	^ parentType
]

{ #category : #accessing }
FamixTAttribute >> parentType: anObject [

	parentType := anObject.
	self resetMooseName.

]

{ #category : #navigation }
FamixTAttribute >> parentTypeGroup [
	<generated>
	<navigation: 'ParentType'>
	^ MooseGroup with: self parentType
]

{ #category : #printing }
FamixTAttribute >> printOn: aStream [
	self parentType
		ifNotNil: [ :parent | 
			aStream
				nextPutAll: parent name;
				nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Attribute)'
]
