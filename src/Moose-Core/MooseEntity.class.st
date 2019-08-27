"
MooseEntity is an abstract entity. Entities should subclass this class.
Any moose entity should answer its mooseID, its mooseName and its mooseModel.

!!Extension mechanism

The state instance variable provides a mechanism for extending the state of entities. This is achieved through MooseEntityState. Using this mechanism, a package can extend an entity to add more state. This extension will only be visible when the package is loaded. This is an important mechanism to enable extensibility and modularity. 

For example, if you have YourEntity that subclasses MooseEntity, you can extend it with:

YourEntity>>yourExtendingAttribute
	^ self privateState attributeAt: #yourExtendingAttribute
YourEntity>>yourExtendingAttribute: aValue
	^ self privateState attributeAt: #yourExtendingAttribute put: aValue

(see MooseEntityState for more information)


!!Meta descriptions

Entities should also be meta-described in terms of Fame. This is achieved by means of pragmas:

- First, on the class side, you should have a method . For example, YourEntity could have
YourEntity class>>annotation
	<MSEClass: #YourEntity super: #MooseEntity>
	<package: 'YourPackage'>
	<MSEComment: 'The YourEntity Smalltalk class has a correspondent YourEntity meta entity in the Fame world'>

- The pragma <MSEProperty:type:> must be placed in the getter method to denote a Fame property. For example:
YourEntity>>yourExtendingAttribute
	<MSEProperty: #yourExtendingAttribute type: #YourType>
	<MSEComment: 'This is an attribute extended in a different package'>
	^ self privateState attributeAt: #yourExtendingAttribute
	
	
!!Important API

- mooseID is an Integer that uniquely identifies this entity within the entire Moose environment. 
	It should not change nor be nil. It is generated automatically during the creation of the MooseEntity.
- mooseModel of an entity is must be an instance of MooseModel. It may be nil if the entity is not part of a model.	
	Each entity belongs to one and only one model, if an entity has not yet been added to a model or if an entity has been removed from a model the mooseModel is undefined, that is it may be nil.
- mooseDescription - returns the corresponding FM3MetaDescription instance
- mooseName - returns a symbol that should qualify the current entity. It does not have to be unique

"
Class {
	#name : #MooseEntity,
	#superclass : #Object,
	#instVars : [
		'mooseID',
		'state'
	],
	#classVars : [
		'DefaultState',
		'MooseID'
	],
	#classInstVars : [
		'cache'
	],
	#category : #'Moose-Core'
}

