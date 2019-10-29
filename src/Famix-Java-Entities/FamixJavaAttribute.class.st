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

	<FMClass: #Attribute super: #FamixJavaNamedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixJavaAttribute >> accessors [
	<FMProperty: #accessors type: #FamixTWithAccesses>
	<multivalued>
	<derived>
	^ (self incomingAccesses collectAsSet: [ :each | each accessor ]) asMooseGroup
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hasClassScope [
	<FMProperty: #hasClassScope type: #Boolean>
	<FMComment: 'True if class-side attribute'>

	^ hasClassScope
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hasClassScope: aBoolean [

	hasClassScope := aBoolean
]

{ #category : #'as yet unclassified' }
FamixJavaAttribute >> hierarchyNestingLevel [
	<FMProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<FMComment: 'Attribute hierarchy nesting level'>
		
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

{ #category : #accessing }
FamixJavaAttribute >> numberOfAccesses [
	<FMProperty: #numberOfAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses of an attribute.'>

	^self
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [self incomingAccesses size]
]

{ #category : #accessing }
FamixJavaAttribute >> numberOfAccessingClasses [
	<FMProperty: #numberOfAccessingClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes from which at least one method accesses an attribute.'>

	^self
		lookUpPropertyNamed: #numberOfAccessingClasses
		computedAs: [self accessingClasses size]
]

{ #category : #accessing }
FamixJavaAttribute >> numberOfAccessingMethods [
	<FMProperty: #numberOfAccessingMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods accessing an attribute.'>				
	
	^self
		lookUpPropertyNamed: #numberOfAccessingMethods
		computedAs: [self accessingMethods size]
]

{ #category : #accessing }
FamixJavaAttribute >> numberOfGlobalAccesses [
	<FMProperty: #numberOfGlobalAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses to an attribute from outside the class defining the attribute.'>	

	^self
		lookUpPropertyNamed: #numberOfGlobalAccesses
		computedAs: [self globalAccesses size]
]

{ #category : #accessing }
FamixJavaAttribute >> numberOfLocalAccesses [
	<FMProperty: #numberOfLocalAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses to an attribute from inside the class defining the attribute.'>
		
	^self
		lookUpPropertyNamed: #numberOfLocalAccesses
		computedAs: [self localAccesses size]
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
