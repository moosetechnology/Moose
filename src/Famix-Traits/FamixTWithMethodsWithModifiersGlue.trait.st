Trait {
	#name : #FamixTWithMethodsWithModifiersGlue,
	#category : #'Famix-Traits-Traits'
}

{ #category : #meta }
FamixTWithMethodsWithModifiersGlue classSide >> annotation [

	<MSEClass: #TWithMethodsWithModifiersGlue super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #metrics }
FamixTWithMethodsWithModifiersGlue >> numberOfAbstractMethods [
	<MSEProperty: #numberOfAbstractMethods type: #Number>
	<derived>
	<MSEComment: 'The number of abstract methods in the class'>
	
	^self
		lookUpPropertyNamed: #numberOfAbstractMethods
		computedAs: [self methodsGroup count: [:each | each isAbstract]]
]

{ #category : #metrics }
FamixTWithMethodsWithModifiersGlue >> numberOfAbstractMethods: aNumber [

	self privateState propertyAt: #numberOfAbstractMethods put: aNumber
]

{ #category : #metrics }
FamixTWithMethodsWithModifiersGlue >> numberOfPrivateMethods [
	<MSEProperty: #numberOfPrivateMethods type: #Number>
	<derived>
	<MSEComment: 'The number of private methods in a class'>
			
	^self
		lookUpPropertyNamed: #numberOfPrivateMethods
		computedAs: [(self methods select: [:each | each isPrivate]) size]
]

{ #category : #metrics }
FamixTWithMethodsWithModifiersGlue >> numberOfPrivateMethods: aNumber [

	self privateState propertyAt: #numberOfPrivateMethods put: aNumber
]

{ #category : #metrics }
FamixTWithMethodsWithModifiersGlue >> numberOfProtectedMethods [
	<MSEProperty: #numberOfProtectedMethods type: #Number>
	<derived>
	<MSEComment: 'The number of protected methods in a class'>		
	
	^self
		lookUpPropertyNamed: #numberOfProtectedMethods
		computedAs: [(self methods select: [:each | each isProtected]) size]
]

{ #category : #metrics }
FamixTWithMethodsWithModifiersGlue >> numberOfProtectedMethods: aNumber [

	self privateState propertyAt: #numberOfProtectedMethods put: aNumber
]

{ #category : #metrics }
FamixTWithMethodsWithModifiersGlue >> numberOfPublicMethods [
	<MSEProperty: #numberOfPublicMethods type: #Number>
	<derived>
	<MSEComment: 'The number of public methods in a class'>		
		
	^self
		lookUpPropertyNamed: #numberOfPublicMethods
		computedAs: [(self methods select: [:each | each isPublic]) size]
]

{ #category : #metrics }
FamixTWithMethodsWithModifiersGlue >> numberOfPublicMethods: aNumber [

	self privateState propertyAt: #numberOfPublicMethods put: aNumber
]
