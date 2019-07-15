Class {
	#name : #FamixStNamedEntity,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTNamed + FamixTPackageable + FamixTPossibleStub + FamixTWithAnnotationInstances + FamixTWithModifiers + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTNamed classTrait + FamixTPackageable classTrait + FamixTPossibleStub classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithModifiers classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #generator }
FamixStNamedEntity class >> generatedSlotNames [
	<generated>
	'FamixStNamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixStNamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTInvocationsReceiver FamixTNamed FamixTPackageable FamixTPossibleStub FamixTWithAnnotationInstances FamixTWithModifiers TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
FamixStNamedEntity class >> requirements [

	<generated>
	^ { FamixStPackage }
]

{ #category : #'as yet unclassified' }
FamixStNamedEntity class >> resetMooseQueryCaches [
	super resetMooseQueryCaches.
	self resetTEntityMetaLevelDependencyCaches.

]

{ #category : #accessing }
FamixStNamedEntity >> belongsTo [

	<generated>
	^ self parentPackage

]

{ #category : #accessing }
FamixStNamedEntity >> belongsTo: anObject [

	<generated>
	self parentPackage: anObject

]

{ #category : #accessing }
FamixStNamedEntity >> packageScope [
	"Empty default scope"
	^ nil
]

{ #category : #'Famix-Extensions' }
FamixStNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]
