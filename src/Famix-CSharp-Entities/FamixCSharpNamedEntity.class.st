Class {
	#name : #FamixCSharpNamedEntity,
	#superclass : #FamixCSharpSourcedEntity,
	#traits : 'FamixTInvocationsReceiver + FamixTNamed + FamixTPackageable + FamixTPossibleStub + FamixTWithAnnotationInstances + FamixTWithModifiers + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTInvocationsReceiver classTrait + FamixTNamed classTrait + FamixTPackageable classTrait + FamixTPossibleStub classTrait + FamixTWithAnnotationInstances classTrait + FamixTWithModifiers classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FamixCSharpSourcedEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpNamedEntity class >> requirements [

	<generated>
	^ { FamixCSharpPackage }
]

{ #category : #accessing }
FamixCSharpNamedEntity >> belongsTo [

	<generated>
	^ self parentPackage

]

{ #category : #accessing }
FamixCSharpNamedEntity >> belongsTo: anObject [

	<generated>
	self parentPackage: anObject

]
