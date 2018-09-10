Extension { #name : #RGBehavior }

{ #category : #'*Calypso-Ring2' }
RGBehavior >> >> aSymbol [

	^ self methodNamed: aSymbol
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> allSelectorsWithout: behaviors [
	"Returns all the selectors of the receiver and its superclasses, except the ones define in behaviors"

	| selectors |
	selectors := IdentitySet new.
	self withAllSuperclassesDo: [ :class | 
			(behaviors includes: class)
				ifFalse: [ selectors addAll: class selectors ] ].
	^ selectors
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> allSuperclassesDo: aBlock [

	^ self allSuperclasses do: aBlock
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> calypsoEnvironmentType [
	^ClyClass
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> canUnderstand: selector [
	"Answer whether the receiver can respond to the message whose selector 
	is the argument."
	
	self allSuperclassesDo: [ :each |
		(each methods anySatisfy: [ :method | method name = selector ])
			ifTrue: [ ^ true ] ].

	^ self methods anySatisfy: [ :method | method name = selector ].
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> compile: aString classified: aCategory [ 

	^ self compile: aString classified: aCategory notifying: nil
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> compile: aString classified: aCategory notifying: aController [

	| parseTree ast selector newMethod | 
	
	parseTree := (RBParser 
		parseMethod: aString
		onError: [ :msg :pos | ^ nil ]) methodClass: self.
		
	ast :=  parseTree doSemanticAnalysisIn: self.  
	
	selector := ast selector.
	newMethod := self ensureLocalMethodNamed: selector.
	newMethod sourceCode: aString.
	aCategory ifNotNil: [ 
		newMethod tagWith: aCategory ].
	
	^ selector.

]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> compile: code notifying: requestor [ 

	| parseTree ast aMethod |
	
	parseTree := (RBParser 
		parseMethod: code 
		onError: [ :msg :pos | "TODO:" ^ nil ]) methodClass: self.
	
	ast := parseTree doSemanticAnalysisIn: self.

	aMethod := self ensureLocalMethodNamed: ast selector.
	aMethod sourceCode: code.
	
	^ aMethod selector
	
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> hasAbstractMethods [
	"Tells whether the receiver locally defines an abstract method, i.e., a method sending subclassResponsibility"
	
	
	^ false
"	^ (self methods anySatisfy: [:cm | cm sendsSelector: #subclassResponsibility ])"
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> includesLocalSelector: aSymbol [
	^self localMethods anySatisfy: [ :each | each name = aSymbol ].
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> includesMethodsAffectedBy: aSystemAnnouncement [
	^aSystemAnnouncement affectsMethodsDefinedInClass: self 

]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> includesVariablesAffectedByModificationOf: modifiedClass [
	"Any class has ClassVariables which are visible from instance side and class side. That's why here we must check both class and metaclass"
	
	self instanceSide = modifiedClass instanceSide ifTrue: [ ^true ].
	self classSide = modifiedClass classSide ifTrue: [ ^true ].
	
	self isRootInEnvironment ifTrue: [ ^false ].
	
	^self superclass includesVariablesAffectedByModificationOf: modifiedClass
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> isClassSide [
	^self == self classSide
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> isDefinedInPackage: aPackage [

	^ self package = aPackage
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> isInstanceSide [
	^self isClassSide not
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> isObsolete [

	^ false
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> lookupSelector: selector [
	"Look up the given selector in my methodDictionary.
	Return the corresponding method if found.
	Otherwise chase the superclass chain and try again.
	Return nil if no method is found."
	| lookupClass |
	lookupClass := self.
	[lookupClass == nil]
		whileFalse: [ 
			lookupClass methodDict 
				at: selector
				ifPresent: [ :method | ^ method ].
			lookupClass := lookupClass superclass].
	^ nil
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> metaLevelScope [
	^self isInstanceSide ifTrue: [ ClyInstanceSideScope ] ifFalse: [ ClyClassSideScope ]
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> methodDict [

	^ Dictionary newFrom: (self methods collect: [ :each | each name asSymbol -> each ])
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> organization [

	^ self
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> protocolNamed: aString [

	^ self protocols detect: [ :each | each name = aString ]
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> sourceCodeTemplate [
	"Answer an expression to be edited and evaluated in order to define 
	methods in this class or trait."

	^ 'messageSelectorAndArgumentNames
	"comment stating purpose of message"

	| temporary variable names |
	statements'
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> subclassDefinerClass [
	^RGClassDefinitionCompiler on: self environment
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> subclassesDo: aBlock [ 
	"Evaluate the argument, aBlock, for each of the receiver's immediate subclasses."
	
	self subclasses do: aBlock
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> traitCompositionIncludes: aTrait [
	^self == aTrait or: 
		[self hasTraitComposition and: 
			[self traitComposition allTraits includes: aTrait]]
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> traits [

	^ self traitComposition traits
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> withAllSuperclasses [
	"Answer an OrderedCollection of the receiver and the receiver's 
	superclasses. The first element is the receiver, 
	followed by its superclass; the last element is Object."

	| temp |
	temp := self allSuperclasses.
	temp addFirst: self.
	^ temp
]

{ #category : #'*Calypso-Ring2' }
RGBehavior >> withAllSuperclassesDo: aBlock [ 
	"Evaluate the argument, aBlock, for each of the receiver's superclasses."
	aBlock value: self.
	((self superclass == nil) or: [ self superclass == self ])
		ifFalse: [self superclass withAllSuperclassesDo: aBlock]
]
