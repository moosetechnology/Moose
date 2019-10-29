Class {
	#name : #FamixStClass,
	#superclass : #FamixStContainerEntity,
	#traits : 'FamixTClass + FamixTClassHierarchyNavigation + FamixTWithExceptions',
	#classTraits : 'FamixTClass classTrait + FamixTClassHierarchyNavigation classTrait + FamixTWithExceptions classTrait',
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStClass class >> annotation [

	<FMClass: #Class super: #FamixStContainerEntity>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixStClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
]

{ #category : #accessing }
FamixStClass >> classSide [
	^ self isClassSide
		ifFalse: [ self mooseModel allClasses entityNamed: (self mooseName , '_class') asSymbol ]
		ifTrue: [ self ]
]

{ #category : #accessing }
FamixStClass >> extendedInPackages [
	^ self extendedMethods flatCollectAsSet: [ :m | m atScope: FamixTPackage ]
]

{ #category : #accessing }
FamixStClass >> extendedMethods [
	<FMProperty: #extendedMethods type: #FamixStMethod>
	<FMComment: 'Methods which are class extensions in this class.'>
	<derived>
	^ self methods select: #isExtension
]

{ #category : #metrics }
FamixStClass >> fanIn [
	<FMProperty: #fanIn type: #Number>
	<derived>
	<FMComment: 'Number of client classes'>
	^ self lookUpPropertyNamed: #fanIn computedAs: [ (self allClientsAtScope: FamixTType) size ]
]

{ #category : #metrics }
FamixStClass >> hierarchyNestingLevel [
	<FMProperty: #hierarchyNestingLevel type: #Number>
	<derived>
	<FMComment: 'The nesting of a class inside the hierarchy'>

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

{ #category : #testing }
FamixStClass >> implements: aString [
	"Was changed from match: for performances and because signature is case sensitive"

	^ self methods anySatisfy: [ :each | aString = each signature ]
]

{ #category : #accessing }
FamixStClass >> instanceSide [
	^ self isClassSide
		ifTrue: [ self mooseModel allClasses entityNamed: (self mooseName removeSuffix: '_class') asSymbol ]
		ifFalse: [ self ]
]

{ #category : #testing }
FamixStClass >> isAnonymousClass [
	self flag: #todo.	"We need to check how to do that in Pharo smalltalk because I think some of the conditions are for Java"
	^ self typeContainer notNil and: [ self typeContainer isMethod or: [ self name isAllDigits or: [ '*_anonymous_*' match: self name ] ] ]
]

{ #category : #testing }
FamixStClass >> isClassSide [
	"Kind of a hack. Uses the FAMIX2 Smalltalk naming convention that every Smalltalk
	 metaclass has _class appended to the classname of the class it is a metaclass of."

	^ '*_class' match: self name
]

{ #category : #testing }
FamixStClass >> isExtended [
	^ self methods anySatisfy: #isExtension
]

{ #category : #testing }
FamixStClass >> isInstanceSide [
	^ self isClassSide not
]

{ #category : #testing }
FamixStClass >> isLonelyWithin: aClassGroup [
	^ (self subclassHierarchyGroup intersection: aClassGroup) isEmpty and: [ (self superclassHierarchyGroup intersection: aClassGroup) isEmpty ]
]

{ #category : #testing }
FamixStClass >> isTestCase [
	<FMProperty: #isTestCase type: #Boolean>
	<derived>
	<FMComment: 'True if the method is considered as a Java test'>
	self allSuperclassesDo: [ :each | each name = 'TestCase' ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #accessing }
FamixStClass >> localMethods [
	<FMProperty: #extendedMethods type: #FamixStMethod>
	<FMComment: 'Methods which are local methods of the class and not extensions in this class.'>
	<derived>
	^ self methods reject: #isExtension
]

{ #category : #accessing }
FamixStClass >> lookUp: signature [
	self withSuperclassesDo: [ :class | class methods detect: [ :method | method signature = signature ] ifFound: [ :found | ^ found ] ].
	^ nil
]

{ #category : #'Famix-Implementation' }
FamixStClass >> methodsWithoutSutbsAndConstructors [
	"Removing stub and contructor methods. Used to support the calculation of LCOM."

	^ (self methods select: [ :each | each isStub not and: [ each isConstructor not ] ]) asSet
]

{ #category : #metrics }
FamixStClass >> numberOfAbstractMethods [
	<FMProperty: #numberOfAbstractMethods type: #Number>
	<derived>
	<FMComment: 'The number of abstract methods in the class'>
	^ self lookUpPropertyNamed: #numberOfAbstractMethods computedAs: [ self methodsGroup count: [ :each | each isAbstract ] ]
]

{ #category : #metrics }
FamixStClass >> numberOfAccessesToForeignData [
	<FMProperty: #numberOfAccessesToForeignData type: #Number>
	<derived>
	<FMComment: 'Number of accesses to foreign data'>
	
	^self
		lookUpPropertyNamed: #numberOfAccessesToForeignData
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FamixStClass >> numberOfAccessorMethods [
	<FMProperty: #numberOfAccessorMethods type: #Number>
	<derived>
	<FMComment: 'The number of accessor methods in a class'>
	^ self
		lookUpPropertyNamed: #numberOfAccessorMethods
		computedAs: [ 
			| noa |
			noa := 0.
			self methods
				do: [ :method | 
					method isPureAccessor
						ifNotNil: [ 
							(method isPureAccessor or: [ (method propertyNamed: #AccessorMethod) isNil not ])
								ifTrue: [ noa := noa + 1 ] ] ].
			noa ]
]

{ #category : #'Famix-Extensions' }
FamixStClass >> numberOfAttributes [
	<FMProperty: #numberOfAttributes type: #Number>
	<derived>
	<FMComment: 'The number of attributes in the class'>
	
	^self
		lookUpPropertyNamed: #numberOfAttributes
		computedAs: [self attributes size]
]

{ #category : #metrics }
FamixStClass >> numberOfAttributesInherited [
	<FMProperty: #numberOfAttributesInherited type: #Number>
	<derived>
	<FMComment: 'The number of attributes in a class inherited from super classes'>	
	
	^self
		lookUpPropertyNamed: #numberOfAttributesInherited
		computedAs: [self inheritedAttributes size]
]

{ #category : #accessing }
FamixStClass >> numberOfComments [
	<FMProperty: #numberOfComments type: #Number>
	<derived>
	<FMComment: 'The number of comments in a class'>
	self flag: #todo.	"Cyril: I am not a big fan of this implementation... We should revisit it."
	^ self lookUpPropertyNamed: #numberOfComments computedAs: [ self comments size + (self methods asArray inject: 0 into: [ :sum :el | el numberOfComments + sum ]) ]
]

{ #category : #metrics }
FamixStClass >> numberOfConstructorMethods [
	<FMProperty: #numberOfConstructorMethods type: #Number>
	<derived>
	<FMComment: 'The number of constructor methods in a class'>
	^ self
		lookUpPropertyNamed: #numberOfConstructorMethods
		computedAs: [ 
			| nc |
			nc := 0.
			self methods
				do: [ :method | 
					method isConstructor
						ifNotNil: [ 
							method isConstructor
								ifTrue: [ nc := 1 ] ] ].
			nc ]
]

{ #category : #metrics }
FamixStClass >> numberOfDirectSubclasses [
	<FMProperty: #numberOfDirectSubclasses type: #Number>
	<FMComment: 'The number of direct subclasses'>
	<derived>

	^ self privateState propertyAt: #numberOfDirectSubclasses ifAbsentPut: [self directSubclasses size]
]

{ #category : #metrics }
FamixStClass >> numberOfDuplicatedLinesOfCodeInternally [
	<FMProperty: #numberOfDuplicatedLinesOfCodeInternally type: #Number>
	<derived>
	<FMComment: 'The number of duplicated lines of code internally'>		

	^self
		lookUpPropertyNamed: #numberOfDuplicatedLinesOfCodeInternally
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FamixStClass >> numberOfLinesOfCode [

	<FMProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<FMComment: 'The number of lines of code in a class'>

	^self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [self methodsGroup sumNumbers: #numberOfLinesOfCode]
]

{ #category : #metrics }
FamixStClass >> numberOfMessageSends [
	<FMProperty: #numberOfMessageSends type: #Number>
	<derived>
	<FMComment: 'The number of message sends from a class'>
	
	^self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [self methodsGroup sumNumbers: #numberOfMessageSends]
]

{ #category : #metrics }
FamixStClass >> numberOfMethodProtocols [
	<FMProperty: #numberOfMethodProtocols type: #Number>
	<derived>
	<FMComment: 'The number of method protocols in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfMethodProtocols
		computedAs: [((self methods collect: [:each | each protocol]) reject: #isNil) asSet size]
]

{ #category : #accessing }
FamixStClass >> numberOfMethods [
	<FMProperty: #numberOfMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods in a class'>

	^self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [self methods size]
]

{ #category : #metrics }
FamixStClass >> numberOfMethodsAdded [
	<FMProperty: #numberOfMethodsAdded type: #Number>
	<derived>
	<FMComment: 'The number of methods in a class added with respect to super classes'>	
	
	^self
		lookUpPropertyNamed: #numberOfMethodsAdded
		computedAs: [self addedMethods size]
]

{ #category : #metrics }
FamixStClass >> numberOfMethodsInHierarchy [
	<FMProperty: #numberOfMethodsInHierarchy type: #Number>
	<derived>
	<FMComment: 'The number of methods of a class included the inherited ones'>	
	
	| totNom |
	totNom := self methods size.
	self superclassHierarchyGroup
		do: [:aClass | totNom := totNom + aClass methods size].
	^totNom
]

{ #category : #metrics }
FamixStClass >> numberOfMethodsInherited [
	<FMProperty: #numberOfMethodsInherited type: #Number>
	<derived>
	<FMComment: 'The number of methods in a class inherited from super classes'>	

	^self
		lookUpPropertyNamed: #numberOfMethodsInherited
		computedAs: [self inheritedMethods size]
]

{ #category : #metrics }
FamixStClass >> numberOfMethodsOverriden [
	<FMProperty: #numberOfMethodsOverriden type: #Number>
	<derived>
	<FMComment: 'The number of methods in a class overriden with respect to super classes'>
			
	^self
		lookUpPropertyNamed: #numberOfMethodsOverriden
		computedAs: [self numberOfMethods - self numberOfMethodsAdded]
]

{ #category : #metrics }
FamixStClass >> numberOfParents [
	<FMProperty: #numberOfParents type: #Number>
	<derived>
	<FMComment: 'The number of superclasses'>
			
	^self
		lookUpPropertyNamed: #numberOfParents
		computedAs: [self directSuperclasses size]
]

{ #category : #metrics }
FamixStClass >> numberOfPrivateAttributes [
	<FMProperty: #numberOfPrivateAttributes type: #Number>
	<derived>
	<FMComment: 'The number of private attributes in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfPrivateAttributes
		computedAs: [(self attributes select: [:each | each isPrivate]) size]
]

{ #category : #metrics }
FamixStClass >> numberOfPrivateMethods [
	<FMProperty: #numberOfPrivateMethods type: #Number>
	<derived>
	<FMComment: 'The number of private methods in a class'>
			
	^self
		lookUpPropertyNamed: #numberOfPrivateMethods
		computedAs: [(self methods select: [:each | each isPrivate]) size]
]

{ #category : #metrics }
FamixStClass >> numberOfProtectedAttributes [
	<FMProperty: #numberOfProtectedAttributes type: #Number>
	<derived>
	<FMComment: 'The number of protected attributes in a class'>				
	
	^self
		lookUpPropertyNamed: #numberOfProtectedAttributes
		computedAs: [(self attributes select: [:each | each isProtected]) size]
]

{ #category : #metrics }
FamixStClass >> numberOfProtectedMethods [
	<FMProperty: #numberOfProtectedMethods type: #Number>
	<derived>
	<FMComment: 'The number of protected methods in a class'>		
	
	^self
		lookUpPropertyNamed: #numberOfProtectedMethods
		computedAs: [(self methods select: [:each | each isProtected]) size]
]

{ #category : #metrics }
FamixStClass >> numberOfPublicAttributes [
	<FMProperty: #numberOfPublicAttributes type: #Number>
	<derived>
	<FMComment: 'The number of public attributes in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfPublicAttributes
		computedAs: [(self attributes select: [:each | each isPublic]) size]
]

{ #category : #metrics }
FamixStClass >> numberOfPublicMethods [
	<FMProperty: #numberOfPublicMethods type: #Number>
	<derived>
	<FMComment: 'The number of public methods in a class'>		
		
	^self
		lookUpPropertyNamed: #numberOfPublicMethods
		computedAs: [(self methods select: [:each | each isPublic]) size]
]

{ #category : #metrics }
FamixStClass >> numberOfRevealedAttributes [
	<FMProperty: #numberOfRevealedAttributes type: #Number>
	<derived>
	<FMComment: 'The number of public attributes plus the number of accessor methods'>		

	^self
		lookUpPropertyNamed: #numberOfRevealedAttributes
		computedAs:
			[self numberOfPublicAttributes + self numberOfAccessorMethods]
]

{ #category : #metrics }
FamixStClass >> numberOfSubclasses [
	<FMProperty: #numberOfSubclasses type: #Number>
	<derived>
	<FMComment: 'The number of subclasses of a class'>
	^ self lookUpPropertyNamed: #numberOfSubclasses computedAs: [ self subInheritances size ]
]

{ #category : #'Famix-Implementation' }
FamixStClass >> smalltalkClass [
	"Returns the associated smalltalk class if it exist in the system."

	^ FamixSmalltalkNameResolver smalltalkClassFromFamixClassName: self name ifAbsent: [ nil ]
]

{ #category : #'Famix-Implementation' }
FamixStClass >> sourceText [
	self flag: 'This code should be delegated to the FAMIXPharoAnchor'.
	^ self instanceSide smalltalkClass
		ifNotNil: [ :aClass | TonelWriter sourceCodeOf: aClass ]
		ifNil: [ super sourceText ]
]

{ #category : #metrics }
FamixStClass >> subclassHierarchyDepth [ 
	<FMProperty: #subclassHierarchyDepth type: #Number>
	<derived>
	<FMComment: 'The depth of the class hierarchy for which I am the root'>
		
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
FamixStClass >> tightClassCohesion [
	<FMProperty: #tightClassCohesion type: #Number>
	<derived>
	<FMComment: 'Tight class cohesion of a class'>
	self flag: #TODO.
	^ self
		lookUpPropertyNamed: #tightClassCohesion
		computedAs: [ 
			| tcc accessDictionary nom |
			tcc := 0.
			accessDictionary := Dictionary new.
			self
				methods do: [ :eachMethod | 
					eachMethod accesses
						do: [ :eachAccess | 
							| var |
							var := eachAccess variable.
							var isAttribute
								ifTrue: [ 
									| varName accessedFrom |
									varName := var name.
									accessedFrom := accessDictionary at: varName ifAbsent: [  ].
									accessedFrom isNil
										ifTrue: [ 
											accessedFrom := Set new.
											accessDictionary at: varName put: accessedFrom ].
									accessedFrom add: eachMethod name ] ] ].
			accessDictionary values
				do: [ :each | 
					| size |
					size := each size.
					tcc := tcc + (size * (size - 1) / 2) ].
			nom := self numberOfMethods.
			tcc := (nom = 0 or: [ nom = 1 ])
				ifFalse: [ tcc / (nom * (nom - 1) / 2) ]
				ifTrue: [ 0 ].
			tcc asFloat ]
]

{ #category : #metrics }
FamixStClass >> totalNumberOfChildren [
	<FMProperty: #totalNumberOfChildren type: #Number>
	<derived>	
	<FMComment: 'The total number of subclasses of a class'>
	
	^self
		lookUpPropertyNamed: #totalNumberOfChildren
		computedAs: [self subclassHierarchyGroup size]
]

{ #category : #testing }
FamixStClass >> understands: signature [
	"returns true if a class is able to respond to an invocation to aSignature on itself; false otherwise"

	self withSuperclassesDo: [ :each | (each implements: signature) ifTrue: [ ^ true ] ].
	^ false
]

{ #category : #metrics }
FamixStClass >> weightOfAClass [
	<FMProperty: #weightOfAClass type: #Number>
	<derived>
	<FMComment: 'Weight of a class'>	
			
	^self
		lookUpPropertyNamed: #weightOfAClass
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FamixStClass >> weightedMethodCount [
	<FMProperty: #weightedMethodCount type: #Number>
	<derived>
	<FMComment: 'The sum of the complexity in a class'>
			
	^self
		lookUpPropertyNamed: #weightedMethodCount
		computedAs: [self methodsGroup sumNumbers: #cyclomaticComplexity]
]
