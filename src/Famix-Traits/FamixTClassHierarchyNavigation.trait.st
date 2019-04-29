Trait {
	#name : #FamixTClassHierarchyNavigation,
	#category : #'Famix-Traits-Support'
}

{ #category : #meta }
FamixTClassHierarchyNavigation classSide >> annotation [

	<MSEClass: #TClassHierarchyNavigation super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTClassHierarchyNavigation classSide >> generatedSlotNames [
	<generated>
	'FamixTClassHierarchyNavigation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FamixTClassHierarchyNavigation classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> addedMethods [
	| inheritedMethodNames |
	inheritedMethodNames := self inheritedMethods
		collect: [:each | each signature].
	^self methods
		reject: [:each | inheritedMethodNames includes: each signature]
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> allSubclassesDo: aBlock [
	self allSubclassesWithoutAliasesDo: aBlock.
	self typeAliases do: [ :each | each allSubclassesWithoutAliasesDo: aBlock ]
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> allSubclassesWithoutAliasesDo: aBlock [
	self subInheritances do: [ :each | aBlock value: each subclass ].
	self subInheritances do: [ :each | each subclass allSubclassesDo: aBlock ]
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> allSuperclassesDo: aBlock [
	self allSuperclassesWithoutAliasesDo: aBlock.

]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> allSuperclassesWithoutAliasesDo: aBlock [
	self superInheritances do: [:each | aBlock value: each superclass].
	self superInheritances do: [:each | each superclass allSuperclassesDo: aBlock]
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> anySuperclass [
	"Mircea: this used to return interfaces too. fixed now. 
	also added superclass that does the same thing"

	self
		allSuperclassesDo: [ :each | 
			each isInterface
				ifFalse: [ ^ each ] ].
	^ nil
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> directSubclasses [
	"returns a collection with all subclasses of this class"

	^ self subInheritances collect: [:each | each subclass]
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> directSuperclasses [
	"returns a collection with all superclasses of this class"

	^ self superInheritances collect: [:each | each superclass]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> hierarchyNestingLevel [
	<MSEProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<MSEComment: 'The nesting of a class inside the hierarchy'>

	^self
		lookUpPropertyNamed: #hierarchyNestingLevel
		computedAs:
			[| currentMaxDepth |
			(self directSuperclasses isEmpty or: [self isStub])
				ifTrue: [0]
				ifFalse:
					[currentMaxDepth := 0.
					self
						allSuperclassesDo:
							[:aClass | currentMaxDepth := currentMaxDepth max: aClass hierarchyNestingLevel].
					currentMaxDepth + 1]]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> hierarchyNestingLevel: aNumber [

	self privateState propertyAt: #hierarchyNestingLevel put: aNumber
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> inheritedAttributes [
	| inheritedAttrs |
	inheritedAttrs := OrderedCollection new.
	self allSuperclassesDo: [:each | 
			each attributes do: [:attr | 
				attr isPrivate not ifTrue: [inheritedAttrs add: attr]]].
	^ inheritedAttrs
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> inheritedMethods [
	| inheritedMethods |
	inheritedMethods := OrderedCollection new.
	self allSuperclassesDo: [:each | 
			each methods do: [:method | 
				method isPrivate not ifTrue: [inheritedMethods add: method]]].
	^inheritedMethods
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> inheritedSignatures [
	| inheritedSignatures |
	inheritedSignatures := Set new.
	self superclassHierarchy do: [:each | 
			each methods do: [:method | 
				method isPrivate not ifTrue: [inheritedSignatures add: method signature]]].
	^ inheritedSignatures
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> inheritedSignaturesToMethod [
	| inheritedSignaturesToMethod |
	inheritedSignaturesToMethod := Dictionary new.
	self allSuperclassesDo: [:each | 
			each methods do: [:method | 
				method isPrivate ifFalse: [
					inheritedSignaturesToMethod at: method signature ifAbsentPut: [method]]]].
	^ inheritedSignaturesToMethod
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> inheritsFrom: aClass [
	self allSuperclassesDo: [:each | each = aClass ifTrue: [^true]].
	^ false
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> isHierarchyRoot [
	^self superclassHierarchyGroup 
		allSatisfy: [:each | each isNil or: [each isStub] ]
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> isHierarchyRootWithin: aClassGroup [
	^(self superclassHierarchyGroup intersection: aClassGroup) isEmpty
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfAttributesInherited [
	<MSEProperty: #numberOfAttributesInherited type: #Number>
	<derived>
	<MSEComment: 'The number of attributes in a class inherited from super classes'>	
	
	^self
		lookUpPropertyNamed: #numberOfAttributesInherited
		computedAs: [self inheritedAttributes size]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfAttributesInherited: aNumber [

	self privateState propertyAt: #numberOfAttributesInherited put: aNumber
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfDirectSubclasses [
	<MSEProperty: #numberOfDirectSubclasses type: #Number>
	<MSEComment: 'The number of direct subclasses'>
	<derived>

	^ self privateState propertyAt: #numberOfDirectSubclasses ifAbsentPut: [self directSubclasses size]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfDirectSubclasses: aNumber [

	self privateState propertyAt: #numberOfDirectSubclasses put: aNumber
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsAdded [
	<MSEProperty: #numberOfMethodsAdded type: #Number>
	<derived>
	<MSEComment: 'The number of methods in a class added with respect to super classes'>	
	
	^self
		lookUpPropertyNamed: #numberOfMethodsAdded
		computedAs: [self addedMethods size]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsAdded: aNumber [

	self privateState propertyAt: #numberOfMethodsAdded put: aNumber
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsInHierarchy [
	<MSEProperty: #numberOfMethodsInHierarchy type: #Number>
	<derived>
	<MSEComment: 'The number of methods of a class included the inherited ones'>	
	
	| totNom |
	totNom := self methods size.
	self superclassHierarchyGroup
		do: [:aClass | totNom := totNom + aClass methods size].
	^totNom
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsInHierarchy: aNumber [

	self privateState propertyAt: #numberOfMethodsInHierarchy put: aNumber
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsInherited [
	<MSEProperty: #numberOfMethodsInherited type: #Number>
	<derived>
	<MSEComment: 'The number of methods in a class inherited from super classes'>	

	^self
		lookUpPropertyNamed: #numberOfMethodsInherited
		computedAs: [self inheritedMethods size]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsInherited: aNumber [

	self privateState propertyAt: #numberOfMethodsInherited put: aNumber
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsOverriden [
	<MSEProperty: #numberOfMethodsOverriden type: #Number>
	<derived>
	<MSEComment: 'The number of methods in a class overriden with respect to super classes'>
			
	^self
		lookUpPropertyNamed: #numberOfMethodsOverriden
		computedAs: [self numberOfMethods - self numberOfMethodsAdded]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfMethodsOverriden: aNumber [

	self privateState propertyAt: #numberOfMethodsOverriden put: aNumber
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfParents [
	<MSEProperty: #numberOfParents type: #Number>
	<derived>
	<MSEComment: 'The number of superclasses'>
			
	^self
		lookUpPropertyNamed: #numberOfParents
		computedAs: [self directSuperclasses size]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> numberOfParents: aNumber [

	self privateState propertyAt: #numberOfParents put: aNumber
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> subclassHierarchy [
	| subclasses |
	subclasses := OrderedCollection new.
	self allSubclassesDo: [:each | subclasses add: each].
	^ subclasses
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> subclassHierarchyDepth [ 
	<MSEProperty: #subclassHierarchyDepth type: #Number>
	<derived>
	<MSEComment: 'The depth of the class hierarchy for which I am the root'>
		
	^ self directSubclasses isEmpty 
		ifTrue: [ 0 ] 
		ifFalse: 
			[ | currentMaxDepth| 
				currentMaxDepth := 0. 
				self allSubclassesDo: 
					[ :aClass | currentMaxDepth := currentMaxDepth max: aClass subclassHierarchyDepth ]. 
            1 + currentMaxDepth ] 
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> subclassHierarchyDepth: aNumber [

	self privateState propertyAt: #subclassHierarchyDepth put: aNumber
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> subclassHierarchyGroup [
	<navigation: 'All subclasses'>
	^ MooseGroup
		withAll: self subclassHierarchy asSet
		withDescription: 'All subclasses of ' , self mooseName
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> superclass [
	^self anySuperclass
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> superclassHierarchy [
	| superclasses |
	superclasses := OrderedCollection new.
	self allSuperclassesDo: [:each |  superclasses add: each].
	^ superclasses
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> superclassHierarchyGroup [
	<navigation: 'All superclasses'>
	^ MooseGroup
		withAll: self superclassHierarchy asSet
		withDescription: 'All superclasses of ' , self mooseName
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> totalNumberOfChildren [
	<MSEProperty: #totalNumberOfChildren type: #Number>
	<derived>	
	<MSEComment: 'The total number of subclasses of a class'>
	
	^self
		lookUpPropertyNamed: #totalNumberOfChildren
		computedAs: [self subclassHierarchyGroup size]
]

{ #category : #metrics }
FamixTClassHierarchyNavigation >> totalNumberOfChildren: aNumber [

	self privateState propertyAt: #totalNumberOfChildren put: aNumber
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> withSubclassHierarchy [
	^ self subclassHierarchy 
		addFirst: self realType;
		addAll: self realType allTypeAliases;
		yourself
]

{ #category : #'Famix-Implementation' }
FamixTClassHierarchyNavigation >> withSubclassHierarchyGroup [
	<navigation: 'With all subclasses'>
	^ MooseGroup
		withAll: (self subclassHierarchy asSet; addFirst: self; yourself)
		withDescription: 'With all subclasses of ' , self mooseName
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> withSubclassesDo: aBlock [
	aBlock value: self.
	self allSubclassesDo: aBlock
]

{ #category : #'Famix-Implementation' }
FamixTClassHierarchyNavigation >> withSuperclassHierarchy [
	^ self realType superclassHierarchy 
		addFirst: self realType; 
		addAll: self realType allTypeAliases;
		yourself
]

{ #category : #enumerating }
FamixTClassHierarchyNavigation >> withSuperclassesDo: aBlock [
	aBlock value: self.
	self allSuperclassesDo: aBlock
]
