Class {
	#name : #FamixCSharpProperty,
	#superclass : #FamixCSharpLocalVariable,
	#instVars : [
		'#getter => FMProperty',
		'#setter => FMProperty'
	],
	#category : #'Famix-CSharp-Entities-Entities'
}

{ #category : #meta }
FamixCSharpProperty class >> annotation [

	<MSEClass: #Property super: #FamixCSharpLocalVariable>
	<package: #'Famix-CSharp-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixCSharpProperty >> getter [

	<MSEProperty: #getter type: #FamixCSharpPropertyAccessor>
	<generated>
	<MSEComment: 'Getter of a property'>
	^ getter
]

{ #category : #accessing }
FamixCSharpProperty >> getter: anObject [

	<generated>
	getter := anObject

]

{ #category : #accessing }
FamixCSharpProperty >> setter [

	<MSEProperty: #setter type: #FamixCSharpPropertyAccessor>
	<generated>
	<MSEComment: 'Setter of a property'>
	^ setter
]

{ #category : #accessing }
FamixCSharpProperty >> setter: anObject [

	<generated>
	setter := anObject

]
