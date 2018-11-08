Class {
	#name : #FAMIXNamedEntity,
	#superclass : #FAMIXSourcedEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTNamed + FamixTPackageable + FamixTPossibleStub + FamixTWithAnnotationInstances + FamixTWithModifiers + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTNamed classTrait + FamixTPackageable classTrait + FamixTPossibleStub classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithModifiers classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FAMIXSourcedEntity>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Moose-Query-Extensions' }
FAMIXNamedEntity class >> belongsToMethod [
	^ self compiledMethodAt: #belongsTo ifAbsent: nil
]

{ #category : #generator }
FAMIXNamedEntity class >> generatedSlotNames [
	<generated>
	'FAMIXNamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FAMIXNamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTInvocationsReceiver FamixTNamed FamixTPackageable FamixTPossibleStub FamixTWithAnnotationInstances FamixTWithModifiers TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FAMIXNamedEntity class >> requirements [

	<generated>
	^ { FAMIXPackage }
]

{ #category : #'Moose-Query-Extensions' }
FAMIXNamedEntity class >> resetMooseQueryCaches [
	super resetMooseQueryCaches.
	self resetTEntityMetaLevelDependencyCaches.
]

{ #category : #'Famix-Extensions' }
FAMIXNamedEntity >> accept: aVisitor [

	aVisitor visitNamedEntity: self
]

{ #category : #accessing }
FAMIXNamedEntity >> belongsTo [
	
	^self subclassResponsibility
]

{ #category : #accessing }
FAMIXNamedEntity >> belongsTo: anObject [

	^self subclassResponsibility

]

{ #category : #'Famix-Extensions' }
FAMIXNamedEntity >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self name: anEntity name copy.
	self isStub: anEntity isStub.
	self modifiers: (anEntity modifiers collect: #copy)

]

{ #category : #'moosechef-scoping-filtering' }
FAMIXNamedEntity >> methodScope [
	"Empty default scope"
	^ nil
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXNamedEntity >> namespaceScope [
	"Empty default scope"
	^ nil
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXNamedEntity >> packageScope [
	"Empty default scope"
	^ nil
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXNamedEntity >> selectWithinYourScope: aMooseQueryResult [
	self subclassResponsibility
]

{ #category : #'Famix-Extensions' }
FAMIXNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXNamedEntity >> typeScope [
	"Empty default scope"
	^ nil
]

{ #category : #'moosechef-scoping-filtering' }
FAMIXNamedEntity >> yourScope [
	"Empty default scope"

	self
		deprecated:
			'#yourScope was used by MooseChef for queries. Now, MooseQuery does not need it anymore. Example of code update: "myEntity queryAllIncoming perform: mySecondEntity yourScope" => "myEntity queryAllIncoming withScope: mySecondEntity class"'
		on: '12 january 2018'
		in: 'Moose6.1'.
	^ nil
]