{ #category : #'meta accessing' }
MooseEntity class >> allDeclaredProperties [
	"All properties described in the metamodel"
	 
	^self mooseDescription allAttributes
]

{ #category : #'meta accessing' }
MooseEntity class >> allDeclaredPropertiesIn: aMetamodel [
	"All properties described in the metamodel"
	 
	| aDescription |
	aMetamodel ifNil: [ ^ OrderedCollection new ].
	aDescription := self mooseDescriptionIn: aMetamodel.
	^ aDescription ifNil: [ OrderedCollection new ] 
		ifNotNil: [ aDescription allAttributes ]
]

{ #category : #'meta accessing' }
MooseEntity class >> allPropertySelectors [
	"Return a dictionary with all properties of this kind of entity, including metamodel properties, metrics, and navigation groups. Keys are abstract names of properties, values are implementing selectors"
	
	| props |
	props := IdentityDictionary new.
	self allDeclaredProperties do: [:prop | props at: prop name put: prop implementingSelector].
	(Pragma allNamed: #navigation: from: self to: MooseEntity)
		do: [:p | props at: p selector put: p selector].
	(Pragma allNamed: #'property:longName:description:' from: self to: MooseEntity)
		do: [:p | props at: (p argumentAt: 1) put: p selector].
	^ props
]

{ #category : #'meta accessing' }
MooseEntity class >> allPropertySelectorsComputableForAtLeastOneElementIn: aMooseModel [ 

	"return a list of selectors not returning nil when applied on one random element of this kind in aMooseModel. Do not check all entities of the model, so is faster than allPropertySelectorsComputableIn:"
	|result entity|
	result := OrderedCollection new.
	entity := aMooseModel entities detect: [:anEntity |
		"we first look for entities exactly matching this type"
		(anEntity class = self)
		] ifNone: [
		"if we do not find, we should look for subclassing matching"
		aMooseModel detect: [:anEntity |
			self subclasses includes: anEntity class
			] ifNone: [^ #()]
		].
	self allPropertySelectors  do: [:aSelector |
		(entity perform: aSelector) ifNotNil: [result add: aSelector].
		].
	^ result
		

]

{ #category : #'meta accessing' }
MooseEntity class >> allPropertySelectorsComputableIn: aMooseModel [ 

	"return a list of selectors not returning nil when applied on aMooseModel. Usefull for the ditributionMap wizard. Whith this method, it can provide in a sure way all the available property selectors that will not crash the visu by returning nil. But it takes a lot of time. (Maybe a better solution would be to make the distributionMap resistant to properties returning nil?)"
	|result|
	result := OrderedCollection new.
	^ self allPropertySelectors  do: [:aSelector |
		(aMooseModel allWithSmalltalkType: self) detect: [:each | (each perform: aSelector) isNil] ifNone: [result add: aSelector].
		]
		

]

{ #category : #meta }
MooseEntity class >> annotation [
	<MSEClass: #Entity super: #Object>
	<package: #Moose>
	<abstract>
]

{ #category : #accessing }
MooseEntity class >> cache [
	^ cache ifNil: [ cache := Dictionary new ]
]

{ #category : #accessing }
MooseEntity class >> defaultState [
	^ DefaultState ifNil: [ DefaultState := MooseMemoryEfficientState ]
]

{ #category : #accessing }
MooseEntity class >> defaultState: anObject [
	DefaultState := anObject
]

{ #category : #private }
MooseEntity class >> freshID [ 
	"Answer a fresh ID, which is unique within Moose." 
	 
	nil == MooseID ifTrue: [MooseID := 0]. 
	MooseID := 1 + MooseID. 
	MooseID > SmallInteger maxVal
		ifTrue: 
			[Notification 
				signal: 
					('Moose''s internal element IDs are exceeding the range of SmallInteger, ' 
						, 
							'this may cause system slow down.<n> Please contact <1s> for more information.' 
						expandMacrosWith: self mooseDev)]. 
	^MooseID
]

{ #category : #accessing }
MooseEntity class >> implementingClassesIn: aMetamodel [

	^ { self }
]

{ #category : #testing }
MooseEntity class >> isContainerEntityIn: aMetamodel [
	^ aMetamodel
		additionalProperty: #isContainerEntity
		for: self
		ifAbsentPut: [ (self allDeclaredPropertiesIn: aMetamodel) anySatisfy: #isChildrenProperty ]
]

{ #category : #testing }
MooseEntity class >> isOfType: aClassFAMIX [
	^ self superclassesAndFamixTraits includes: aClassFAMIX
]

{ #category : #constants }
MooseEntity class >> mooseDev [ 
	"Answer the email address of the Moose mailinglist." 
	 
	^'moose-dev@iam.unibe.ch'
]

{ #category : #accessing }
MooseEntity class >> requirements [
	"Used by Famix generator."

	^ {}
]

{ #category : #private }
MooseEntity class >> resetIDGeneration [ 
	"Resets the internal ID generation." 
	 
	MooseID := nil
]

{ #category : #initialization }
MooseEntity class >> resetMooseEntityCache [
	cache := nil
]

{ #category : #private }
MooseEntity class >> setMooseID: anInteger [
	"This method is used in the unit test"
	
	MooseID := anInteger 
]

{ #category : #testing }
MooseEntity class >> superclassesAndFamixTraits [
	^ self cache at: #superclassesAndFamixTraits ifAbsentPut: [ self usedStatefulTraits , self withAllSuperclasses ]
]

{ #category : #'stateful traits' }
MooseEntity class >> usedStatefulTraits [
	^ self cache at: #usedStatefulTraits ifAbsentPut: [ super usedStatefulTraits ]
]

{ #category : #accessing }
MooseEntity class >> usesFamixTrait: aTrait [
	^ self usedStatefulTraits includes: aTrait
]

{ #category : #'meta information' }
MooseEntity >> allDeclaredProperties [
	"All properties described in the metamodel"
	 
	^self mooseDescription allAttributes
]

{ #category : #'meta information' }
MooseEntity >> allDeclaredPropertiesIn: aMetamodel [
	"All properties described in the metamodel"
	 
	| aDescription |
	aMetamodel ifNil: [ ^ OrderedCollection new ].
	aDescription := self mooseDescriptionIn: aMetamodel.
	^ aDescription ifNil: [ OrderedCollection new ] 
		ifNotNil: [ aDescription allAttributes ]
]

{ #category : #'meta information' }
MooseEntity >> allPropertySelectors [
	"Return a dictionary with all properties of the entity, including metamodel properties, metrics, and navigation groups. Keys are abstract names of properties, values are implementing selectors"

	| props |
	props := IdentityDictionary new.
	self allDeclaredProperties
		do: [ :prop | props at: prop name put: prop implementingSelector ].
	(Pragma allNamed: #navigation: from: self class to: MooseEntity)
		do: [ :p | props at: p methodSelector put: p methodSelector ].
	(Pragma
		allNamed: #property:longName:description:
		from: self class
		to: MooseEntity)
		do: [ :p | props at: (p argumentAt: 1) put: p selector ].
	^ props
]

{ #category : #private }
MooseEntity >> announcer [
	^ self privateState attributeAt: #announcer ifAbsentPut: [Announcer new]
]

{ #category : #private }
MooseEntity >> announcer: anAnnouncer [
	^ self privateState attributeAt: #announcer put: anAnnouncer
]

{ #category : #accessing }
MooseEntity >> attributesTogetherWithGenerated [

	"HACK: we need to collect all attributes from the pair generated class - user class"
	^ self class mooseDescription attributes,
	  self class superclass mooseDescription attributes
]

{ #category : #accessing }
MooseEntity >> bookmarkAs: aString [
	"Adds myself in the cache of the mooseModel and mark it as a bookmark"
	| group |
	group := self asMooseGroup description: aString.
	group isBookmarked: true.
	^ self mooseModel add: group asBookmark: aString
]

{ #category : #accessing }
MooseEntity >> children [ 
	 
	| selectors children | 
	selectors := self class selectors select: [:each | 'all*s' match: each]. 
	children := OrderedCollection new. 
	selectors 
		do: 
			[:eachSelector |  
			| group | 
			group := self perform: eachSelector. 
			group isEmpty ifFalse: [children add: group]]. 
	^children
]

{ #category : #private }
MooseEntity >> defaultStateClass [
	"Answer the default implementator of this element's state."

	^ self class defaultState
]

{ #category : #accessing }
MooseEntity >> description [ 
	 
	^self privateState description
]

{ #category : #accessing }
MooseEntity >> description: characters [ 
	 
	self privateState description: characters
]

{ #category : #groups }
MooseEntity >> entityCache [ 
	 
	"should be used read only, i.e. you are not supposed to modify the returned groups.
	If you want to change entityGroups, use privateState 'set' methods"
	^self privateState entityCache
]

{ #category : #groups }
MooseEntity >> groupFor: aSelector [
	"Return a group containing elements corresponding to aSelector"

	"aSelector = allPackages, allClasses, allMethods, ... "

	| groupName |
	groupName := aSelector asString capitalized , ' in ' , self mooseName.
	^ MooseGroup withAll: (self perform: aSelector) asCollection withDescription: groupName
]

{ #category : #printing }
MooseEntity >> gtDisplayOn: aStream [ 
	self mooseNameOn: aStream
]

{ #category : #properties }
MooseEntity >> handleFameProperty: aSymbol value: anObject [
	
	| value |
	super handleFameProperty: aSymbol value: anObject.
	value := (anObject isCollection and: [anObject size = 1]) ifTrue: [anObject anyOne] ifFalse: [anObject].
	self propertyNamed: aSymbol put: value
]

{ #category : #properties }
MooseEntity >> hasTheSamePropertiesAs: aMooseEntity [
	"Returns whether the receiver and the argument have the same properties (attributes and properties)."

	self allDeclaredProperties size = aMooseEntity allDeclaredProperties size 
		ifFalse: [^ false].
	(self allDeclaredProperties collect: [:each | each name]) = 
		(aMooseEntity allDeclaredProperties collect: [:each | each name])
		ifFalse: [^ false].
	self allDeclaredProperties do: [:each |
			(each getFrom: self) = (each getFrom: aMooseEntity)
				ifFalse: [^ false]
				].
	^ true
]

{ #category : #initialization }
MooseEntity >> initialize [ 
	 
	super initialize. 
	self class initializeSlots: self.
	mooseID := MooseModel freshID.
	self resetPrivateState.
]

{ #category : #accessing }
MooseEntity >> isBookmarked [
	^ self propertyNamed: #isBookmarked ifNil: [false]
]

{ #category : #accessing }
MooseEntity >> isBookmarked: aBoolean [
	self propertyNamed: #isBookmarked put: aBoolean
]

{ #category : #testing }
MooseEntity >> isContainerEntity [
	^ self class isContainerEntityIn: self metamodel
]

{ #category : #testing }
MooseEntity >> isOfType: aClassFAMIX [
	^ self class isOfType: aClassFAMIX
]

{ #category : #testing }
MooseEntity >> isStub [ 
	^ self privateState isStub
]

{ #category : #testing }
MooseEntity >> isStub: aBoolean [ 
	^ self privateState isStub: aBoolean
]

{ #category : #accessing }
MooseEntity >> localMooseModel [ 
	 
	^self mooseModel
]

{ #category : #properties }
MooseEntity >> lookUpPropertyNamed: selector computedAs: aBlock [ 
	 
	^self privateState cache: selector initializer: aBlock
]

{ #category : #accessing }
MooseEntity >> metamodel [

	^ self privateModelOrNil
		ifNil: [ super metamodel ]
		ifNotNil: [ :aModel | aModel metamodel ]

]

{ #category : #accessing }
MooseEntity >> mooseDescription [
	^ self mooseModel
		ifNil: [ super mooseDescription ]
		ifNotNil: [ :model | model mooseDescriptionFor: self class ]
]

{ #category : #printing }
MooseEntity >> mooseDisplayStringOn: stream [
	self mooseNameOn: stream
]

{ #category : #accessing }
MooseEntity >> mooseID [ 
	"Returns an unique identifier of this entity.  This method is mandatory, and must 
	return	 an Integer that uniquely identifies this entity within the entire Moose environment.
	The return value must not be nil, and must never change." 
	 
	"nil = mooseID ifTrue: [mooseID := MooseModel freshID]." 
	^mooseID
]

{ #category : #accessing }
MooseEntity >> mooseModel [
	"Answers the model containing the current entity"
	^ self privateState model
]

{ #category : #accessing }
MooseEntity >> mooseModel: aMooseModel [ 
	 
	aMooseModel add: self. 
	self privateState model: aMooseModel
]

{ #category : #printing }
MooseEntity >> mooseName [
	"The return value must not be nil, and must never change.
	The implementation should be fast, as this key may be used
	extensively by MooseGroup or similar facilities.
	
	Do not override this method.
	Instead, use mooseNameOn: to customize the result."
	self privateState hasMooseModel ifFalse: [ "do not cache yet"
			| stream |
			stream := (String new: 64) writeStream.
			self mooseNameOn: stream.
			^stream contents asSymbol ].
	^self privateState 
		propertyAt: #mooseName
		ifAbsentPut: [ 
			| stream |
			stream := (String new: 64) writeStream.
			self mooseNameOn: stream.
			stream contents asSymbol ]
]

{ #category : #printing }
MooseEntity >> mooseNameOn: aStream [ 
	"Hook to customize the rendered text of an entity. Do not specialize mooseName, but change/specialize this method if necessary."
	self mooseID isNil 
		ifTrue: [ aStream nextPutAll: 'nil mooseID!!!' ]
		ifFalse: 
			[ self name 
				ifNil: [ aStream print: self mooseID ]
				ifNotNil: [ aStream nextPutAll: self name ] ]
]

{ #category : #accessing }
MooseEntity >> name [ 
	 
	^#noname
]

{ #category : #'meta information' }
MooseEntity >> navigationSelectors [
	^ (Pragma allNamed: #navigation: from: self class to: MooseEntity)
		collect: [ :p | p methodSelector ]
]

{ #category : #properties }
MooseEntity >> notExistentMetricValue [
	
	^-1
]

{ #category : #printing }
MooseEntity >> printOn: aStream [ 
	 
	super printOn: aStream. 
	aStream space 
		print: 
			([self mooseName] 
				on: Error 
				do: ['Error printing the object'])
]

{ #category : #private }
MooseEntity >> privateClearMooseName [
	" this method causes the cache to fail if called directly. Use resetMooseName instead. "
	self privateState removeProperty: #mooseName
]

{ #category : #accessing }
MooseEntity >> privateModelOrNil [

	^ self privateState attributeAt: #privateModel ifAbsent: [ nil ]
]

{ #category : #private }
MooseEntity >> privateSetMooseModel: aMooseModel [ 
	 
	self privateState model: aMooseModel
]

{ #category : #private }
MooseEntity >> privateState [

	^ state
]

{ #category : #private }
MooseEntity >> privateState: aState [

	state := aState.
	aState entity: self.
]

{ #category : #private }
MooseEntity >> properties [ 
	 
	"for read only uses, i.e. don't change the returned value"
	
	^self privateState allProperties
]

{ #category : #properties }
MooseEntity >> propertyNamed: propertyName [ 
	"Return the value of the property named propertyName, return nil if the property does not exist"

	^ self propertyNamed: propertyName ifNil: [ nil ]

]

{ #category : #properties }
MooseEntity >> propertyNamed: propertyName ifAbsent: aBlock [
	"Return the value of the property named propertyName, evaluate aBlock if the property does not exist"

	| prop |
	prop := propertyName asSymbol.
	^ self privateState
		propertyAt: prop
		ifAbsent: [ | property |
			[ property := self mmGetProperty: (self mooseDescription attributeNamed: propertyName) ]
				on: Error
				do: [ :ex | property := nil ].
			property ifNil: [ aBlock value ] ]
]

{ #category : #properties }
MooseEntity >> propertyNamed: name ifAbsentPut: value [ 
	 
	^self privateState propertyAt: name ifAbsentPut: value
]

{ #category : #properties }
MooseEntity >> propertyNamed: propertyName ifNil: aBlock [
	"Return the value of the property named propertyName, evaluate aBlock if the property does not exist"

	| prop |
	prop := propertyName asSymbol.
	^ self privateState
		propertyAt: prop
		ifAbsent: [ | property |
			[ property := self mmGetProperty: (self mooseDescription attributeNamed: propertyName) ]
				on: Error
				do: [ :ex | property := nil ].
			property ifNil: [ aBlock value ] ]
]

{ #category : #properties }
MooseEntity >> propertyNamed: name put: value [ 
	 
	^self privateState propertyAt: name put: value
]

{ #category : #accessing }
MooseEntity >> removeFromModel [
	^ self mooseModel ifNil: [ self ] ifNotNil: [ self mooseModel removeEntity: self ]
]

{ #category : #'meta information' }
MooseEntity >> resetMooseName [
	"If needed I reset my moose name in the MooseModel. I return true if my MooseName was updated and false if it was not."

	(self hasUniqueMooseNameInModel and: [ self privateState hasMooseModel ]) ifFalse: [ ^ false ].

	self mooseModel resetMooseNameFor: self.

	^ true
]

{ #category : #initialization }
MooseEntity >> resetPrivateState [

	state := self defaultStateClass with: self
]

{ #category : #testing }
MooseEntity >> stub: aBoolean [

	self isStub: aBoolean
]

{ #category : #private }
MooseEntity >> suspendAllAnnouncementsDuring: aBlock [
	| currentAnnouncer |	
	currentAnnouncer := self announcer.
	[ 	self announcer: Announcer new.
		aBlock value ]
			ensure: [ self announcer: currentAnnouncer ]
]

{ #category : #accessing }
MooseEntity >> usesFamixTrait: aTrait [

	^ self class usesFamixTrait: aTrait
]
