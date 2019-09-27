Class {
	#name : #FamixCSharpGlobalVariable,
	#superclass : #FamixCSharpNamedEntity,
	#traits : 'FamixCSharpTStructuralEntity + FamixTGlobalVariable',
	#classTraits : 'FamixCSharpTStructuralEntity classTrait + FamixTGlobalVariable classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpGlobalVariable class >> annotation [

	<MSEClass: #GlobalVariable super: #FamixCSharpNamedEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpGlobalVariable class >> requirements [

	<generated>
	^ { FamixCSharpScopingEntity }
]

{ #category : #accessing }
FamixCSharpGlobalVariable >> belongsTo [

	<generated>
	^ self parentScope

]

{ #category : #accessing }
FamixCSharpGlobalVariable >> belongsTo: anObject [

	<generated>
	self parentScope: anObject

]
