Class {
	#name : #FamixJavaNamedEntity,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTNamed + FamixTPackageable + FamixTPossibleStub + FamixTWithAnnotationInstances + FamixTWithModifiers + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTNamed classTrait + FamixTPackageable classTrait + FamixTPossibleStub classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithModifiers classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixJavaNamedEntity class >> generatedSlotNames [
	<generated>
	'FamixJavaNamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixJavaNamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTInvocationsReceiver FamixTNamed FamixTPackageable FamixTPossibleStub FamixTWithAnnotationInstances FamixTWithModifiers TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixJavaNamedEntity class >> requirements [

	<generated>
	^ { FamixJavaPackage }
]

{ #category : #'Moose-Query' }
FamixJavaNamedEntity class >> resetMooseQueryCaches [
	super resetMooseQueryCaches.
	self resetTEntityMetaLevelDependencyCaches.

]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> accept: aVisitor [

	aVisitor visitNamedEntity: self
]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> belongsTo [
	
	^self subclassResponsibility
]

{ #category : #accessing }
FamixJavaNamedEntity >> belongsTo: anObject [

	^self subclassResponsibility

]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> copyFrom: anEntity within: aVisitor [

	super copyFrom: anEntity within: aVisitor.
	self name: anEntity name copy.
	self isStub: anEntity isStub.
	self modifiers: (anEntity modifiers collect: #copy)

]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> methodScope [
	"Empty default scope"
	^ nil
]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> namespaceScope [
	"Empty default scope"
	^ nil
]

{ #category : #accessing }
FamixJavaNamedEntity >> packageScope [
	"Empty default scope"
	^ nil
]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> selectWithinYourScope: aMooseQueryResult [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> typeScope [
	"Empty default scope"
	^ nil
]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> yourScope [
	"Empty default scope"

	self
		deprecated:
			'#yourScope was used by MooseChef for queries. Now, MooseQuery does not need it anymore. Example of code update: "myEntity queryAllIncoming perform: mySecondEntity yourScope" => "myEntity queryAllIncoming withScope: mySecondEntity class"'
		on: '12 january 2018'
		in: 'Moose6.1'.
	^ nil
]
