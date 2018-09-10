Trait {
	#name : #FamixTWithAttributes,
	#instVars : [
		'#attributes => FMMany type: #FamixTAttribute opposite: #parentType'
	],
	#category : #'Famix-Traits-Attribute'
}

{ #category : #meta }
FamixTWithAttributes classSide >> annotation [

	<MSEClass: #TWithAttributes super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTWithAttributes classSide >> generatedSlotNames [
	<generated>
	'FamixTWithAttributes class>>#generatedSlotNames'.
	^ #(attributes)
]

{ #category : #generator }
FamixTWithAttributes classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #adding }
FamixTWithAttributes >> addAttribute: anAttribute [
	attributes add: anAttribute
]

{ #category : #accessing }
FamixTWithAttributes >> attributes [

	<generated>
	<MSEComment: 'List of attributes declared by this type.'>
	^ attributes
]

{ #category : #accessing }
FamixTWithAttributes >> attributes: anObject [

	<generated>
	attributes value: anObject

]

{ #category : #'Famix-Extensions' }
FamixTWithAttributes >> numberOfAttributes [
	<MSEProperty: #numberOfAttributes type: #Number>
	<derived>
	<MSEComment: 'The number of attributes in the class'>
	
	^self
		lookUpPropertyNamed: #numberOfAttributes
		computedAs: [self attributes size]
]

{ #category : #'Famix-Extensions' }
FamixTWithAttributes >> numberOfAttributes: aNumber [

	self privateState propertyAt: #numberOfAttributes put: aNumber
]

{ #category : #metrics }
FamixTWithAttributes >> numberOfPrivateAttributes [
	<MSEProperty: #numberOfPrivateAttributes type: #Number>
	<derived>
	<MSEComment: 'The number of private attributes in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfPrivateAttributes
		computedAs: [(self attributes select: [:each | each isPrivate]) size]
]

{ #category : #metrics }
FamixTWithAttributes >> numberOfPrivateAttributes: aNumber [

	self privateState propertyAt: #numberOfPrivateAttributes put: aNumber
]

{ #category : #metrics }
FamixTWithAttributes >> numberOfProtectedAttributes [
	<MSEProperty: #numberOfProtectedAttributes type: #Number>
	<derived>
	<MSEComment: 'The number of protected attributes in a class'>				
	
	^self
		lookUpPropertyNamed: #numberOfProtectedAttributes
		computedAs: [(self attributes select: [:each | each isProtected]) size]
]

{ #category : #metrics }
FamixTWithAttributes >> numberOfProtectedAttributes: aNumber [

	self privateState propertyAt: #numberOfProtectedAttributes put: aNumber
]

{ #category : #metrics }
FamixTWithAttributes >> numberOfPublicAttributes [
	<MSEProperty: #numberOfPublicAttributes type: #Number>
	<derived>
	<MSEComment: 'The number of public attributes in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfPublicAttributes
		computedAs: [(self attributes select: [:each | each isPublic]) size]
]

{ #category : #metrics }
FamixTWithAttributes >> numberOfPublicAttributes: aNumber [

	self privateState propertyAt: #numberOfPublicAttributes put: aNumber
]

{ #category : #metrics }
FamixTWithAttributes >> numberOfRevealedAttributes [
	<MSEProperty: #numberOfRevealedAttributes type: #Number>
	<derived>
	<MSEComment: 'The number of public attributes plus the number of accessor methods'>		

	^self
		lookUpPropertyNamed: #numberOfRevealedAttributes
		computedAs:
			[self numberOfPublicAttributes + self numberOfAccessorMethods]
]

{ #category : #metrics }
FamixTWithAttributes >> numberOfRevealedAttributes: aNumber [

	self privateState propertyAt: #numberOfRevealedAttributes put: aNumber
]
