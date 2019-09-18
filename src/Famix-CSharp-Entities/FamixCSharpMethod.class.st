Class {
	#name : #FamixCSharpMethod,
	#superclass : #FamixCSharpContainerEntity,
	#traits : 'FamixTMethod + FamixTWithCaughtExceptions + FamixTWithDeclaredExceptions + FamixTWithStatements + FamixTWithThrownExceptions',
	#classTraits : 'FamixTMethod classTrait + FamixTWithCaughtExceptions classTrait + FamixTWithDeclaredExceptions classTrait + FamixTWithStatements classTrait + FamixTWithThrownExceptions classTrait',
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpMethod class >> annotation [

	<MSEClass: #Method super: #FamixCSharpContainerEntity>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixCSharpMethod class >> requirements [

	<generated>
	^ { FamixCSharpEvent }
]

{ #category : #accessing }
FamixCSharpMethod >> belongsTo [

	<generated>
	^ self parentType

]

{ #category : #accessing }
FamixCSharpMethod >> belongsTo: anObject [

	<generated>
	self parentType: anObject

]
