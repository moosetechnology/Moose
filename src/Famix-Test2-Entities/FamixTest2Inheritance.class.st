Class {
	#name : #FamixTest2Inheritance,
	#superclass : #FamixTest2Association,
	#traits : 'FamixTInheritance',
	#classTraits : 'FamixTInheritance classTrait',
	#category : #'Famix-Test2-Entities-Entities'
}

{ #category : #meta }
FamixTest2Inheritance class >> annotation [

	<FMClass: #Inheritance super: #FamixTest2Association>
	<package: #'Famix-Test2-Entities'>
	<generated>
	^self
]
