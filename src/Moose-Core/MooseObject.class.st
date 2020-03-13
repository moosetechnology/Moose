"
Description
--------------------

I am an abstract class defining the basic behavior of Moose objects.

Moose Object can have a state (see bellow) and are initialized with an ID. The ID should be unique inside an image. This means that when we export and re-import an entity, the ID can change.

Note: (Cyril F) In the future I would like to push down mooseID on MooseEntity becaure I think that groups should not have an ID, but we need to refactor some things to do that.


Extension mechanism
--------------------

The state instance variable provides a mechanism for extending the state of entities. This is achieved through MooseEntityState. Using this mechanism, a package can extend an entity to add more state. This extension will only be visible when the package is loaded. This is an important mechanism to enable extensibility and modularity. 

For example, if you have YourEntity that subclasses MooseEntity, you can extend it with:

YourEntity>>yourExtendingAttribute
	^ self privateState attributeAt: #yourExtendingAttribute
YourEntity>>yourExtendingAttribute: aValue
	^ self privateState attributeAt: #yourExtendingAttribute put: aValue

(see MooseEntityState for more information)

Public API and Key Messages
--------------------

- mooseDescription - returns the corresponding FM3Class instance
- mooseName - returns a symbol that should qualify the current entity. It does not have to be unique
- mooseID is an Integer that uniquely identifies this entity within the entire Moose environment. 
	It should not change nor be nil. It is generated automatically during the creation of the MooseEntity.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	mooseID:		<anInteger>					The unique ID of the object in Moose.
	state:			<aMooseEntityState>		A state on which we base the extension mechanism of Moose.

"
Class {
	#name : #MooseObject,
	#superclass : #Object,
	#instVars : [
		'state',
		'mooseID'
	],
	#classVars : [
		'DefaultState',
		'MooseID'
	],
	#category : #'Moose-Core'
}

