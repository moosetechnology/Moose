Class {
	#name : #HismoModelHistory,
	#superclass : #HismoAbstractHistory,
	#instVars : [
		'name'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoModelHistory class >> annotation [
	<MSEClass: #ModelHistory super: #HismoAbstractHistory>
	<package: #Hismo>

]

{ #category : #'instance creation' }
HismoModelHistory class >> withModels: aCollection [
	
	| result |
	result := self new.
	aCollection do: [:each | result addLastVersionForMooseModel: each].
	^result
]

{ #category : #initialize }
HismoModelHistory >> addLastVersionForMooseModel: aMooseModel [ 
	| version |

	version := HismoEntityVersion 
		with: aMooseModel
		inHistory: self.
	version referenceVersion: version.
	self addLast: version
]

{ #category : #groups }
HismoModelHistory >> allAttributeHistories [
	<navigation: 'All attribute histories'>
	^ self 
		allWithType: HismoAttributeHistory
		ifAbsentPut: 
			[ self 
				computeSubHistoriesWithType: HismoAttributeHistory
				computedForEachVersionAs: [ :version | version allAttributes ]
				withDescription: 'All Attribute Histories' ]
]

{ #category : #groups }
HismoModelHistory >> allClassGroups [
	<navigation: 'All class groups'>
	^ MooseGroup withAll: 
		(FAMIXTypeGroup withAll: 
			((self versions collect: #versionEntity) "we get the moosemodel"
				collect: #allClasses))
]

{ #category : #groups }
HismoModelHistory >> allClassHistories [
	<navigation: 'All class histories'>
	^ self 
		allWithType: HismoClassHistory
		ifAbsentPut: 
			[ self 
				computeSubHistoriesWithType: HismoClassHistory
				computedForEachVersionAs: [ :version | version allClasses ]
				withDescription: 'All Class Histories' ]
]

{ #category : #groups }
HismoModelHistory >> allInheritanceDefinitionHistories [
	<navigation: 'All inheritance definition histories'>
	^ self 
		allWithType: HismoInheritanceDefinitionHistory
		ifAbsentPut: 
			[ self 
				computeSubHistoriesWithType: HismoInheritanceDefinitionHistory
				computedForEachVersionAs: [ :version | version allInheritanceDefinitions ]
				withDescription: 'All Inheritance Definition Histories' ]
]

{ #category : #groups }
HismoModelHistory >> allMethodHistories [
	<navigation: 'All method histories'>
	^ self 
		allWithType: HismoMethodHistory
		ifAbsentPut: 
			[ self 
				computeSubHistoriesWithType: HismoMethodHistory
				computedForEachVersionAs: [ :version | version allMethods ]
				withDescription: 'All Method Histories' ]
]

{ #category : #groups }
HismoModelHistory >> allModels [
	<navigation: 'All models'>
	^ MooseGroup 
		withAll: (self versions collect: #versionEntity) 
		withDescription: 'All models'
]

{ #category : #groups }
HismoModelHistory >> allNamespaceHistories [
	<navigation: 'All namespace histories'>
	^ self 
		allWithType: HismoNamespaceHistory
		ifAbsentPut: 
			[ self 
				computeSubHistoriesWithType: HismoNamespaceHistory
				computedForEachVersionAs: [ :version | version allNamespaces ]
				withDescription: 'All Namespace Histories' ]
]

{ #category : #groups }
HismoModelHistory >> allPackageHistories [
	<navigation: 'All package histories'>
	^ self 
		allWithType: HismoPackageHistory
		ifAbsentPut: 
			[ self 
				computeSubHistoriesWithType: HismoPackageHistory
				computedForEachVersionAs: [ :version | version allPackages ]
				withDescription: 'All Package Histories' ]
]

{ #category : #groups }
HismoModelHistory >> allWithType: aSmalltalkClass [
	^ self allWithType: aSmalltalkClass ofGroupClass: HismoHistoryGroup
]

{ #category : #groups }
HismoModelHistory >> allWithType: aMetaDesription ifAbsentPut: aBlock [
	
	^self historyDictionary
		at: aMetaDesription name
		ifAbsentPut: aBlock
]

{ #category : #actions }
HismoModelHistory >> delete [
	"Actions to delete a model. This is accessible from the Moose Panel"

	<menuItem: 'Delete' category: 'Utilities'>
	| wantsToDelete |
	wantsToDelete := UIManager default confirm: 'Are you sure to want to delete ', self mooseName printString, '?'.
	wantsToDelete ifFalse: [ ^ self ].
	
	self remove
]

{ #category : #properties }
HismoModelHistory >> earliestEvolutionOfNumberOfAttributes [

	^ self allClassHistories sumNumbers: #earliestEvolutionOfNumberOfAttributes
]

{ #category : #properties }
HismoModelHistory >> earliestEvolutionOfNumberOfLinesOfCode [

	^ self allClassHistories sumNumbers: #earliestEvolutionOfNumberOfLinesOfCode
]

{ #category : #properties }
HismoModelHistory >> earliestEvolutionOfNumberOfMethods [

	^ self allClassHistories sumNumbers: #earliestEvolutionOfNumberOfMethods
]

{ #category : #properties }
HismoModelHistory >> earliestEvolutionOfNumberOfStatements [

	^ self allClassHistories sumNumbers: #earliestEvolutionOfNumberOfStatements
]

{ #category : #properties }
HismoModelHistory >> evolutionOfNumberOfAttributes [

	^ self allClassHistories sumNumbers: #evolutionOfNumberOfAttributes
]

{ #category : #properties }
HismoModelHistory >> evolutionOfNumberOfLinesOfCode [

	^ self allClassHistories sumNumbers: #evolutionOfNumberOfLinesOfCode
]

{ #category : #properties }
HismoModelHistory >> evolutionOfNumberOfMethods [

	^ self allClassHistories sumNumbers: #evolutionOfNumberOfMethods
]

{ #category : #properties }
HismoModelHistory >> evolutionOfNumberOfStatements [

	^ self allClassHistories sumNumbers: #evolutionOfNumberOfStatements
]

{ #category : #accessing }
HismoModelHistory >> historyDictionary [
	
	^self entityCache
]

{ #category : #initialize }
HismoModelHistory >> initialize [
	
	super initialize.
	referenceHistory := self.
	name := #'Model History'
]

{ #category : #'public interface' }
HismoModelHistory >> install [ 
	 
	^MooseModel root add: self
]

{ #category : #properties }
HismoModelHistory >> latestEvolutionOfNumberOfAttributes [

	^ self allClassHistories sumNumbers: #latestEvolutionOfNumberOfAttributes
]

{ #category : #properties }
HismoModelHistory >> latestEvolutionOfNumberOfLinesOfCode [

	^ self allClassHistories sumNumbers: #latestEvolutionOfNumberOfLinesOfCode
]

{ #category : #properties }
HismoModelHistory >> latestEvolutionOfNumberOfMethods [

	^ self allClassHistories sumNumbers: #latestEvolutionOfNumberOfMethods
]

{ #category : #properties }
HismoModelHistory >> latestEvolutionOfNumberOfStatements [

	^ self allClassHistories sumNumbers: #latestEvolutionOfNumberOfStatements
]

{ #category : #'public interface' }
HismoModelHistory >> mooseNameOn: aStream [
	
	aStream nextPutAll: self name
]

{ #category : #'public interface' }
HismoModelHistory >> name [
	
	^name
]

{ #category : #accessing }
HismoModelHistory >> name: aName [
	
	name := aName.
	self resetMooseName
]

{ #category : #'public interface' }
HismoModelHistory >> remove [
	MooseModel root remove: self
]
