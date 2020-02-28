Class {
	#name : #FamixStNamedEntity,
	#superclass : #FamixStSourcedEntity,
	#traits : 'FamixTHasModifiers + FamixTInvocationsReceiver + FamixTNamedEntity + FamixTPackageable + FamixTWithAnnotationInstances + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTHasModifiers classTrait + FamixTInvocationsReceiver classTrait + FamixTNamedEntity classTrait + FamixTPackageable classTrait + FamixTWithAnnotationInstances classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixStSourcedEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions' }
FamixStNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]
