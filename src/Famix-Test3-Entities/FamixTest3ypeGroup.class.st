Class {
	#name : #FamixTest3ypeGroup,
	#superclass : #MooseGroup,
	#category : #'Famix-Test3-Entities-Entities'
}

{ #category : #meta }
FamixTest3ypeGroup class >> annotation [

	<FMClass: #ypeGroup super: #MooseGroup>
	<package: #'Famix-Test3-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixTest3ypeGroup class >> metamodel [

	<generated>
	^ FamixTest3Model metamodel
]

{ #category : #testing }
FamixTest3ypeGroup >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3ypeGroup >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3ypeGroup >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3ypeGroup >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3ypeGroup >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
FamixTest3ypeGroup >> isType [

	<generated>
	^ false
]
