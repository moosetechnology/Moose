Class {
	#name : #FAMIXClass,
	#superclass : #FAMIXType,
	#traits : 'FamixTClass + FamixTWithExceptions',
	#classTraits : 'FamixTClass classTrait + FamixTWithExceptions classTrait',
	#instVars : [
		'#isInterface'
	],
	#category : #'Famix-Compatibility-Entities-Entities'
}

{ #category : #meta }
FAMIXClass class >> annotation [

	<FMClass: #Class super: #FAMIXType>
	<package: #FAMIX>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics-support' }
FAMIXClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
]

{ #category : #'Famix-Extensions-Testing' }
FAMIXClass >> containsTheReceiverOf: anInvocation [ 
	 
	^anInvocation receivingVariable notNil 
		ifTrue: 
			[anInvocation receivingVariable class name = #FAMIXClass 
				ifTrue: [anInvocation receivingVariable == self] 
				ifFalse: 
					[anInvocation receivingVariable class name = #FAMIXImplicitVariable 
						ifTrue: [anInvocation receivingVariable belongsTo == self] 
						ifFalse: [false]]] 
		ifFalse: [false]
]

{ #category : #metrics }
FAMIXClass >> fanIn [
	<FMProperty: #fanIn type: #Number>
	<derived>
	<FMComment: 'Number of client classes'>
	^ self lookUpPropertyNamed: #fanIn computedAs: [ (self allClientsAtScope: FamixTType) size ]
]

{ #category : #initialization }
FAMIXClass >> initialize [

	super initialize.
	isInterface := false
]

{ #category : #'Famix-Extensions-HierarchyTesting' }
FAMIXClass >> isADirectSubclassOf: aClass [ 
	 
	aClass class = FAMIXClass 
		ifTrue: [^aClass directSubclasses includes: self] 
		ifFalse: [^false]
]

{ #category : #'Famix-Extensions-HierarchyTesting' }
FAMIXClass >> isADirectSuperclassOf: aClass [ 
	 
	aClass class = FAMIXClass 
		ifTrue: [^aClass superclass = self] 
		ifFalse: [^false]
]

{ #category : #'Famix-Extensions-HierarchyTesting' }
FAMIXClass >> isASubclassOf: aClass [ 
	 
	^aClass class = FAMIXClass 
		ifTrue: [aClass subclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #'Famix-Extensions-HierarchyTesting' }
FAMIXClass >> isASuperclassOf: aClass [ 
	 
	^aClass class = FAMIXClass 
		ifTrue: [aClass superclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #'Famix-Extensions-Testing' }
FAMIXClass >> isAccessedBy: anAccess [ 
	 
	^anAccess accesses == self
]

{ #category : #'Famix-Java' }
FAMIXClass >> isIgnored [
	<FMProperty: #isIgnored type: #Boolean>
	<multivalued>
	<derived>
	<FMComment:
		'If the class is a test class, it can be annotated with Ignore, all the tests of contained are bypassed'>
	^ (self isAnnotatedWith: 'Ignore') 
]

{ #category : #'Famix-Extensions-Testing' }
FAMIXClass >> isInheritedBy: anInheritance [ 
	 
	^anInheritance superclass == self
]

{ #category : #accessing }
FAMIXClass >> isInterface [
	<FMProperty: #isInterface type: #Boolean>
	<FMComment: 'This is a boolean flag used to distinguish between classes with implementation and interfaces. It is particularly relevant for Java systems.'>
	^ isInterface ifNil: [ false ]
]

{ #category : #accessing }
FAMIXClass >> isInterface: boolean [
	isInterface := boolean
]

{ #category : #'Famix-Extensions-Testing' }
FAMIXClass >> isInvokedBy: anInvocation [ 
	 
	^(anInvocation candidateList notNil 
		and: [anInvocation candidateList notEmpty]) 
		ifTrue: 
			[anInvocation candidateList 
				anySatisfy: 
					[:mtd | mtd class name = #FmxStMethod and: [mtd belongsTo == self]]] 
		ifFalse: [false]
]

{ #category : #testing }
FAMIXClass >> isTestCase [

	<FMProperty: #isTestCase type: #Boolean>
	<FMComment: 'True if the method is considered as a test'>
	<derived>

	^ self privateState attributeAt: #isTestCase ifAbsent: [ false ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FAMIXClass >> methodsWithoutSutbsAndConstructors [

	"Removing stub and contructor methods. Used to support the calculation of LCOM."
	
	^ (self methods select: [ :each | 
		each isStub not and: [each isConstructor not]]) asSet
]

{ #category : #metrics }
FAMIXClass >> numberOfAbstractMethods [
	<FMProperty: #numberOfAbstractMethods type: #Number>
	<derived>
	<FMComment: 'The number of abstract methods in the class'>
	^ self lookUpPropertyNamed: #numberOfAbstractMethods computedAs: [ self methodsGroup count: [ :each | each isAbstract ] ]
]

{ #category : #metrics }
FAMIXClass >> numberOfAccessesToForeignData [
	<FMProperty: #numberOfAccessesToForeignData type: #Number>
	<derived>
	<FMComment: 'Number of accesses to foreign data'>
	
	^self
		lookUpPropertyNamed: #numberOfAccessesToForeignData
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FAMIXClass >> numberOfAccessorMethods [
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
FAMIXClass >> numberOfAttributes [
	<FMProperty: #numberOfAttributes type: #Number>
	<derived>
	<FMComment: 'The number of attributes in the class'>
	
	^self
		lookUpPropertyNamed: #numberOfAttributes
		computedAs: [self attributes size]
]

{ #category : #accessing }
FAMIXClass >> numberOfComments [
	<FMProperty: #numberOfComments type: #Number>
	<derived>
	<FMComment: 'The number of comments in a class'>
	self flag: #todo.	"Cyril: I am not a big fan of this implementation... We should revisit it."
	^ self lookUpPropertyNamed: #numberOfComments computedAs: [ self comments size + (self methods asArray inject: 0 into: [ :sum :el | el numberOfComments + sum ]) ]
]

{ #category : #metrics }
FAMIXClass >> numberOfConstructorMethods [
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
FAMIXClass >> numberOfDuplicatedLinesOfCodeInternally [
	<FMProperty: #numberOfDuplicatedLinesOfCodeInternally type: #Number>
	<derived>
	<FMComment: 'The number of duplicated lines of code internally'>		

	^self
		lookUpPropertyNamed: #numberOfDuplicatedLinesOfCodeInternally
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FAMIXClass >> numberOfLinesOfCode [

	<FMProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<FMComment: 'The number of lines of code in a class'>

	^self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [self methodsGroup sumNumbers: #numberOfLinesOfCode]
]

{ #category : #metrics }
FAMIXClass >> numberOfMessageSends [
	<FMProperty: #numberOfMessageSends type: #Number>
	<derived>
	<FMComment: 'The number of message sends from a class'>
	
	^self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [self methodsGroup sumNumbers: #numberOfMessageSends]
]

{ #category : #metrics }
FAMIXClass >> numberOfMethodProtocols [
	<FMProperty: #numberOfMethodProtocols type: #Number>
	<derived>
	<FMComment: 'The number of method protocols in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfMethodProtocols
		computedAs: [((self methods collect: [:each | each protocol]) reject: #isNil) asSet size]
]

{ #category : #accessing }
FAMIXClass >> numberOfMethods [
	<FMProperty: #numberOfMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods in a class'>

	^self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [self methods size]
]

{ #category : #metrics }
FAMIXClass >> numberOfPrivateAttributes [
	<FMProperty: #numberOfPrivateAttributes type: #Number>
	<derived>
	<FMComment: 'The number of private attributes in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfPrivateAttributes
		computedAs: [(self attributes select: [:each | each isPrivate]) size]
]

{ #category : #metrics }
FAMIXClass >> numberOfPrivateMethods [
	<FMProperty: #numberOfPrivateMethods type: #Number>
	<derived>
	<FMComment: 'The number of private methods in a class'>
			
	^self
		lookUpPropertyNamed: #numberOfPrivateMethods
		computedAs: [(self methods select: [:each | each isPrivate]) size]
]

{ #category : #metrics }
FAMIXClass >> numberOfProtectedAttributes [
	<FMProperty: #numberOfProtectedAttributes type: #Number>
	<derived>
	<FMComment: 'The number of protected attributes in a class'>				
	
	^self
		lookUpPropertyNamed: #numberOfProtectedAttributes
		computedAs: [(self attributes select: [:each | each isProtected]) size]
]

{ #category : #metrics }
FAMIXClass >> numberOfProtectedMethods [
	<FMProperty: #numberOfProtectedMethods type: #Number>
	<derived>
	<FMComment: 'The number of protected methods in a class'>		
	
	^self
		lookUpPropertyNamed: #numberOfProtectedMethods
		computedAs: [(self methods select: [:each | each isProtected]) size]
]

{ #category : #metrics }
FAMIXClass >> numberOfPublicAttributes [
	<FMProperty: #numberOfPublicAttributes type: #Number>
	<derived>
	<FMComment: 'The number of public attributes in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfPublicAttributes
		computedAs: [(self attributes select: [:each | each isPublic]) size]
]

{ #category : #metrics }
FAMIXClass >> numberOfPublicMethods [
	<FMProperty: #numberOfPublicMethods type: #Number>
	<derived>
	<FMComment: 'The number of public methods in a class'>		
		
	^self
		lookUpPropertyNamed: #numberOfPublicMethods
		computedAs: [(self methods select: [:each | each isPublic]) size]
]

{ #category : #metrics }
FAMIXClass >> numberOfRevealedAttributes [
	<FMProperty: #numberOfRevealedAttributes type: #Number>
	<derived>
	<FMComment: 'The number of public attributes plus the number of accessor methods'>		

	^self
		lookUpPropertyNamed: #numberOfRevealedAttributes
		computedAs:
			[self numberOfPublicAttributes + self numberOfAccessorMethods]
]

{ #category : #metrics }
FAMIXClass >> numberOfSubclasses [
	<FMProperty: #numberOfSubclasses type: #Number>
	<derived>
	<FMComment: 'The number of subclasses of a class'>
	^ self lookUpPropertyNamed: #numberOfSubclasses computedAs: [ self subInheritances size ]
]

{ #category : #'Famix-Implementation' }
FAMIXClass >> smalltalkClass [ 
	"Returns the associated smalltalk class if it exist in the system."
	
	^ FamixSmalltalkNameResolver smalltalkClassFromFamixClassName: 
			self name  ifAbsent: [nil] 
]

{ #category : #'Famix-Smalltalk' }
FAMIXClass >> sourceText [
	self flag: 'This code should be delegated to the FAMIXPharoAnchor'.
	^ self sourceLanguage isSmalltalk
			ifTrue: [  self smalltalkClass 
				ifNotNil: [ :aClass | TonelWriter sourceCodeOf: aClass ] 
				ifNil: [ super sourceText ]]
			ifFalse: [ super sourceText ]
]

{ #category : #'Famix-Extensions' }
FAMIXClass >> structuralChildren [
	^ (OrderedCollection withAll: self methods), self attributes
]

{ #category : #metrics }
FAMIXClass >> tightClassCohesion [
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
FAMIXClass >> weightOfAClass [
	<FMProperty: #weightOfAClass type: #Number>
	<derived>
	<FMComment: 'Weight of a class'>	
			
	^self
		lookUpPropertyNamed: #weightOfAClass
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FAMIXClass >> weightedMethodCount [
	<FMProperty: #weightedMethodCount type: #Number>
	<derived>
	<FMComment: 'The sum of the complexity in a class'>
			
	^self
		lookUpPropertyNamed: #weightedMethodCount
		computedAs: [self methodsGroup sumNumbers: #cyclomaticComplexity]
]
