Class {
	#name : #FamixStInheritance,
	#superclass : #FamixStAssociation,
	#traits : 'FamixTInheritanceGlue + FamixTSubInheritance + FamixTSuperInheritance',
	#classTraits : 'FamixTInheritanceGlue classTrait + FamixTSubInheritance classTrait + FamixTSuperInheritance classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStInheritance class >> annotation [

	<MSEClass: #Inheritance super: #FamixStAssociation>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]
