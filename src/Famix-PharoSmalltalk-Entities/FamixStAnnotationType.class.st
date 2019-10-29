Class {
	#name : #FamixStAnnotationType,
	#superclass : #FamixStContainerEntity,
	#traits : 'FamixTAnnotationType + FamixTWithAttributes',
	#classTraits : 'FamixTAnnotationType classTrait + FamixTWithAttributes classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStAnnotationType class >> annotation [

	<FMClass: #AnnotationType super: #FamixStContainerEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #meta }
FamixStAnnotationType class >> requirements [

	<generated>
	^ { FamixStContainerEntity }
]

{ #category : #compatibility }
FamixStAnnotationType >> directSubclasses [
	^ OrderedCollection new
]

{ #category : #compatibility }
FamixStAnnotationType >> hierarchyNestingLevel [ 

	^ 1
]

{ #category : #'Famix-Extensions' }
FamixStAnnotationType >> numberOfAttributes [
	<FMProperty: #numberOfAttributes type: #Number>
	<derived>
	<FMComment: 'The number of attributes in the class'>
	
	^self
		lookUpPropertyNamed: #numberOfAttributes
		computedAs: [self attributes size]
]

{ #category : #metrics }
FamixStAnnotationType >> numberOfPrivateAttributes [
	<FMProperty: #numberOfPrivateAttributes type: #Number>
	<derived>
	<FMComment: 'The number of private attributes in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfPrivateAttributes
		computedAs: [(self attributes select: [:each | each isPrivate]) size]
]

{ #category : #metrics }
FamixStAnnotationType >> numberOfProtectedAttributes [
	<FMProperty: #numberOfProtectedAttributes type: #Number>
	<derived>
	<FMComment: 'The number of protected attributes in a class'>				
	
	^self
		lookUpPropertyNamed: #numberOfProtectedAttributes
		computedAs: [(self attributes select: [:each | each isProtected]) size]
]

{ #category : #metrics }
FamixStAnnotationType >> numberOfPublicAttributes [
	<FMProperty: #numberOfPublicAttributes type: #Number>
	<derived>
	<FMComment: 'The number of public attributes in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfPublicAttributes
		computedAs: [(self attributes select: [:each | each isPublic]) size]
]

{ #category : #metrics }
FamixStAnnotationType >> numberOfRevealedAttributes [
	<FMProperty: #numberOfRevealedAttributes type: #Number>
	<derived>
	<FMComment: 'The number of public attributes plus the number of accessor methods'>		

	^self
		lookUpPropertyNamed: #numberOfRevealedAttributes
		computedAs:
			[self numberOfPublicAttributes + self numberOfAccessorMethods]
]
