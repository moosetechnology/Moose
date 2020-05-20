Class {
	#name : #FamixJavaAttribute,
	#superclass : #FamixJavaNamedEntity,
	#traits : 'FamixTAttribute + FamixTWithClassScope',
	#classTraits : 'FamixTAttribute classTrait + FamixTWithClassScope classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #metrics }
FamixJavaAttribute >> hierarchyNestingLevel [
	<FMProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<FMComment: 'Attribute hierarchy nesting level'>
		
	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs: [self belongsTo hierarchyNestingLevel]
]

{ #category : #metrics }
FamixJavaAttribute >> hierarchyNestingLevel: aNumber [
	self privateState cacheAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #printing }
FamixJavaAttribute >> printOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil:
		[ aStream nextPutAll: parent name.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Attribute)'
]