{ #category : #meta }
MooseObject class >> allDeclaredProperties [
	"All properties described in the metamodel"
	 
	^self mooseDescription allProperties
]

{ #category : #meta }
MooseObject class >> annotation [
	<FMClass: #Object super: #Object>
	<package: #Moose>
	<abstract>
]

{ #category : #accessing }
MooseObject class >> defaultState [
	^ DefaultState ifNil: [ DefaultState := MooseMemoryEfficientState ]
]

{ #category : #accessing }
MooseObject class >> defaultState: anObject [
	DefaultState := anObject
]

{ #category : #private }
MooseObject class >> freshID [
	"Answer a fresh ID, which is unique within Moose."

	nil == MooseID ifTrue: [ MooseID := 0 ].
	MooseID := 1 + MooseID.
	MooseID > SmallInteger maxVal
		ifTrue: [ Notification
				signal:
					'Moose''s internal element IDs are exceeding the range of SmallInteger, '
						, 'this may cause system slow down.<n> Please contact moose-dev@iam.unibe.ch for more information.' ].
	^ MooseID
]

{ #category : #testing }
MooseObject class >> isAbstract [
	^ self = MooseObject
]

{ #category : #private }
MooseObject class >> resetIDGeneration [ 
	"Resets the internal ID generation." 
	 
	MooseID := nil
]

{ #category : #private }
MooseObject class >> setMooseID: anInteger [
	"This method is used in the unit test"
	
	MooseID := anInteger 
]

{ #category : #'meta information' }
MooseObject >> allDeclaredProperties [
	"All properties described in the metamodel"
	 
	^self mooseDescription allProperties
]

{ #category : #'meta information' }
MooseObject >> allPropertySelectors [
	"Return a dictionary with all properties of the entity, including metamodel properties, metrics, and navigation groups. Keys are abstract names of properties, values are implementing selectors"

	| props |
	props := IdentityDictionary new.
	self allDeclaredProperties do: [ :prop | props at: prop name put: prop implementingSelector ].
	(Pragma allNamed: #navigation: from: self class to: MooseObject) do: [ :p | props at: p methodSelector put: p methodSelector ].
	(Pragma allNamed: #property:longName:description: from: self class to: MooseObject) do: [ :p | props at: (p argumentAt: 1) put: p selector ].
	^ props
]

{ #category : #private }
MooseObject >> announcer [
	^ self privateState attributeAt: #announcer ifAbsentPut: [Announcer new]
]

{ #category : #private }
MooseObject >> announcer: anAnnouncer [
	^ self privateState attributeAt: #announcer put: anAnnouncer
]

{ #category : #accessing }
MooseObject >> bookmarkAs: aString [
	"Adds myself in the cache of the mooseModel and mark it as a bookmark"
	| group |
	group := self asMooseGroup description: aString.
	group isBookmarked: true.
	^ self mooseModel add: group asBookmark: aString
]

{ #category : #private }
MooseObject >> defaultStateClass [
	"Answer the default implementator of this element's state."

	^ self class defaultState
]

{ #category : #accessing }
MooseObject >> description [
	^ self privateState description
]

{ #category : #accessing }
MooseObject >> description: characters [ 
	 
	self privateState description: characters
]

{ #category : #groups }
MooseObject >> entityCache [ 
	 
	"should be used read only, i.e. you are not supposed to modify the returned groups.
	If you want to change entityGroups, use privateState 'set' methods"
	^self privateState entityCache
]

{ #category : #groups }
MooseObject >> groupFor: aSelector [
	"Return a group containing elements corresponding to aSelector"

	"aSelector = allPackages, allClasses, allMethods, ... "

	| groupName |
	groupName := aSelector asString capitalized , ' in ' , self mooseName.
	^ MooseGroup withAll: (self perform: aSelector) asCollection withDescription: groupName
]

{ #category : #printing }
MooseObject >> gtDisplayOn: aStream [ 
	self mooseNameOn: aStream
]

{ #category : #testing }
MooseObject >> hasMooseModel [
	^ self mooseModel isNotNil
]

{ #category : #initialization }
MooseObject >> initialize [
	super initialize.

	mooseID := self class freshID.
	self resetPrivateState
]

{ #category : #accessing }
MooseObject >> isBookmarked [
	^ self propertyNamed: #isBookmarked ifNil: [false]
]

{ #category : #accessing }
MooseObject >> isBookmarked: aBoolean [
	self propertyNamed: #isBookmarked put: aBoolean
]

{ #category : #properties }
MooseObject >> lookUpPropertyNamed: selector computedAs: aBlock [ 
	 
	^self privateState cache: selector initializer: aBlock
]

{ #category : #accessing }
MooseObject >> metamodel [
	^ self mooseModel
		ifNil: [ super metamodel ]
		ifNotNil: [ :aModel | aModel metamodel ]

]

{ #category : #accessing }
MooseObject >> mooseDescription [
	^ self mooseModel
		ifNil: [ super mooseDescription ]
		ifNotNil: [ :model | model mooseDescriptionFor: self class ]
]

{ #category : #accessing }
MooseObject >> mooseID [
	"Returns an unique identifier of this entity.  This method is mandatory, and must 
	return	 an Integer that uniquely identifies this entity within the entire Moose environment.
	The return value must not be nil, and must never change."

	"nil = mooseID ifTrue: [mooseID := MooseModel freshID]."

	^ mooseID
]

{ #category : #printing }
MooseObject >> mooseName [
	"The return value must not be nil, and must never change.
	The implementation should be fast, as this key may be used
	extensively by MooseGroup or similar facilities.
	
	Do not override this method.
	Instead, use mooseNameOn: to customize the result."

	self hasMooseModel
		ifFalse: [ "do not cache yet"
			| stream |
			stream := (String new: 64) writeStream.
			self mooseNameOn: stream.
			^ stream contents asSymbol ].
	^ self privateState
		propertyAt: #mooseName
		ifAbsentPut: [ | stream |
			stream := (String new: 64) writeStream.
			self mooseNameOn: stream.
			stream contents asSymbol ]
]

{ #category : #printing }
MooseObject >> mooseNameOn: aStream [
	"Hook to customize the rendered text of an entity. Do not specialize mooseName, but change/specialize this method if necessary."

	self mooseID isNil
		ifTrue: [ aStream nextPutAll: 'nil mooseID!!!' ]
		ifFalse: [ self name ifNil: [ aStream print: self mooseID ] ifNotNil: [ aStream nextPutAll: self name ] ]
]

{ #category : #accessing }
MooseObject >> name [
	^ #noname
]

{ #category : #'meta information' }
MooseObject >> navigationSelectors [
	^ (Pragma allNamed: #navigation: from: self class to: MooseObject) collect: [ :p | p methodSelector ]
]

{ #category : #properties }
MooseObject >> notExistentMetricValue [
	
	^-1
]

{ #category : #printing }
MooseObject >> printOn: aStream [
	super printOn: aStream.
	aStream
		space;
		print:
			([ self mooseName ]
				on: Error
				do: [ 'Error printing the object' ])
]

{ #category : #private }
MooseObject >> privateClearMooseName [
	" this method causes the cache to fail if called directly. Use resetMooseName instead. "
	self privateState removeProperty: #mooseName
]

{ #category : #private }
MooseObject >> privateSetMooseModel: aMooseModel [
	"Do nothing in Object"
]

{ #category : #private }
MooseObject >> privateState [

	^ state
]

{ #category : #private }
MooseObject >> privateState: aState [

	state := aState.
	aState entity: self.
]

{ #category : #private }
MooseObject >> properties [ 
	 
	"for read only uses, i.e. don't change the returned value"
	
	^self privateState allProperties
]

{ #category : #properties }
MooseObject >> propertyNamed: propertyName [ 
	"Return the value of the property named propertyName, return nil if the property does not exist"

	^ self propertyNamed: propertyName ifNil: [ nil ]

]

{ #category : #properties }
MooseObject >> propertyNamed: propertyName ifAbsent: aBlock [
	"Return the value of the property named propertyName, evaluate aBlock if the property does not exist"

	| prop |
	prop := propertyName asSymbol.
	^ self privateState
		propertyAt: prop
		ifAbsent: [ | property |
			[ property := self mmGetProperty: (self mooseDescription propertyNamed: propertyName) ]
				on: Error
				do: [ :ex | property := nil ].
			property ifNil: [ aBlock value ] ]
]

{ #category : #properties }
MooseObject >> propertyNamed: name ifAbsentPut: value [ 
	 
	^self privateState propertyAt: name ifAbsentPut: value
]

{ #category : #properties }
MooseObject >> propertyNamed: propertyName ifNil: aBlock [
	"Return the value of the property named propertyName, evaluate aBlock if the property does not exist"

	| prop |
	prop := propertyName asSymbol.
	^ self privateState
		propertyAt: prop
		ifAbsent: [ | property |
			[ property := self mmGetProperty: (self mooseDescription propertyNamed: propertyName) ]
				on: Error
				do: [ :ex | property := nil ].
			property ifNil: [ aBlock value ] ]
]

{ #category : #properties }
MooseObject >> propertyNamed: name put: value [ 
	 
	^self privateState propertyAt: name put: value
]

{ #category : #accessing }
MooseObject >> removeFromModel [
	^ self mooseModel ifNil: [ self ] ifNotNil: [ self mooseModel removeEntity: self ]
]

{ #category : #initialization }
MooseObject >> resetMooseName [
	"If needed I reset my moose name in the MooseModel. I return true if my MooseName was updated and false if it was not."

	(self hasUniqueMooseNameInModel and: [ self hasMooseModel ]) ifFalse: [ ^ false ].

	self mooseModel resetMooseNameFor: self.

	^ true
]

{ #category : #initialization }
MooseObject >> resetPrivateState [

	state := self defaultStateClass with: self
]

{ #category : #private }
MooseObject >> suspendAllAnnouncementsDuring: aBlock [
	| currentAnnouncer |	
	currentAnnouncer := self announcer.
	[ 	self announcer: Announcer new.
		aBlock value ]
			ensure: [ self announcer: currentAnnouncer ]
]
