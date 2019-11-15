Class {
	#name : #FamixJavaNamedEntity,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTNamed + FamixTPackageable + FamixTWithAnnotationInstances + FamixTWithModifiers + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTNamed classTrait + FamixTPackageable classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithModifiers classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixJavaSourcedEntity>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
FamixJavaNamedEntity >> stubFormattedName [
	 ^ self isStub 
		ifTrue: [ Text 
					string: self name
					attribute: TextEmphasis italic ]
		ifFalse: [ Text fromString: self name ] 
]
