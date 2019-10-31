Class {
	#name : #FamixJavaNamedEntity,
	#superclass : #FamixJavaSourcedEntity,
	#traits : 'FamixTNamed + FamixTPackageable + FamixTWithAnnotationInstances + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + FamixTPackageable classTrait + FamixTWithAnnotationInstances classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
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
