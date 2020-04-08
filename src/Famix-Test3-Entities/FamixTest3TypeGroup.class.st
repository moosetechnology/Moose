Class {
	#name : #FamixTest3TypeGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3TypeGroup class >> annotation [

	<FMClass: #TypeGroup super: #MooseGroup>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest3TypeGroup class >> metamodel [

	<generated>
	^ FamixTest3Model metamodel
]

{ #category : #testing }
FamixTest3TypeGroup >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3TypeGroup >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3TypeGroup >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3TypeGroup >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3TypeGroup >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3TypeGroup >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3TypeGroup >> isType [

	<generated>
	^ false
]
