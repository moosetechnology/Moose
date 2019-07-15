Class {
	#name : #HismoNamespaceHistory,
	#superclass : #HismoAbstractHistory,
	#instVars : [
		'classHistories',
		'containingNamespaceHistory',
		'namespaceHistories'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoNamespaceHistory class >> annotation [
	<MSEClass: #NamespaceHistory super: #HismoAbstractHistory>
	<package: #Hismo>

]

{ #category : #accessing }
HismoNamespaceHistory >> belongsTo [
	"return the namespacehistory it belongs to"
	
	^containingNamespaceHistory
		ifNil:
			[self first versionEntity belongsTo isNil
				ifFalse:
					[containingNamespaceHistory := (self referenceHistory allNamespaceHistories
						select:
							[:eachClass | eachClass hasUniqueName: self first versionEntity belongsTo mooseName])
						first]
				ifTrue: [nil]]
]

{ #category : #accessing }
HismoNamespaceHistory >> classHistories [
	
	classHistories isNil
		ifTrue:
			[classHistories := self referenceHistory allClassHistories
				select: [:each | each belongsTo = self]].
	^classHistories
]

{ #category : #accessing }
HismoNamespaceHistory >> classHistoriesPresentInTheLastVersion [
	
	^self computeClassHistoriesPresentInTheLastVersion
]

{ #category : #private }
HismoNamespaceHistory >> computeClassHistories [
	"self computeClassHistories"
	| theClassHistories |
	theClassHistories := HismoClassHistoryGroup new.
	versions do: 
		[ :eachVersion | 
		eachVersion classesDo: [ :eachClass | (theClassHistories at: eachClass mooseName) addLast: eachClass ] ].
	^ theClassHistories
]

{ #category : #private }
HismoNamespaceHistory >> computeClassHistoriesPresentInTheLastVersion [
	"self computeClassHistories"
	
	^self computeClassHistories
		select:
			[:each | each versions last referenceVersion = self versions last referenceVersion]
]

{ #category : #properties }
HismoNamespaceHistory >> evolutionOfNumberOfClasses [
	
"	<property: #ENOCls longName: 'Evolution of number of classes'
		description:
			'The sum of the number of classes added or removed in subsequent versions'>"

	<MSEProperty: #evolutionOfNumberOfClasses type: #Number>
	<MSEComment: 'The sum of the number of classes added or removed in subsequent versions'>

	^self
		lookUpPropertyNamed: #evolutionOfNumberOfClasses
		computedAs: [self evolutionOfPropertyNamed: #numberOfClasses]
]

{ #category : #accessing }
HismoNamespaceHistory >> namespaceHistories [
	
	^namespaceHistories
		ifNil:
			[namespaceHistories := self referenceHistory allNamespaceHistories
				select: [:each | each belongsTo = self]]
]
