Class {
	#name : #FamixStNamedEntity,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTNamed + FamixTPackageable + FamixTWithAnnotationInstances + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + FamixTPackageable classTrait + FamixTWithAnnotationInstances classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
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
