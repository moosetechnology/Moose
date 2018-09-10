"
A HistoryGroup is a collection of histories. It offers different traversals and special selections. It also behaves as a history (i.e., a HistoryGroup is a History of a Group).

Instance Variables:
	versions	<Dictionary>	description of versions


"
Class {
	#name : #HismoHistoryGroup,
	#superclass : #MooseGroup,
	#instVars : [
		'versions'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoHistoryGroup class >> annotation [
	<MSEClass: #HistoryGroup super: #MooseGroup>
	<package: #Hismo>
]

{ #category : #'instance creation' }
HismoHistoryGroup class >> withAll: collection [ 

	| common wantedClass wantedType |
	^ self = HismoHistoryGroup
		ifTrue: [ 
			common := collection commonSuperclass.
			wantedType := (common name, 'Group') asSymbol.
			wantedClass := self allSubclasses detect: [:each | each name = wantedType ] ifNone: [HismoHistoryGroup].
			self withKnownType: wantedClass withAll: collection ]
		ifFalse: [ self withKnownType: self withAll: collection ]
]

{ #category : #'public interface' }
HismoHistoryGroup >> = aHistoryGroup [
	
	| aHistoryCollection anotherHistoryCollection |
	(self class = aHistoryGroup class) ifFalse: [^ false].
	aHistoryCollection := self referenceVersions.
	anotherHistoryCollection := aHistoryGroup referenceVersions.
	aHistoryCollection size = anotherHistoryCollection size ifFalse: [^false].
	aHistoryCollection
		do: [:each | (anotherHistoryCollection includes: each) ifFalse: [^false]].
	^true
]

{ #category : #'public interface' }
HismoHistoryGroup >> at: aHistoryName ifAbsentPut: aBlock [
	
	| wantedHistory matchingHistories |
	matchingHistories := self entities
		select: [:each | each mooseName = aHistoryName].
	matchingHistories isEmpty
		ifTrue:
			[wantedHistory := aBlock value.
			self add: wantedHistory.
			self resetVersions]
		ifFalse: [wantedHistory := matchingHistories first].
	^wantedHistory
]

{ #category : #'public interface' }
HismoHistoryGroup >> atReferenceVersion: aReferenceVersion [
	
	^(self versions
		select: [:each | each referenceVersion = aReferenceVersion]) first
]

{ #category : #private }
HismoHistoryGroup >> changeTypeToDefaultType [
	self changeTypeTo: HismoHistoryGroup
]

{ #category : #'co-change' }
HismoHistoryGroup >> coChangeConceptsUsing: aBlock [
	
	| fca |
	fca := MalFormalContext new.
	fca with: self using: #yourself using: aBlock.
	^fca concepts
]

{ #category : #'co-change' }
HismoHistoryGroup >> coChangePatternsUsing: aBlock [ 
	| concepts patterns |
	concepts := self coChangeConceptsUsing: aBlock.
	patterns := concepts select: [ :each | each relevantObjects size > 1 and: [ each attributes size > 2 ] ].
	^ patterns collect: 
		[ :each | 
		HismoCoChangePattern new
			histories: (each relevantObjects collect: #value);
			versions: (each attributes collect: #value);
			concept: each;
			yourself ]
]

{ #category : #'public interface' }
HismoHistoryGroup >> completeHistoryCollect: aBlock ifNotPresent: anotherBlock [
	
	| data |
	data := OrderedCollection new.
	self first referenceHistory versions
		do:
			[:eachReferenceVersion | 
			(self existsInReferenceVersion: eachReferenceVersion)
				ifTrue:
					[data
						addLast:
							(aBlock value: (self atReferenceVersion: eachReferenceVersion))]
				ifFalse: [data addLast: anotherBlock value]].
	^data
]

{ #category : #'public interface' }
HismoHistoryGroup >> createEmptyGroup [
	
	^self class new
]

{ #category : #private }
HismoHistoryGroup >> createEmptyHistory [
	^ HismoAbstractHistory new
]

{ #category : #'yesterday weather' }
HismoHistoryGroup >> detailedYWForYesterday: yesterdayExpression forTomorrow: tomorrowExpression [
	
	^ ( 3 to: self versions size ) collect: [:index | | yesterday tomorrow |
		yesterday := self
				selectByExpression: yesterdayExpression
				appliedFromVersionIndex: 1
				toVersionIndexAndPresentInIt: index - 1.
		tomorrow := self
				selectByExpression: tomorrowExpression
				appliedFromVersionIndexAndPresentInIt: index - 1
				toVersionIndex: self versions size.
		yesterday intersectWith: tomorrow]
]

{ #category : #'public interface' }
HismoHistoryGroup >> entityType [
	
	| types |
	self isEmpty ifTrue: [^#EmptyHistoryGroup].
	types := (self entities collect: [:each | each entityType]) asSet asOrderedCollection.
	^types size = 1
		ifTrue: [(types first asString , 'Group') asSymbol]
		ifFalse: [#HeterogeneousHistoryGroup]
]

{ #category : #'public interface' }
HismoHistoryGroup >> existsInReferenceVersion: aReferenceVersion [
	
	^(self versions
		select: [:each | each referenceVersion = aReferenceVersion]) isEmpty not
]

{ #category : #'public interface' }
HismoHistoryGroup >> historyNamed: aName [
	
	^self
		at: aName
		ifAbsentPut: [self createEmptyHistory]
]

{ #category : #'public interface' }
HismoHistoryGroup >> intersectWith: aGroup [
	
	^self select: [:each | aGroup includes: each]
]

{ #category : #'public interface' }
HismoHistoryGroup >> referenceHistory [
	
	^self isEmpty
		ifTrue: [nil]
		ifFalse: [self first referenceHistory]
]

{ #category : #'public interface' }
HismoHistoryGroup >> referenceVersions [
	
	| versionsNamesSet |
	versionsNamesSet := Set new.
	self entities
		do:
			[:eachHistory | 
			| tempVersionsNames |
			tempVersionsNames := eachHistory versions
				collect: [:eachVersion | eachVersion referenceVersion].
			versionsNamesSet addAll: tempVersionsNames].
	^versionsNamesSet asSortedCollection
]

{ #category : #'public interface' }
HismoHistoryGroup >> resetVersions [
	
	versions := nil
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> select: aBlock appliedForReferenceVersionCollection: aReferenceVersionCollection [
	
	| selectedGroup selectedGroupItemNames |
	selectedGroup := (self selectFromReferenceVersionCollection:
			aReferenceVersionCollection) select: aBlock.
	selectedGroupItemNames := selectedGroup collect: [:each | each mooseName].
	^self select: [:each | selectedGroupItemNames includes: each mooseName]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectBornIn: aVersion [
	
	^self
		select: [:eachHistory | eachHistory first referenceVersion = aVersion]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectBornIn: birthVersion where: birthRelationBlock andLastSeenIn: deathVersion where: deathRelationBlock [
	"This is a complicated message... and probably needs renaming"
	
	^self
		select:
			[:eachHistory | 
			(birthRelationBlock
				value: eachHistory first referenceVersion
				value: birthVersion)
				and:
					[deathRelationBlock
						value: eachHistory last referenceVersion
						value: deathVersion]]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectBornLaterThan: aVersion [
	
	^self
		select: [:eachHistory | eachHistory first referenceVersion > aVersion]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectBornLaterThanOrIn: aVersion [
	
	^self
		selectBornIn: aVersion
		where: [:v1 :v2 | v1 >= v2]
		andLastSeenIn: aVersion
		where: [:v1 :v2 | v1 >= v2]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectBornPriorTo: aVersion [
	
	^self
		select: [:eachHistory | eachHistory first referenceVersion < aVersion]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectBornPriorToOrIn: aVersion [
	
	^self
		select: [:eachHistory | eachHistory first referenceVersion <= aVersion]
]

{ #category : #'enumerating by version index' }
HismoHistoryGroup >> selectByExpression: anExpression appliedFromFirstVersionIndexToVersionIndex: anEndIndex [
	
	| selectedGroup selectedGroupItemNames |
	selectedGroup := (self
		selectFromVersionIndexCollection: (1 to: anEndIndex) asOrderedCollection)
		selectByExpression: anExpression.
	selectedGroupItemNames := selectedGroup collect: [:each | each mooseName].
	^self select: [:each | selectedGroupItemNames includes: each mooseName]
]

{ #category : #'enumerating by version index' }
HismoHistoryGroup >> selectByExpression: anExpression appliedFromVersionIndex: aStartIndex [
	
	| selectedGroup selectedGroupItemNames |
	selectedGroup := (self
		selectFromVersionIndexCollection:
			(aStartIndex to: self versions size) asOrderedCollection)
		selectByExpression: anExpression.
	selectedGroupItemNames := selectedGroup collect: [:each | each mooseName].
	^self select: [:each | selectedGroupItemNames includes: each mooseName]
]

{ #category : #'enumerating by version index' }
HismoHistoryGroup >> selectByExpression: anExpression appliedFromVersionIndex: aStartIndex toVersionIndex: anEndIndex [
	
	| selectedGroup selectedGroupItemNames targetGroup |
	targetGroup := self
		selectFromVersionIndexCollection:
			(aStartIndex to: anEndIndex) asOrderedCollection.
	selectedGroup := targetGroup selectByExpression: anExpression.
	selectedGroupItemNames := selectedGroup collect: [:each | each mooseName].
	^self select: [:each | selectedGroupItemNames includes: each mooseName]
]

{ #category : #'enumerating by version index' }
HismoHistoryGroup >> selectByExpression: anExpression appliedFromVersionIndex: aStartIndex toVersionIndexAndPresentInIt: anEndIndex [
	
	| selectedGroup selectedGroupItemNames targetGroup |
	targetGroup := self selectFromVersionIndexCollectionAndPresentInTheLastSpecifiedVersion:
			(aStartIndex to: anEndIndex) asOrderedCollection.
	selectedGroup := anExpression value: targetGroup.
	selectedGroupItemNames := selectedGroup collect: [:each | each mooseName].
	^self select: [:each | selectedGroupItemNames includes: each mooseName]
]

{ #category : #'enumerating by version index' }
HismoHistoryGroup >> selectByExpression: anExpression appliedFromVersionIndexAndPresentInIt: aStartIndex toVersionIndex: anEndIndex [
	
	| selectedGroup selectedGroupItemNames targetGroup |
	targetGroup := self
		selectFromVersionIndexCollectionAndPresentInTheFirstSpecifiedVersion:
			(aStartIndex to: anEndIndex) asOrderedCollection.
	selectedGroup := anExpression value: targetGroup.
	selectedGroupItemNames := selectedGroup collect: [:each | each mooseName].
	^self select: [:each | selectedGroupItemNames includes: each mooseName]
]

{ #category : #'enumerating by version index' }
HismoHistoryGroup >> selectByExpression: anExpression forVersionIndex: anIndex [
	
	| selectedGroup selectedGroupItemNames |
	selectedGroup := (self
		selectFromVersionIndexCollection: (1 to: anIndex) asOrderedCollection)
		selectByExpression: anExpression.
	selectedGroupItemNames := selectedGroup collect: [:each | each mooseName].
	^self select: [:each | selectedGroupItemNames includes: each mooseName]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectFromReferenceVersionCollection: aCollection [
	"returns the history made by the specified versions"
	
	| selectedHistories selectedHistory |
	selectedHistories := self createEmptyGroup.
	self entities
		do:
			[:each | 
			selectedHistory := each selectFromReferenceVersionCollection: aCollection.
			selectedHistory isEmpty
				ifFalse:
					[selectedHistories
						at: each mooseName
						ifAbsentPut: [selectedHistory]]].
	^selectedHistories
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectFromReferenceVersionCollection: aCollection andPresentInReferenceVersion: aReferenceVersion [
	"returns the history made by the specified versions"
	
	| selectedHistories selectedHistory entitiesPresentInTheLastSpecifiedVersion |
	selectedHistories := self createEmptyGroup.
	entitiesPresentInTheLastSpecifiedVersion := self entities
		select: [:each | each referenceVersions includes: aReferenceVersion].
	entitiesPresentInTheLastSpecifiedVersion
		do:
			[:each | 
			selectedHistory := each selectFromReferenceVersionCollection: aCollection.
			selectedHistory isEmpty
				ifFalse:
					[selectedHistories
						at: each mooseName
						ifAbsentPut: [selectedHistory]]].
	^selectedHistories
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectFromReferenceVersionCollectionAndPresentInTheFirstSpecifiedVersion: aCollection [
	"returns the history made by the specified versions"
	
	^self
		selectFromReferenceVersionCollection: aCollection
		andPresentInReferenceVersion: aCollection first
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectFromReferenceVersionCollectionAndPresentInTheLastSpecifiedVersion: aCollection [
	"returns the history made by the specified versions"
	
	^self
		selectFromReferenceVersionCollection: aCollection
		andPresentInReferenceVersion: aCollection last
]

{ #category : #'enumerating by version index' }
HismoHistoryGroup >> selectFromVersionIndexCollection: aCollection [
	"returns the history made by the specified range of versions"
	
	| versionCollection |
	versionCollection := OrderedCollection new.
	aCollection
		do:
			[:eachIndex | versionCollection add: (self versions at: eachIndex) referenceVersion].
	^self selectFromReferenceVersionCollection: versionCollection
]

{ #category : #'enumerating by version index' }
HismoHistoryGroup >> selectFromVersionIndexCollectionAndPresentInTheFirstSpecifiedVersion: aCollection [
	"returns the history made by the specified range of versions"
	
	| versionCollection |
	versionCollection := OrderedCollection new.
	aCollection
		do:
			[:eachIndex | versionCollection add: (self versions at: eachIndex) referenceVersion].
	^self
		selectFromReferenceVersionCollectionAndPresentInTheFirstSpecifiedVersion:
			versionCollection
]

{ #category : #'enumerating by version index' }
HismoHistoryGroup >> selectFromVersionIndexCollectionAndPresentInTheLastSpecifiedVersion: aCollection [
	"returns the history made by the specified range of versions"
	
	| versionCollection |
	versionCollection := OrderedCollection new.
	aCollection do: [:eachIndex | versionCollection add: (self versions at: eachIndex) referenceVersion].
	^ self selectFromReferenceVersionCollectionAndPresentInTheLastSpecifiedVersion: versionCollection
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectLastSeenIn: aVersion [
	
	^self
		select: [:eachHistory | eachHistory last referenceVersion = aVersion]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectLastSeenLaterThan: aVersion [
	
	^self
		select: [:eachHistory | eachHistory last referenceVersion > aVersion]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectLastSeenLaterThanOrIn: aVersion [
	
	^self
		select: [:eachHistory | eachHistory last referenceVersion >= aVersion]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectLastSeenPriorTo: aVersion [
	
	^self
		select: [:eachHistory | eachHistory last referenceVersion < aVersion]
]

{ #category : #'enumerating by reference version' }
HismoHistoryGroup >> selectLastSeenPriorToOrIn: aVersion [
	
	^self
		select: [:eachHistory | eachHistory last referenceVersion <= aVersion]
]

{ #category : #private }
HismoHistoryGroup >> sourceLanguage [
	
	^self isEmpty not
		ifTrue: [self first first referenceModel sourceLanguage asSymbol]
		ifFalse: [#'']
]

{ #category : #'public interface' }
HismoHistoryGroup >> versionAfterReferenceVersion: aReferenceVersion [
	
	1
		to: self versions size - 1
		do:
			[:index | 
			(self versions at: index) referenceVersion = aReferenceVersion
				ifTrue: [^self versions at: index + 1]].
	^nil
]

{ #category : #'public interface' }
HismoHistoryGroup >> versionPriorToReferenceVersion: aReferenceVersion [
	
	2
		to: self versions size
		do:
			[:index | 
			(self versions at: index) referenceVersion = aReferenceVersion
				ifTrue: [^self versions at: index - 1]].
	^nil
]

{ #category : #'public interface' }
HismoHistoryGroup >> versions [
	versions ifNotNil: [ ^ versions ].
	versions := Dictionary new.
	self entities
		do: [ :eachHistory | 
			eachHistory
				do: [ :eachVersion | 
					versions
						at: eachVersion referenceVersion
						ifAbsentPut: [ HismoEntityVersion with: MooseGroup new inHistory: self withReferenceVersion: eachVersion referenceVersion ].
					(versions at: eachVersion referenceVersion) versionEntity add: eachVersion versionEntity ] ].
	versions := versions keys asSortedCollection collect: [ :eachKey | versions at: eachKey ].
	^ versions
]

{ #category : #'enumerating by version index' }
HismoHistoryGroup >> versionsIndexFrom2Do: aBlock [
	
	^2
		to: versions size
		do: [:i | aBlock value: i]
]

{ #category : #view }
HismoHistoryGroup >> viewSimpleEvolutionMatrix [
	| view |
	<menuItem: 'Evolution matrix' category: 'Visualize'>
	view := RTMondrian new.
	self
		do: [:each | each viewSimpleEvolutionMatrixIn: view].
	view layout verticalLine.
	^ view open "setLabel: 'Simple Evolution Matrix'"
]

{ #category : #'yesterday weather' }
HismoHistoryGroup >> ywForYesterday: yesterdayExpression forTomorrow: tomorrowExpression [
	
	| hitsCount |
	self versions isEmpty ifTrue: [^0].
	hitsCount := (self detailedYWForYesterday: yesterdayExpression forTomorrow: tomorrowExpression)
		inject: 0
		into:
			[:sum :each | 
			each notEmpty
				ifTrue: [sum + 1]
				ifFalse: [sum]].
	^hitsCount / (self versions size - 2)
]
