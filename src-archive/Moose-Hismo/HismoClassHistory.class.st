Class {
	#name : #HismoClassHistory,
	#superclass : #HismoAbstractHistory,
	#instVars : [
		'methodHistories',
		'attributeHistories',
		'containingNamespaceHistory',
		'containingPackageHistory'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoClassHistory class >> annotation [
	<MSEClass: #ClassHistory super: #HismoAbstractHistory>
	<package: #Hismo>

]

{ #category : #initialize }
HismoClassHistory class >> new [
	
	^super new initialize
]

{ #category : #properties }
HismoClassHistory >> addedNumberOfLinesOfCode [
	<MSEProperty: #addedNumberOfLinesOfCode type: #Number>
	<MSEComment: 'Added number of LOC'>

	^self
		lookUpPropertyNamed: #addedNumberOfLinesOfCode
		computedAs: [self addedPropertyNamed: #numberOfLinesOfCode]
]

{ #category : #properties }
HismoClassHistory >> addedNumberOfStatements [
	<MSEProperty: #addedNumberOfStatements type: #Number>
	<MSEComment: 'Added number of statements'>
	
	^self
		lookUpPropertyNamed: #addedNumberOfStatements
		computedAs: [self addedPropertyNamed: #numberOfStatements]
]

{ #category : #properties }
HismoClassHistory >> allEarliestEvolutionOfNumberOfMethods [
	<MSEProperty: #allEarliestEvolutionOfNumberOfMethods type: #Number>
	<MSEComment: 'All earliest evolution of number of methods'>

	^self
		lookUpPropertyNamed: #allEarliestEvolutionOfNumberOfMethods
		computedAs: [self allEarliestEvolutionOfPropertyNamed: #numberOfMethods]
]

{ #category : #properties }
HismoClassHistory >> allEvolutionOfNumberOfMethods [	
	<MSEProperty: #allEvolutionOfNumberOfMethods type: #Number>
	<MSEComment: 'All evolution of number of methods'>
	
	^self
		lookUpPropertyNamed: #allEvolutionOfNumberOfMethods
		computedAs: [self allEvolutionOfPropertyNamed: #numberOfMethods]
]

{ #category : #properties }
HismoClassHistory >> allLatestEvolutionOfNumberOfMethods [
	<MSEProperty: #allLatestEvolutionOfNumberOfMethods type: #Number>
	<MSEComment: 'All latest evolution of number of methods'>

	^self
		lookUpPropertyNamed: #allLatestEvolutionOfNumberOfMethods
		computedAs: [self allLatestEvolutionOfPropertyNamed: #numberOfMethods]
]

{ #category : #accessing }
HismoClassHistory >> attributeHistories [
	
	attributeHistories isNil
		ifTrue:
			["		attributeHistories := self computeSubHistories: AttributeHistory new computedForEachVersionAs: [:version | version allAttributes] withDescription: 'Attribute Histores from ', self uniqueName, ' Class History'."
			attributeHistories := self referenceHistory allAttributeHistories
				select: [:each | each belongsTo = self]].
	^attributeHistories
]

{ #category : #accessing }
HismoClassHistory >> belongsTo [
	"return the namespacehistory it belongs to"
	
	containingNamespaceHistory isNil
		ifTrue:
			[containingNamespaceHistory := (self referenceHistory allNamespaceHistories
				select:
					[:eachClass | eachClass hasUniqueName: self first versionEntity belongsTo mooseName])
				first].
	^containingNamespaceHistory
]

{ #category : #'public interface' }
HismoClassHistory >> directSubHistories [
	<navigation: 'direct sub-histories'>
	| subs |
	subs := MooseGroup new.
	(self referenceHistory allInheritanceDefinitionHistories
		select: [:each | each superHistory = self])
		collect: [:each | subs add: each subHistory].
	^subs
]

{ #category : #'public interface' }
HismoClassHistory >> directSuperHistories [
	<navigation: 'direct super-histories'>
	| supers |
	supers := MooseGroup new.
	(self referenceHistory allInheritanceDefinitionHistories
		select: [:each | each subHistory = self])
		collect: [:each | supers add: each superHistory].
	^supers
]

{ #category : #properties }
HismoClassHistory >> earliestEvolutionOfNumberOfAttributes [
	<MSEProperty: #earliestEvolutionOfNumberOfAttributes type: #Number>
	<MSEComment: 'Earliest evolution of number of attributes'>

	^self
		lookUpPropertyNamed: #earliestEvolutionOfNumberOfAttributes
		computedAs: [self earliestEvolutionOfPropertyNamed: #numberOfAttributes]
]

{ #category : #properties }
HismoClassHistory >> earliestEvolutionOfNumberOfLinesOfCode [
	<MSEProperty: #earliestEvolutionOfNumberOfLinesOfCode type: #Number>
	<MSEComment: 'Earliest evolution of number of lines of code'>

	^self
		lookUpPropertyNamed: #earliestEvolutionOfNumberOfLinesOfCode
		computedAs: [self earliestEvolutionOfPropertyNamed: #numberOfLinesOfCode]
]

{ #category : #properties }
HismoClassHistory >> earliestEvolutionOfNumberOfMethods [
	<MSEProperty: #earliestEvolutionOfNumberOfMethods type: #Number>
	<MSEComment: 'Earliest evolution of number of methods'>

	^self
		lookUpPropertyNamed: #earliestEvolutionOfNumberOfMethods
		computedAs: [self earliestEvolutionOfPropertyNamed: #numberOfMethods]
]

{ #category : #properties }
HismoClassHistory >> earliestEvolutionOfNumberOfStatements [
	<MSEProperty: #earliestEvolutionOfNumberOfMethods type: #Number>
	<MSEComment: 'Earliest evolution of number of statements'>

	^self
		lookUpPropertyNamed: #earliestEvolutionOfNumberOfMethods
		computedAs: [self earliestEvolutionOfPropertyNamed: #numberOfStatements]
]

{ #category : #properties }
HismoClassHistory >> evolutionOfNumberOfAttributes [
	<MSEProperty: #evolutionOfNumberOfAttributes type: #Number>
	<MSEComment: 'The sum of the number of attribute added or removed in subsequent versions'>

	^self
		lookUpPropertyNamed: #evolutionOfNumberOfAttributes
		computedAs: [self evolutionOfPropertyNamed: #numberOfAttributes]
]

{ #category : #properties }
HismoClassHistory >> evolutionOfNumberOfLinesOfCode [
	<MSEProperty: #evolutionOfNumberOfLinesOfCode type: #Number>
	<MSEComment: 'The sum of the number of lines of code added or removed in subsequent versions'>

	^self
		lookUpPropertyNamed: #evolutionOfNumberOfLinesOfCode
		computedAs: [self evolutionOfPropertyNamed: #numberOfLinesOfCode]
]

{ #category : #properties }
HismoClassHistory >> evolutionOfNumberOfMethods [
	<MSEProperty: #evolutionOfNumberOfMethods type: #Number>
	<MSEComment: 'The sum of the number of methods added or removed in subsequent versions'>

	^self
		lookUpPropertyNamed: #evolutionOfNumberOfMethods
		computedAs: [self evolutionOfPropertyNamed: #numberOfMethods]
]

{ #category : #properties }
HismoClassHistory >> evolutionOfNumberOfStatements [
	<MSEProperty: #evolutionOfNumberOfStatements type: #Number>
	<MSEComment: 'The sum of the number of statements added or removed in subsequent versions'>

	^self
		lookUpPropertyNamed: #evolutionOfNumberOfStatements
		computedAs: [self evolutionOfPropertyNamed: #numberOfStatements]
]

{ #category : #properties }
HismoClassHistory >> evolutionOfNumberOfStatementsPer5 [
	<MSEProperty: #evolutionOfNumberOfStatementsPer5 type: #Number>
	<MSEComment: 'The sum of the number of statements added or removed in subsequent versions per 5'>

	^self
		lookUpPropertyNamed: #evolutionOfNumberOfStatementsPer5
		computedAs: [(self evolutionOfPropertyNamed: #numberOfStatements) / 5]
]

{ #category : #properties }
HismoClassHistory >> lastOfNumberOfMethods [
	<MSEProperty: #lastOfNumberOfMethods type: #Number>
	<MSEComment: 'The last number of methods'>

	^self
		lookUpPropertyNamed: #lastOfNumberOfMethods
		computedAs: [self last numberOfMethods]
]

{ #category : #properties }
HismoClassHistory >> latestEvolutionOfNumberOfAttributes [
	<MSEProperty: #latestEvolutionOfNumberOfAttributes type: #Number>
	<MSEComment: 'Latest evolution of number of attributes'>

	^self
		lookUpPropertyNamed: #latestEvolutionOfNumberOfAttributes
		computedAs: [self latestEvolutionOfPropertyNamed: #numberOfAttributes]
]

{ #category : #properties }
HismoClassHistory >> latestEvolutionOfNumberOfLinesOfCode [
	<MSEProperty: #latestEvolutionOfNumberOfLinesOfCode type: #Number>
	<MSEComment: 'Latest evolution of number of lines of code'>

	^self
		lookUpPropertyNamed: #latestEvolutionOfNumberOfLinesOfCode
		computedAs: [self latestEvolutionOfPropertyNamed: #numberOfLinesOfCode]
]

{ #category : #properties }
HismoClassHistory >> latestEvolutionOfNumberOfMethods [
	<MSEProperty: #latestEvolutionOfNumberOfMethods type: #Number>
	<MSEComment: 'Latest evolution of number of methods'>

	^self
		lookUpPropertyNamed: #latestEvolutionOfNumberOfMethods
		computedAs: [self latestEvolutionOfPropertyNamed: #numberOfMethods]
]

{ #category : #properties }
HismoClassHistory >> latestEvolutionOfNumberOfStatements [
	<MSEProperty: #latestEvolutionOfNumberOfStatements type: #Number>
	<MSEComment: 'Latest evolution of number of statements'>

	^self
		lookUpPropertyNamed: #latestEvolutionOfNumberOfStatements
		computedAs: [self latestEvolutionOfPropertyNamed: #numberOfStatements]
]

{ #category : #accessing }
HismoClassHistory >> methodHistories [
	
	methodHistories isNil
		ifTrue:
			["		methodHistories := self computeSubHistories: MethodHistory new computedForEachVersionAs: [:version | version methodDict] withDescription: 'Method Histores from ', self uniqueName, ' Class History'."
			methodHistories := self referenceHistory allMethodHistories
				select: [:each | each belongsTo = self]].
	^methodHistories
]

{ #category : #accessing }
HismoClassHistory >> packagedIn [

	self deprecated: 'Call parentPackage instead of packagedIn'.
	^ self parentPackage
]

{ #category : #accessing }
HismoClassHistory >> parentPackage [
	"return the packagehistory it is packaged in"
	containingPackageHistory isNil ifTrue: 
		[ containingPackageHistory := (self referenceHistory allPackageHistories select: 
			[ :each | 
			each hasUniqueName: self first versionEntity parentPackage historicalUniqueName ]) first ].
	^ containingPackageHistory
]

{ #category : #properties }
HismoClassHistory >> removedNumberOfLinesOfCode [
	<MSEProperty: #removedNumberOfLinesOfCode type: #Number>
	<MSEComment: 'Removed number of LOC'>

	^self
		lookUpPropertyNamed: #removedNumberOfLinesOfCode
		computedAs: [self removedPropertyNamed: #numberOfLinesOfCode]
]

{ #category : #properties }
HismoClassHistory >> removedNumberOfStatements [
	<MSEProperty: #removedNumberOfStatements type: #Number>
	<MSEComment: 'Removed number of statements'>

	^self
		lookUpPropertyNamed: #removedNumberOfStatements
		computedAs: [self removedPropertyNamed: #numberOfStatements]
]

{ #category : #properties }
HismoClassHistory >> stabilityOfNumberOfAttributes [
	<MSEProperty: #stabilityOfNumberOfAttributes type: #Number>
	<MSEComment: 'Stability of number of attributes'>

	^self
		lookUpPropertyNamed: #stabilityOfNumberOfAttributes
		computedAs: [self stabilityOfPropertyNamed: #numberOfAttributes]
]

{ #category : #properties }
HismoClassHistory >> stabilityOfNumberOfMethods [
	<MSEProperty: #stabilityOfNumberOfMethods type: #Number>
	<MSEComment: 'Stability of number of methods'>

	^self
		lookUpPropertyNamed: #stabilityOfNumberOfMethods
		computedAs: [self stabilityOfPropertyNamed: #numberOfMethods]
]

{ #category : #'public interface' }
HismoClassHistory >> subHierarchy [
	
	| hierarchy |
	hierarchy := IdentitySet new.
	self directSubHistories
		do:
			[:each | 
			hierarchy add: each.
			hierarchy addAll: each subHierarchy].
	^hierarchy
]

{ #category : #view }
HismoClassHistory >> viewEvolution [
	<menuItem: 'Evolution' category: 'Visualize'> 
	| view |
	view := RTMondrian new.
	self viewEvolutionOn: view.
	^ view open
]

{ #category : #view }
HismoClassHistory >> viewEvolutionOn: mondrian [
	mondrian shape rectangle 
		width: #numberOfAttributes; 
		height: #numberOfMethods;
		linearFillColor: #numberOfLinesOfCode within: (self versions collect: #versionEntity).
	mondrian nodes: (self versions collect: #versionEntity).
]
