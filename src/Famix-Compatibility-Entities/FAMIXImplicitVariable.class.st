Class {
	#name : #FAMIXImplicitVariable,
	#superclass : #FAMIXStructuralEntity,
	#traits : 'FamixTImplicitVariable',
	#classTraits : 'FamixTImplicitVariable classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXImplicitVariable class >> annotation [

	<FMClass: #ImplicitVariable super: #FAMIXStructuralEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #meta }
FAMIXImplicitVariable class >> requirements [

	<generated>
	^ { FAMIXBehaviouralEntity }
]

{ #category : #accessing }
FAMIXImplicitVariable >> accessors [
	<FMProperty: #accessors type: #FamixTWithAccesses>
	<multivalued>
	<derived>
	^ (self incomingAccesses collectAsSet: [ :each | each accessor ]) asMooseGroup
]

{ #category : #'Famix-Implementation' }
FAMIXImplicitVariable >> isSelf [
	^ self name = #self
]

{ #category : #'Famix-Implementation' }
FAMIXImplicitVariable >> isSuper [
	^ self name == #super
]

{ #category : #'Famix-Implementation' }
FAMIXImplicitVariable >> mooseNameOn: stream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ parent mooseNameOn: stream.
		stream nextPut: $. ].

	self name ifNotNil: [ stream nextPutAll: self name ]
]

{ #category : #accessing }
FAMIXImplicitVariable >> numberOfAccesses [
	<FMProperty: #numberOfAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses of an attribute.'>

	^self
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [self incomingAccesses size]
]

{ #category : #accessing }
FAMIXImplicitVariable >> numberOfAccessingClasses [
	<FMProperty: #numberOfAccessingClasses type: #Number>
	<derived>
	<FMComment: 'The number of classes from which at least one method accesses an attribute.'>

	^self
		lookUpPropertyNamed: #numberOfAccessingClasses
		computedAs: [self accessingClasses size]
]

{ #category : #accessing }
FAMIXImplicitVariable >> numberOfAccessingMethods [
	<FMProperty: #numberOfAccessingMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods accessing an attribute.'>				
	
	^self
		lookUpPropertyNamed: #numberOfAccessingMethods
		computedAs: [self accessingMethods size]
]

{ #category : #accessing }
FAMIXImplicitVariable >> numberOfGlobalAccesses [
	<FMProperty: #numberOfGlobalAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses to an attribute from outside the class defining the attribute.'>	

	^self
		lookUpPropertyNamed: #numberOfGlobalAccesses
		computedAs: [self globalAccesses size]
]

{ #category : #accessing }
FAMIXImplicitVariable >> numberOfLocalAccesses [
	<FMProperty: #numberOfLocalAccesses type: #Number>
	<derived>
	<FMComment: 'The number of accesses to an attribute from inside the class defining the attribute.'>
		
	^self
		lookUpPropertyNamed: #numberOfLocalAccesses
		computedAs: [self localAccesses size]
]

{ #category : #'Famix-Implementation' }
FAMIXImplicitVariable >> printOn: aStream [ 
	| parent |
	parent := self parentBehaviouralEntity.
	parent ifNotNil: 
		[ aStream nextPutAll: parent name.
		  aStream nextPut: $. ].
	self name ifNotNil: [ aStream nextPutAll: self name ].
	aStream nextPutAll: ' (ImplicitVariable)'
]
