Class {
	#name : #FAMIXGlobalVariable,
	#superclass : #FAMIXStructuralEntity,
	#traits : 'FamixTDefinedInModule + FamixTGlobalVariable',
	#classTraits : 'FamixTDefinedInModule classTrait + FamixTGlobalVariable classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXGlobalVariable class >> annotation [

	<FMClass: #GlobalVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXGlobalVariable class >> requirements [

	<generated>
	^ { FAMIXScopingEntity }
]

{ #category : #accessing }
FAMIXGlobalVariable >> accessors [
	<FMProperty: #accessors type: #FamixTWithAccesses>
	<multivalued>
	<derived>
	^ (self incomingAccesses collectAsSet: [ :each | each accessor ]) asMooseGroup
]

{ #category : #'Famix-Extensions' }
FAMIXGlobalVariable >> isPrivate [
	^ self isPublic not
]

{ #category : #'Famix-Extensions' }
FAMIXGlobalVariable >> isPublic [
	"checker whether I am called outside the module in which I am defined"
	^ self incomingAccesses anySatisfy: [:inv |
			inv accessor parentScope ~~ self parentScope]
]

{ #category : #accessing }
FAMIXGlobalVariable >> numberOfAccesses [
	<FMProperty: #numberOfAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses of an attribute.'>

	^self
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [self incomingAccesses size]
]

{ #category : #accessing }
FAMIXGlobalVariable >> numberOfAccessingClasses [
	<FMProperty: #numberOfAccessingClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes from which at least one method accesses an attribute.'>

	^self
		lookUpPropertyNamed: #numberOfAccessingClasses
		computedAs: [self accessingClasses size]
]

{ #category : #accessing }
FAMIXGlobalVariable >> numberOfAccessingMethods [
	<FMProperty: #numberOfAccessingMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods accessing an attribute.'>				
	
	^self
		lookUpPropertyNamed: #numberOfAccessingMethods
		computedAs: [self accessingMethods size]
]

{ #category : #accessing }
FAMIXGlobalVariable >> numberOfGlobalAccesses [
	<FMProperty: #numberOfGlobalAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses to an attribute from outside the class defining the attribute.'>	

	^self
		lookUpPropertyNamed: #numberOfGlobalAccesses
		computedAs: [self globalAccesses size]
]

{ #category : #accessing }
FAMIXGlobalVariable >> numberOfLocalAccesses [
	<FMProperty: #numberOfLocalAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses to an attribute from inside the class defining the attribute.'>
		
	^self
		lookUpPropertyNamed: #numberOfLocalAccesses
		computedAs: [self localAccesses size]
]

{ #category : #'Famix-Implementation' }
FAMIXGlobalVariable >> printOn: aStream [ 
	| parent |
	parent := self belongsTo.
	parent ifNotNil:
		[ aStream nextPutAll: parent name.
		aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (Global Variable)'
]
