"
AbstractHistory represents the core concept in the Hismo meta-model.

A history is defined as a sequence of versions of a certain kind (e.g. we can have class history, system history, etc.)

Instance Variables:
	properties	<Dictionary> this dictionary is used for annotations. It is also used for caching the properties computed in Operators.
	versions	<OrderedCollection>	 a sequence versions


"
Class {
	#name : #HismoAbstractHistory,
	#superclass : #FAMIXEntity,
	#instVars : [
		'versions',
		'referenceHistory',
		'parentHistory'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoAbstractHistory class >> annotation [
	<MSEClass: #AbstractHistory super: #FAMIXEntity>
	<package: #Hismo>

]

{ #category : #'instance creation' }
HismoAbstractHistory class >> new [
	
	^super new initialize
]

{ #category : #'public interface' }
HismoAbstractHistory >> addAll: aCollection [
	
	versions addAll: aCollection.
	self resetMooseName
]

{ #category : #'public interface' }
HismoAbstractHistory >> addLast: aVersion [
	
	versions addLast: aVersion.
	self resetMooseName
]

{ #category : #properties }
HismoAbstractHistory >> addedPropertyNamed: aPropertyName [
	
	| totalAdded current previous |
	totalAdded := 0.
	self
		versionsIndexFrom2Do:
			[:i | 
			current := (self versions at: i) propertyNamed: aPropertyName.
			previous := (self versions at: i - 1) propertyNamed: aPropertyName.
			current - previous > 0
				ifTrue: [totalAdded := totalAdded + (current - previous) abs]].
	^totalAdded
]

{ #category : #properties }
HismoAbstractHistory >> age [
	<MSEProperty: #age type: #Number>
	<MSEComment: 'Age of the history'>
	
	^self
		lookUpPropertyNamed: #age
		computedAs: [self size]
]

{ #category : #properties }
HismoAbstractHistory >> allEarliestEvolutionOfPropertyNamed: aPropertyName [
	
	| ene currentValue previousValue |
	ene := self first propertyNamed: aPropertyName.
	self
		versionsIndexFrom2Do:
			[:i | 
			currentValue := (self versions at: i) propertyNamed: aPropertyName.
			previousValue := (self versions at: i - 1) propertyNamed: aPropertyName.
			[ene := ene + ((currentValue - previousValue) abs * (2 raisedTo: 1 - i))]
				on: ArithmeticError
				do: [:exc | ene := ene + 0]].
	^ene asFloat
]

{ #category : #properties }
HismoAbstractHistory >> allEvolutionOfPropertyNamed: aPropertyName [
	
	| ene current previous |
	ene := self first propertyNamed: aPropertyName.
	self
		versionsIndexFrom2Do:
			[:i | 
			current := (self versions at: i) propertyNamed: aPropertyName.
			previous := (self versions at: i - 1) propertyNamed: aPropertyName.
			ene := ene + (current - previous) abs].
	^ene
]

{ #category : #properties }
HismoAbstractHistory >> allLatestEvolutionOfPropertyNamed: aPropertyName [
	
	| ene currentValue previousValue |
	ene := (self first propertyNamed: aPropertyName)
		* (2 raisedTo: 1 - self size).
	self
		versionsIndexFrom2Do:
			[:i | 
			currentValue := (self versions at: i) propertyNamed: aPropertyName.
			previousValue := (self versions at: i - 1) propertyNamed: aPropertyName.
			[ene := ene
				+ ((currentValue - previousValue) abs * (2 raisedTo: i - self size))]
				on: Error
				do: [:exc | ene := ene + 0]].
	^ene asFloat
]

{ #category : #enumerating }
HismoAbstractHistory >> anySatisfy: aBlock [
	
	^self versions anySatisfy: aBlock
]

{ #category : #'public interface' }
HismoAbstractHistory >> at: anIndex [
	"returns the anIndex version"
	
	^self versions at: anIndex
]

{ #category : #versions }
HismoAbstractHistory >> atReferenceVersion: aReferenceVersion [
	"returns the version in the current history that corresponds to aReferenceVersion"
	
	^self versions
		detect: [:each | each referenceVersion = aReferenceVersion]
		ifNone: [nil]
]

{ #category : #enumerating }
HismoAbstractHistory >> collect: aBlock [
	"traverses the versions and collects by aBlock"
	
	^self versions collect: aBlock
]

{ #category : #enumerating }
HismoAbstractHistory >> completeHistoryCollect: aBlock ifNotPresent: anotherBlock [
	"traverses the referenceHistory and collects by aBlock. If the current history does not exist anotherBlock is collected"
	
	| data |
	data := OrderedCollection new.
	self referenceHistory versions
		do:
			[:eachReferenceVersion | 
			(self existsInReferenceVersion: eachReferenceVersion)
				ifTrue:
					[data
						addLast:
							(aBlock value: (self atReferenceVersion: eachReferenceVersion))]
				ifFalse: [data addLast: (anotherBlock value: eachReferenceVersion)]].
	^data
]

{ #category : #enumerating }
HismoAbstractHistory >> completeHistoryDo: aBlock ifNotPresent: anotherBlock [ 
	"traverses the referenceHistory and collects by aBlock. If the current
	history does not exist anotherBlock is collected"
	
	self referenceHistory versions
		do: [:eachReferenceVersion | (self existsInReferenceVersion: eachReferenceVersion)
				ifTrue: [aBlock
						value: (self atReferenceVersion: eachReferenceVersion)]
				ifFalse: [anotherBlock value: eachReferenceVersion]]
]

{ #category : #private }
HismoAbstractHistory >> computeSubHistoriesWithType: aHistoryClass computedForEachVersionAs: aBlock withDescription: aDescription [ 
	"generic method to compute sub histories"
	| histories histDict |
	histories := OrderedCollection new.
	histDict := Dictionary new.
	
	versions do: 
		[ :eachVersion | 
		(aBlock value: eachVersion) do: 
			[ :each | 
			| wantedHistory |
			wantedHistory := histDict 
				at: each historicalUniqueName
				ifAbsentPut: [ aHistoryClass new ].
			(wantedHistory isEmpty not and: [ wantedHistory last referenceVersion = eachVersion referenceVersion ]) ifFalse: 
				[ | newVersion |
				newVersion := HismoEntityVersion 
					with: each
					inHistory: wantedHistory
					withReferenceVersion: eachVersion referenceVersion.
				wantedHistory addLast: newVersion ] ] ].
	histDict values do: [ :each | each referenceHistory: self referenceHistory ].
	histories addAll: histDict values.
	^ HismoHistoryGroup 
		withAll: histories
		withDescription: aDescription
]

{ #category : #statistics }
HismoAbstractHistory >> correlationOf: aBlockOrSymbol1 and: aBlockOrSymbol2 [
	"This method calculates the Pearson correlation for two metrics between all the values obtained from the history versions"
	|setValue1 setValue2 result sum_sq_x sum_sq_y sum_coproduct mean_x mean_y sweep delta_x delta_y pop_sd_x pop_sd_y cov_x_y|
	setValue1:=OrderedCollection new.
	setValue2:=OrderedCollection new.
	
	self versions do:[:currentHistoryVersion|
		setValue1 add: (aBlockOrSymbol1 value: currentHistoryVersion).
		setValue2 add: (aBlockOrSymbol2 value: currentHistoryVersion).
		].

	(setValue1 size ~= setValue2 size) ifTrue:[self error: 'The arrays lenghts are different'].
	(setValue1 asSet size= 1 or: setValue2 asSet size= 1 ) ifTrue:[ self error: 'An array containts only one value'].
	result:=0.
	sum_sq_x:=0.
	sum_sq_y:=0.
	sum_coproduct:=0.
	mean_x:=setValue1 at: 1.
	mean_y:=setValue2 at: 1.
	3 to: (setValue1 size +1) do:[:i|
		sweep:=(i-2)/(i-1).
		delta_x:=(setValue1 at: (i-1))-mean_x.
		delta_y:=(setValue2 at: (i-1))-mean_y.
		sum_sq_x := (sum_sq_x + ((delta_x * delta_x)*sweep )).
            sum_sq_y :=  (sum_sq_y +(delta_y * delta_y * sweep)).
            sum_coproduct := (sum_coproduct +(delta_x * delta_y * sweep)).
            mean_x := (mean_x +(delta_x / (i-1))).
            mean_y := (mean_y +(delta_y / (i-1))).
		].
	pop_sd_x:=(sum_sq_x/(setValue1 size)) sqrt.
	pop_sd_y:=(sum_sq_y/(setValue1 size)) sqrt.
	cov_x_y := (sum_coproduct / (setValue1 size)).
	result := (cov_x_y / (pop_sd_x*pop_sd_y)).
	^result.
]

{ #category : #private }
HismoAbstractHistory >> createEmptyHistory [
	
	| history |
	history := self class new.
	history parentHistory: self.
	history referenceHistory: self referenceHistory.
	^history
]

{ #category : #enumerating }
HismoAbstractHistory >> do: aBlock [
	"traverses the versions and executes aBlock for each version"
	
	^self versions do: aBlock
]

{ #category : #properties }
HismoAbstractHistory >> earliestEvolutionOfPropertyNamed: aPropertyName [
	
	| ene currentValue previousValue |
	ene := 0.
	self
		versionsIndexFrom2Do:
			[:i | 
			currentValue := (self versions at: i) propertyNamed: aPropertyName.
			previousValue := (self versions at: i - 1) propertyNamed: aPropertyName.
			[ene := ene + ((currentValue - previousValue) abs * (2 raisedTo: 2 - i))]
				on: Error
				do: [:exc | ene := ene + 0]].
	^ene asFloat
]

{ #category : #enumerating }
HismoAbstractHistory >> every2VersionsDo: aBlock [
	"traverses the history and executes aBlock that takes 2 parameters: the previous version and the current version"
	
	| previousVersion currentVersion |
	self
		versionsIndexFrom2Do:
			[:i | 
			previousVersion := self versions at: i - 1.
			currentVersion := self versions at: i.
			aBlock value: previousVersion value: currentVersion]
]

{ #category : #enumerating }
HismoAbstractHistory >> every2VersionsHistoryDo: aBlock [
	"traverses the history and executes aBlock that takes 1 parameter: the history formed by the previous version and the current version"
	
	| previousVersion currentVersion currentHistory |
	self
		versionsIndexFrom2Do:
			[:i | 
			previousVersion := (self versions at: i - 1) copy.
			currentVersion := (self versions at: i) copy.
			currentHistory := self createEmptyHistory.
			currentHistory
				addLast: previousVersion;
				addLast: currentVersion.
			previousVersion history: currentHistory.
			currentVersion history: currentHistory.
			aBlock value: currentHistory]
]

{ #category : #properties }
HismoAbstractHistory >> evolutionCountOfPropertyNamed: aPropertyName [
	
	| count current previous |
	count := 0.
	self
		versionsIndexFrom2Do:
			[:i | 
			current := (self versions at: i) propertyNamed: aPropertyName.
			previous := (self versions at: i - 1) propertyNamed: aPropertyName.
			current - previous ~= 0 ifTrue: [count := count + 1]].
	^count
]

{ #category : #properties }
HismoAbstractHistory >> evolutionOfPropertyNamed: aPropertyName [
	
	| ene current previous |
	ene := 0.
	self versionsIndexFrom2Do: [:i | 
			current := aPropertyName value: (self versions at: i) .
			previous := aPropertyName value: (self versions at: i - 1).
			ene := ene + (current - previous) abs].
	^ene
]

{ #category : #versions }
HismoAbstractHistory >> existsInReferenceVersion: aReferenceVersion [
	"answers if the history has a version in aReferenceVersion"
	
	^(self versions
		select: [:each | each referenceVersion = aReferenceVersion]) isEmpty not
]

{ #category : #'public interface' }
HismoAbstractHistory >> first [
	"answers the first version"
	
	^versions first
]

{ #category : #properties }
HismoAbstractHistory >> firstVersionOfPropertyNamed: aPropertyName [
	
	^self first propertyNamed: aPropertyName
]

{ #category : #'public interface' }
HismoAbstractHistory >> hasName: aSymbol [
	"answers whether any of the versions has the name given by aSymbol"
	
	^(self versions collect: [:each | each versionEntity name]) includes:
			aSymbol
]

{ #category : #'public interface' }
HismoAbstractHistory >> hasUniqueMooseNameInModel [
	^true
]

{ #category : #'public interface' }
HismoAbstractHistory >> hasUniqueName: aSymbol [
	"answers whether any of the versions has the  unique name given by aSymbol"
	
	^(self versions collect: [:each | each versionEntity historicalUniqueName])
		includes: aSymbol
]

{ #category : #properties }
HismoAbstractHistory >> historyAverageOfPropertyNamed: aPropertyName [
	
	| sum |
	self isEmpty ifTrue: [^0].
	sum := self versions
		inject: 0
		into: [:s :each | s + (each propertyNamed: aPropertyName)].
	^(sum / self size) asFloat
]

{ #category : #enumerating }
HismoAbstractHistory >> indexOf: aVersion [
	
	^self versions identityIndexOf: aVersion
]

{ #category : #initialize }
HismoAbstractHistory >> initialize [
	
	super initialize.
	versions := OrderedCollection new.
	parentHistory := self
]

{ #category : #properties }
HismoAbstractHistory >> instabilityOfPropertyNamed: aPropertyName [
	
	| stab current previous |
	stab := 0.
	self size = 1 ifTrue: [^1.0].
	self
		versionsIndexFrom2Do:
			[:i | 
			current := (self versions at: i) propertyNamed: aPropertyName.
			previous := (self versions at: i - 1) propertyNamed: aPropertyName.
			current - previous = 0 ifTrue: [stab := stab + 1]].
	^100 - (stab / (self size - 1) * 100 asFloat)
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isBornInReferenceVersion: aReferenceVersion [
	"answers whether the first version of the history is present in the aReferenceVersion"
	
	^self first referenceVersion = aReferenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isBornLaterThanOrInReferenceVersion: aReferenceVersion [
	"answers whether the first version of the history is present later than the aReferenceVersion"
	
	^self first referenceVersion >= aReferenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isBornLaterThanReferenceVersion: aReferenceVersion [
	"answers whether the first version of the history is present later than the aReferenceVersion"
	
	^self first referenceVersion > aReferenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isBornPriorToOrInReferenceVersion: aReferenceVersion [
	"answers whether the first version of the history is present earlier than the aReferenceVersion"
	
	^self first referenceVersion <= aReferenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isBornPriorToReferenceVersion: aReferenceVersion [
	"answers whether the first version of the history is present earlier than the aReferenceVersion"
	
	^self first referenceVersion < aReferenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isDayFly [
	"answers whether the history existed only in one version"
	
	^self size = 1
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isDeadInReferenceVersion: aReferenceVersion [
	"answers whether the last version of the history is present in the aReferenceVersion"
	
	^self last referenceVersion = aReferenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isDeadLaterThanOrInReferenceVersion: aReferenceVersion [
	"answers whether the last version of the history is present later than the aReferenceVersion"
	
	^self last referenceVersion >= aReferenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isDeadLaterThanReferenceVersion: aReferenceVersion [
	"answers whether the last version of the history is present later than the aReferenceVersion"
	
	^self last referenceVersion > aReferenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isDeadPriorToOrInReferenceVersion: aReferenceVersion [
	"answers whether the last version of the history is present prior to the aReferenceVersion"
	
	^self last referenceVersion <= aReferenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isDeadPriorToReferenceVersion: aReferenceVersion [
	"answers whether the last version of the history is present prior to the aReferenceVersion"
	
	^self last referenceVersion < aReferenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isEmpty [
	"answers whether the history does not have versions"
	
	^self size = 0
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isLateBorn [
	"answers whether the first version of the history is not present in the first reference version"
	
	^self first referenceVersion
		> self referenceHistory first referenceVersion
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isPersistent [
	"answers whether the history existed in the entire referenceHistory"
	
	^self size = self referenceHistory size
]

{ #category : #'lifespan testing' }
HismoAbstractHistory >> isRemoved [
	"answers whether the last version of the history is not present in the last reference version"

	^self last referenceVersion < self referenceHistory last referenceVersion
]

{ #category : #'public interface' }
HismoAbstractHistory >> last [
	"answers the last version"
	
	^versions last
]

{ #category : #properties }
HismoAbstractHistory >> lastVersionOfPropertyNamed: aPropertyName [
	
	^self last propertyNamed: aPropertyName
]

{ #category : #properties }
HismoAbstractHistory >> latestEvolutionOfPropertyNamed: aPropertyName [
	
	| ene currentValue previousValue |
	ene := 0.
	self
		versionsIndexFrom2Do:
			[:i | 
			currentValue := (self versions at: i) propertyNamed: aPropertyName.
			previousValue := (self versions at: i - 1) propertyNamed: aPropertyName.
			[ene := ene
				+ ((currentValue - previousValue) abs * (2 raisedTo: i - self size))]
				on: Error
				do: [:exc | ene := ene + 0]].
	^ene asFloat
]

{ #category : #printing }
HismoAbstractHistory >> mooseDisplayStringOn: stream [
	
	stream nextPutAll: (self mooseName asString , ' (' , self versions size printString , ')')
]

{ #category : #'public interface' }
HismoAbstractHistory >> mooseNameOn: stream [
	"returns the unique name of the history"
	
	^ (self isEmpty not and: [ self first versionUniqueName notNil ])
		ifTrue: [ stream nextPutAll: self first versionUniqueName ]
		ifFalse: [ super mooseNameOn: stream ]
]

{ #category : #'public interface' }
HismoAbstractHistory >> name [
	"answers the name of the history"
	
	^self isEmpty
		ifFalse: [self first versionEntity name]
		ifTrue: ['']
]

{ #category : #'public interface' }
HismoAbstractHistory >> originalParentHistory [
	
	^self = self parentHistory
		ifTrue: [self]
		ifFalse: [self parentHistory parentHistory]
]

{ #category : #'public interface' }
HismoAbstractHistory >> parentHistory [
	
	^parentHistory
]

{ #category : #'public interface' }
HismoAbstractHistory >> parentHistory: aHistory [
	
	parentHistory := aHistory
]

{ #category : #printing }
HismoAbstractHistory >> printOn: aStream [
	
	aStream
		nextPutAll: self mooseName asString;
		space;
		nextPutAll: '(' , self versions size printString , ')'
]

{ #category : #'public interface' }
HismoAbstractHistory >> referenceHistory [
	"returns the reference history. The reference history is normally the system history"
	
	^referenceHistory
]

{ #category : #'public interface' }
HismoAbstractHistory >> referenceHistory: aSystemHistory [
	"The reference history is normally the system history"
	
	referenceHistory := aSystemHistory
]

{ #category : #versions }
HismoAbstractHistory >> referenceVersions [
	"returns the reference versions"
	
	^versions collect: [:each | each referenceVersion]
]

{ #category : #versions }
HismoAbstractHistory >> referenceVersionsInWhichChangeOccured: aBlock [
	
	^(self select: [:each | each changedFromPrevious: aBlock])
		collect: [:each | each referenceVersion]
]

{ #category : #versions }
HismoAbstractHistory >> referenceVersionsThatChangedPropertyNamed: aProperty [
	
	^(self select: [:each | each changedPropertyNamed: aProperty])
		collect: [:each | each referenceVersion]
]

{ #category : #properties }
HismoAbstractHistory >> removedPropertyNamed: aPropertyName [
	
	| totalRemoved current previous |
	totalRemoved := 0.
	self
		versionsIndexFrom2Do:
			[:i | 
			current := (self versions at: i) propertyNamed: aPropertyName.
			previous := (self versions at: i - 1) propertyNamed: aPropertyName.
			current - previous < 0
				ifTrue: [totalRemoved := totalRemoved + (current - previous) abs]].
	^totalRemoved
]

{ #category : #enumerating }
HismoAbstractHistory >> select: aBlock [
	"returns a sub history formed by the versions that satisfy aBlock"
	
	| selectedVersions selectedHistory |
	selectedVersions := self versions select: aBlock.
	selectedHistory := self createEmptyHistory.
	selectedHistory referenceHistory: self referenceHistory.
	selectedVersions
		do:
			[:each | 
			| newVersion |
			newVersion := each copy.
			selectedHistory addLast: newVersion.
			newVersion history: selectedHistory].
	^selectedHistory
]

{ #category : #enumerating }
HismoAbstractHistory >> selectFromReferenceVersionCollection: aCollection [
	"returns the history made by the specified versions"
	
	^self
		select:
			[:eachVersion | aCollection includes: eachVersion referenceVersion]
]

{ #category : #enumerating }
HismoAbstractHistory >> selectFromVersionIndexCollection: aCollection [
	"returns the history made by the specified versions"
	
	| selectedVersions selectedHistory |
	selectedVersions := OrderedCollection new.
	aCollection
		do: [:eachIndex | selectedVersions add: (self versions at: eachIndex)].
	selectedHistory := self createEmptyHistory.
	selectedVersions
		do:
			[:each | 
			| newVersion |
			newVersion := each copy.
			selectedHistory addLast: newVersion.
			newVersion history: selectedHistory].
	^selectedHistory
]

{ #category : #'public interface' }
HismoAbstractHistory >> size [
	"returns the size of the history (or the age)"
	
	^versions size
]

{ #category : #properties }
HismoAbstractHistory >> stabilityOfPropertyNamed: aPropertyName [
	
	| stab current previous |
	stab := 0.
	self size = 1 ifTrue: [ ^ 1.0 ].
	self
		versionsIndexFrom2Do:
			[:i | 
			current := (self versions at: i) propertyNamed: aPropertyName.
			previous := (self versions at: i - 1) propertyNamed: aPropertyName.
			current - previous = 0 ifTrue: [stab := stab + 1]].
	^stab / (self size - 1) * 100 asFloat
]

{ #category : #properties }
HismoAbstractHistory >> timeWarpingSimilarityAsComparedWith: aHistory relatedToVersionProperty: aVersionProperty [
	"returns the Dynamic Time Warping distance of the time series formed by collecting aVersionProperty from both the current history and aHistory"
	
	| vector1 vector2 computer |
	vector1 := self versions
		collect: [:each | each propertyNamed: aVersionProperty].
	vector2 := aHistory versions
		collect: [:each | each propertyNamed: aVersionProperty].
	computer := (MalTimeWarpingEngine new)
		vectorA: vector1;
		vectorB: vector2;
		distanceBlock: [:a :b | (a - b) * (a - b)];
		yourself.
	^computer getCost
]

{ #category : #versions }
HismoAbstractHistory >> versionAfterReferenceVersion: aReferenceVersion [
	"returns the version of the current history that comes after the version present in aReferenceVersion"
	
	1
		to: versions size - 1
		do:
			[:index | 
			(self versions at: index) referenceVersion = aReferenceVersion
				ifTrue: [^self versions at: index + 1]].
	^nil
]

{ #category : #versions }
HismoAbstractHistory >> versionPriorToReferenceVersion: aReferenceVersion [
	"returns the version of the current history that comes before the version present in aReferenceVersion"
	
	1
		to: versions size
		do:
			[:index | 
			(self versions at: index) referenceVersion = aReferenceVersion
				ifTrue:
					[index = 1
						ifTrue: [^nil]
						ifFalse: [^self versions at: index - 1]]].
	^nil
]

{ #category : #versions }
HismoAbstractHistory >> versions [
	"returns the versions"

	^versions
]

{ #category : #enumerating }
HismoAbstractHistory >> versionsIndexDo: aBlock [
	"traverses the versions and executes aBlock by providing the index of the version"
	
	1
		to: versions size
		do: [:i | aBlock value: i]
]

{ #category : #enumerating }
HismoAbstractHistory >> versionsIndexFrom2Do: aBlock [
	"traverses the versions starting from the second version and executes aBlock by providing the index of the version"
	
	2
		to: versions size
		do: [:i | aBlock value: i]
]

{ #category : #versions }
HismoAbstractHistory >> versionsThatChangedPropertyNamed: aProperty [
	
	^(self select: [:each | each changedPropertyNamed: aProperty])
		collect: [:each | each]
]

{ #category : #view }
HismoAbstractHistory >> viewSimpleEvolutionMatrix [
	<menuItem: 'Evolution matrix' category: 'Visualize'>
	| view |
	
	view := RTMondrian new.
	self viewSimpleEvolutionMatrixIn: view.
	^ view openWithToolbarEntitled: 'Simple Evolution matrix'
]

{ #category : #view }
HismoAbstractHistory >> viewSimpleEvolutionMatrixIn: aView [
	
	aView shape rectangle color: [ :x | Color lightGray ].
	aView 
		node: self 
		forIt: [
			aView shape rectangle 
				color: [:each | each == each referenceVersion ifTrue: [Color lightGray] ifFalse: [Color white] ].
			aView nodes: (self completeHistoryCollect: [:each | each] 
										ifNotPresent: [:eachRefVersion | eachRefVersion]).
		]
]
