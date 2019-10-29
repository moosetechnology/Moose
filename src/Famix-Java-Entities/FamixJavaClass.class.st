Class {
	#name : #FamixJavaClass,
	#superclass : #FamixJavaType,
	#traits : 'FamixTClass + FamixTLCOMMetrics + FamixTWithExceptions',
	#classTraits : 'FamixTClass classTrait + FamixTLCOMMetrics classTrait + FamixTWithExceptions classTrait',
	#category : #'Famix-Java-Entities-Entities'
}

{ #category : #meta }
FamixJavaClass class >> annotation [

	<FMClass: #Class super: #FamixJavaType>
	<package: #'Famix-Java-Entities'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixJavaClass >> accessedAttributes [
	
	"Returns my attributes accessed by my methods. If the same attribute is accessed 
	by two different methods it is counted twice.
	Used to support the calculation of LCOM"
	
	^ self methodsWithoutSutbsAndConstructors asOrderedCollection flatCollect: [ :method | method accessedAttributes ]
]

{ #category : #metrics }
FamixJavaClass >> fanIn [
	<FMProperty: #fanIn type: #Number>
	<derived>
	<FMComment: 'Number of client classes'>
	^ self lookUpPropertyNamed: #fanIn computedAs: [ (self allClientsAtScope: FamixTType) size ]
]

{ #category : #testing }
FamixJavaClass >> isADirectSubclassOf: aClass [ 
	 
	aClass class = FamixJavaClass 
		ifTrue: [^aClass directSubclasses includes: self] 
		ifFalse: [^false]
]

{ #category : #testing }
FamixJavaClass >> isADirectSuperclassOf: aClass [ 
	 
	aClass class = FamixJavaClass 
		ifTrue: [^aClass superclass = self] 
		ifFalse: [^false]
]

{ #category : #testing }
FamixJavaClass >> isASubclassOf: aClass [ 
	 
	^aClass class = FamixJavaClass 
		ifTrue: [aClass subclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #testing }
FamixJavaClass >> isASuperclassOf: aClass [ 
	 
	^aClass class = FamixJavaClass 
		ifTrue: [aClass superclassHierarchyGroup includes: self] 
		ifFalse: [false]
]

{ #category : #testing }
FamixJavaClass >> isAccessedBy: anAccess [ 
	 
	^anAccess accesses == self
]

{ #category : #testing }
FamixJavaClass >> isIgnored [
	<FMProperty: #isIgnored type: #Boolean>
	<multivalued>
	<derived>
	<FMComment:
		'If the class is a test class, it can be annotated with Ignore, all the tests of contained are bypassed'>
	^ (self isAnnotatedWith: 'Ignore') 
]

{ #category : #testing }
FamixJavaClass >> isInheritedBy: anInheritance [ 
	 
	^anInheritance superclass == self
]

{ #category : #testing }
FamixJavaClass >> isInterface [

	<FMProperty: #isInterface type: #Boolean>
	<FMComment: 'This is a boolean flag used to distinguish between classes with implementation and interfaces'>

	^ self privateState attributeAt: #isInterface ifAbsent: [ false ]
]

{ #category : #testing }
FamixJavaClass >> isInterface: aBoolean [

	^ self privateState attributeAt: #isInterface put: true
]

{ #category : #testing }
FamixJavaClass >> isInvokedBy: anInvocation [ 
	 
	^(anInvocation candidateList notNil 
		and: [anInvocation candidateList notEmpty]) 
		ifTrue: 
			[anInvocation candidateList 
				anySatisfy: 
					[:mtd | mtd class name = #FmxStMethod and: [mtd belongsTo == self]]] 
		ifFalse: [false]
]

{ #category : #testing }
FamixJavaClass >> isTestCase [

	<FMProperty: #isTestCase type: #Boolean>
	<FMComment: 'True if the method is considered as a test'>
	<derived>

	^ self privateState attributeAt: #isTestCase ifAbsent: [ false ]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixJavaClass >> lcom2 [

	<FMProperty: #lcom2 type: #Number>
	<FMComment: 'lack of cohesion in methods 2 (lcom2)'>
	<derived>

	^ self
		lookUpPropertyNamed: #lcom2
		computedAs: [self calculateLCOM2]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixJavaClass >> lcom3 [

	<FMProperty: #lcom3 type: #Number>
	<FMComment: 'lack of cohesion in methods 3 (lcom3)'>
	<derived>

	^ self
		lookUpPropertyNamed: #lcom3
		computedAs: [self calculateLCOM3]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixJavaClass >> methodsWithoutSutbsAndConstructors [

	"Removing stub and contructor methods. Used to support the calculation of LCOM."
	
	^ (self methods select: [ :each | 
		each isStub not and: [each isConstructor not]]) asSet
]

{ #category : #metrics }
FamixJavaClass >> numberOfAbstractMethods [
	<FMProperty: #numberOfAbstractMethods type: #Number>
	<derived>
	<FMComment: 'The number of abstract methods in the class'>
	^ self lookUpPropertyNamed: #numberOfAbstractMethods computedAs: [ self methodsGroup count: [ :each | each isAbstract ] ]
]

{ #category : #metrics }
FamixJavaClass >> numberOfAccessesToForeignData [
	<FMProperty: #numberOfAccessesToForeignData type: #Number>
	<derived>
	<FMComment: 'Number of accesses to foreign data'>
	
	^self
		lookUpPropertyNamed: #numberOfAccessesToForeignData
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FamixJavaClass >> numberOfAccessorMethods [
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
FamixJavaClass >> numberOfAttributes [
	<FMProperty: #numberOfAttributes type: #Number>
	<derived>
	<FMComment: 'The number of attributes in the class'>
	
	^self
		lookUpPropertyNamed: #numberOfAttributes
		computedAs: [self attributes size]
]

{ #category : #accessing }
FamixJavaClass >> numberOfComments [
	<FMProperty: #numberOfComments type: #Number>
	<derived>
	<FMComment: 'The number of comments in a class'>
	self flag: #todo.	"Cyril: I am not a big fan of this implementation... We should revisit it."
	^ self lookUpPropertyNamed: #numberOfComments computedAs: [ self comments size + (self methods asArray inject: 0 into: [ :sum :el | el numberOfComments + sum ]) ]
]

{ #category : #metrics }
FamixJavaClass >> numberOfConstructorMethods [
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
FamixJavaClass >> numberOfDuplicatedLinesOfCodeInternally [
	<FMProperty: #numberOfDuplicatedLinesOfCodeInternally type: #Number>
	<derived>
	<FMComment: 'The number of duplicated lines of code internally'>		

	^self
		lookUpPropertyNamed: #numberOfDuplicatedLinesOfCodeInternally
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FamixJavaClass >> numberOfLinesOfCode [

	<FMProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<FMComment: 'The number of lines of code in a class'>

	^self
		lookUpPropertyNamed: #numberOfLinesOfCode
		computedAs: [self methodsGroup sumNumbers: #numberOfLinesOfCode]
]

{ #category : #metrics }
FamixJavaClass >> numberOfMessageSends [
	<FMProperty: #numberOfMessageSends type: #Number>
	<derived>
	<FMComment: 'The number of message sends from a class'>
	
	^self
		lookUpPropertyNamed: #numberOfMessageSends
		computedAs: [self methodsGroup sumNumbers: #numberOfMessageSends]
]

{ #category : #metrics }
FamixJavaClass >> numberOfMethodProtocols [
	<FMProperty: #numberOfMethodProtocols type: #Number>
	<derived>
	<FMComment: 'The number of method protocols in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfMethodProtocols
		computedAs: [((self methods collect: [:each | each protocol]) reject: #isNil) asSet size]
]

{ #category : #accessing }
FamixJavaClass >> numberOfMethods [
	<FMProperty: #numberOfMethods type: #Number>
	<derived>
	<FMComment: 'The number of methods in a class'>

	^self
		lookUpPropertyNamed: #numberOfMethods
		computedAs: [self methods size]
]

{ #category : #metrics }
FamixJavaClass >> numberOfPrivateAttributes [
	<FMProperty: #numberOfPrivateAttributes type: #Number>
	<derived>
	<FMComment: 'The number of private attributes in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfPrivateAttributes
		computedAs: [(self attributes select: [:each | each isPrivate]) size]
]

{ #category : #metrics }
FamixJavaClass >> numberOfPrivateMethods [
	<FMProperty: #numberOfPrivateMethods type: #Number>
	<derived>
	<FMComment: 'The number of private methods in a class'>
			
	^self
		lookUpPropertyNamed: #numberOfPrivateMethods
		computedAs: [(self methods select: [:each | each isPrivate]) size]
]

{ #category : #metrics }
FamixJavaClass >> numberOfProtectedAttributes [
	<FMProperty: #numberOfProtectedAttributes type: #Number>
	<derived>
	<FMComment: 'The number of protected attributes in a class'>				
	
	^self
		lookUpPropertyNamed: #numberOfProtectedAttributes
		computedAs: [(self attributes select: [:each | each isProtected]) size]
]

{ #category : #metrics }
FamixJavaClass >> numberOfProtectedMethods [
	<FMProperty: #numberOfProtectedMethods type: #Number>
	<derived>
	<FMComment: 'The number of protected methods in a class'>		
	
	^self
		lookUpPropertyNamed: #numberOfProtectedMethods
		computedAs: [(self methods select: [:each | each isProtected]) size]
]

{ #category : #metrics }
FamixJavaClass >> numberOfPublicAttributes [
	<FMProperty: #numberOfPublicAttributes type: #Number>
	<derived>
	<FMComment: 'The number of public attributes in a class'>
	
	^self
		lookUpPropertyNamed: #numberOfPublicAttributes
		computedAs: [(self attributes select: [:each | each isPublic]) size]
]

{ #category : #metrics }
FamixJavaClass >> numberOfPublicMethods [
	<FMProperty: #numberOfPublicMethods type: #Number>
	<derived>
	<FMComment: 'The number of public methods in a class'>		
		
	^self
		lookUpPropertyNamed: #numberOfPublicMethods
		computedAs: [(self methods select: [:each | each isPublic]) size]
]

{ #category : #metrics }
FamixJavaClass >> numberOfRevealedAttributes [
	<FMProperty: #numberOfRevealedAttributes type: #Number>
	<derived>
	<FMComment: 'The number of public attributes plus the number of accessor methods'>		

	^self
		lookUpPropertyNamed: #numberOfRevealedAttributes
		computedAs:
			[self numberOfPublicAttributes + self numberOfAccessorMethods]
]

{ #category : #metrics }
FamixJavaClass >> numberOfSubclasses [
	<FMProperty: #numberOfSubclasses type: #Number>
	<derived>
	<FMComment: 'The number of subclasses of a class'>
	^ self lookUpPropertyNamed: #numberOfSubclasses computedAs: [ self subInheritances size ]
]

{ #category : #'as yet unclassified' }
FamixJavaClass >> structuralChildren [
	^ (OrderedCollection withAll: self methods), self attributes
]

{ #category : #metrics }
FamixJavaClass >> tightClassCohesion [
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
FamixJavaClass >> weightOfAClass [
	<FMProperty: #weightOfAClass type: #Number>
	<derived>
	<FMComment: 'Weight of a class'>	
			
	^self
		lookUpPropertyNamed: #weightOfAClass
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FamixJavaClass >> weightedMethodCount [
	<FMProperty: #weightedMethodCount type: #Number>
	<derived>
	<FMComment: 'The sum of the complexity in a class'>
			
	^self
		lookUpPropertyNamed: #weightedMethodCount
		computedAs: [self methodsGroup sumNumbers: #cyclomaticComplexity]
]
