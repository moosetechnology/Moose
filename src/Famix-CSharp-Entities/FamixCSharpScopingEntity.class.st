Class {
	#name : #FamixCSharpScopingEntity,
	#superclass : #FamixCSharpContainerEntity,
	#traits : 'FamixTGlobalVariableScope + FamixTScopingEntity',
	#classTraits : 'FamixTGlobalVariableScope classTrait + FamixTScopingEntity classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpScopingEntity class >> annotation [

	<MSEClass: #ScopingEntity super: #FamixCSharpContainerEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpScopingEntity class >> requirements [

	<generated>
	^ { FamixCSharpScopingEntity }
]

{ #category : #accessing }
FamixCSharpScopingEntity >> belongsTo [

	<generated>
	^ self parentScope

]

{ #category : #accessing }
FamixCSharpScopingEntity >> belongsTo: anObject [

	<generated>
	self parentScope: anObject

]
