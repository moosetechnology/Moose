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

{ #category : #meta }
FamixStNamedEntity class >> requirements [

	<generated>
	^ { FamixStPackage }
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

{ #category : #'Famix-Extensions' }
FamixStNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]
