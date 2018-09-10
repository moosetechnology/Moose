Class {
	#name : #HismoEntityVersion,
	#superclass : #HismoAbstractVersion,
	#instVars : [
		'versionEntity',
		'referenceVersion'
	],
	#category : #'Moose-Hismo'
}

{ #category : #meta }
HismoEntityVersion class >> annotation [
	<MSEClass: #EntityVersion super: #HismoAbstractVersion>
	<package: #Hismo>
]

{ #category : #'instance creation' }
HismoEntityVersion class >> with: aVersionEntity inHistory: aHistory [
	
	^self with: aVersionEntity inHistory: aHistory withReferenceVersion: nil
]

{ #category : #'instance creation' }
HismoEntityVersion class >> with: aVersionEntity inHistory: aHistory withReferenceVersion: aReferenceVersion [ 
	| classes res wantedTypeName |

	wantedTypeName := (aVersionEntity mooseDescription name , 'Version') asSymbol.
	classes := HismoEntityVersion allSubclasses select: [ :each | ((each name) removePrefix: 'Hismo') asSymbol = wantedTypeName ].
	res := classes size = 1 
		ifFalse: [ HismoEntityVersion new ]
		ifTrue: [ classes asArray first new ].
	^ res initialize
		versionEntity: aVersionEntity;
		history: aHistory;
		referenceVersion: aReferenceVersion;
		yourself
]

{ #category : #comparing }
HismoEntityVersion >> < aVersion [
	
	^(self history indexOf: self) < (self history indexOf: aVersion)
]

{ #category : #comparing }
HismoEntityVersion >> <= aVersion [
	
	^(self history indexOf: self) <= (self history indexOf: aVersion)
]

{ #category : #comparing }
HismoEntityVersion >> = aMooseModelOrVersion [
	
	^self versionEntity == aMooseModelOrVersion versionEntity
]

{ #category : #comparing }
HismoEntityVersion >> > aVersion [
	
	^(self history indexOf: self) > (self history indexOf: aVersion)
]

{ #category : #comparing }
HismoEntityVersion >> >= aVersion [
	
	^(self history indexOf: self) >= (self history indexOf: aVersion)
]

{ #category : #properties }
HismoEntityVersion >> addedToLastVersionPropertyNamed: aPropertyName [
	
	| current previous |
	self previousVersion ifNil: [^0].
	current := self propertyNamed: aPropertyName.
	previous := self previousVersion propertyNamed: aPropertyName.
	^0 max: current - previous
]

{ #category : #properties }
HismoEntityVersion >> additionOfPropertyNamed: aPropertyName [
	
	| current previous |
	self previousVersion ifNil: [^0].
	current := self propertyNamed: aPropertyName.
	previous := self previousVersion propertyNamed: aPropertyName.
	^0 max: current - previous
]

{ #category : #'public interface' }
HismoEntityVersion >> allDeclaredProperties [
	
	| ownProperties |
	ownProperties := super allDeclaredProperties copy.
	ownProperties addAll: self versionEntity allDeclaredProperties.
	^ownProperties
]

{ #category : #properties }
HismoEntityVersion >> changeSizeFromLastVersionPropertyNamed: aPropertyName [
	
	| current previous |
	self previousVersion ifNil: [^0].
	current := self propertyNamed: aPropertyName.
	previous := self previousVersion propertyNamed: aPropertyName.
	^current - previous
]

{ #category : #'public interface' }
HismoEntityVersion >> changedFromPrevious: aBlock [
	"returns true if the block returns different results when compared with the previous version"
	
	^self previousVersion isNil not
		and: [(aBlock value: self previousVersion) ~= (aBlock value: self)]
]

{ #category : #'public interface' }
HismoEntityVersion >> changedPropertyNamed: aVersionProperty [
	"returns true is aVersionProperty changed as compared with the previous version"
	
	^self previousVersion isNil not
		and:
			[(self previousVersion propertyNamed: aVersionProperty)
				~= (self propertyNamed: aVersionProperty)]
]

{ #category : #'error handling' }
HismoEntityVersion >> doesNotUnderstand: aMessage [
	
	^self versionEntity
		perform: aMessage selector
		withArguments: aMessage arguments
]

{ #category : #properties }
HismoEntityVersion >> evolutionOfPropertyNamed: aPropertyName [
	
	^(self changeSizeFromLastVersionPropertyNamed: aPropertyName) abs
]

{ #category : #printing }
HismoEntityVersion >> gtDisplayOn: stream [
	
	((self referenceVersion isNil or: [ self referenceVersion versionEntity isNil ])
		or: [ self versionEntity isNil ]) 
			ifTrue: [ ^ super gtDisplayOn: stream ].
			
	stream 
		nextPutAll: self referenceVersion versionEntity name;
		nextPutAll: ' - '.
	self versionEntity gtDisplayOn: stream
]

{ #category : #comparing }
HismoEntityVersion >> hash [
	
	^self versionEntity hash
]

{ #category : #testing }
HismoEntityVersion >> isStub [ 
	^ self versionEntity isStub
]

{ #category : #'public interface' }
HismoEntityVersion >> menu [
	
	| menu |
	menu := super menu.
	menu addItemLabel: self versionEntity mooseDescription name.
	menu menuItems last submenu: self versionEntity menu.
	^menu
]

{ #category : #'public interface' }
HismoEntityVersion >> mooseNameOn: stream [
	
	(self referenceVersion isNil or: [ self versionEntity ])
		ifTrue: [ ^ super mooseNameOn: stream ].
	stream nextPutAll: (self referenceVersion name , ' - ' , self versionEntity mooseName)
]

{ #category : #'public interface' }
HismoEntityVersion >> name [
	self referenceVersion ifNil: [ ^ nil ].
	
	^self referenceVersion versionEntity name , ' - '
		, self versionEntity name
]

{ #category : #printing }
HismoEntityVersion >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: ' with ';
		nextPutAll: self versionEntity printString.
	self referenceVersion ifNotNil: [ :rv | aStream
		nextPutAll: ' (';
		nextPutAll: rv name;
		nextPutAll: ')']
]

{ #category : #'public interface' }
HismoEntityVersion >> propertyNamed: aPropertyName [
	
	| versionEntityProperty |
	versionEntityProperty := self versionEntity propertyNamed: aPropertyName.
	^versionEntityProperty isNil
		ifFalse: [versionEntityProperty]
		ifTrue: [super propertyNamed: aPropertyName]
]

{ #category : #'public interface' }
HismoEntityVersion >> referenceVersion [
	
	^referenceVersion
]

{ #category : #'public interface' }
HismoEntityVersion >> referenceVersion: aReferenceVersion [
	
	referenceVersion := aReferenceVersion.
	self resetMooseName
]

{ #category : #'public interface' }
HismoEntityVersion >> size [
	
	^versionEntity size
]

{ #category : #accessing }
HismoEntityVersion >> versionEntity [
	
	^versionEntity
]

{ #category : #accessing }
HismoEntityVersion >> versionEntity: anObject [
	
	versionEntity := anObject.
	self resetMooseName
]

{ #category : #'public interface' }
HismoEntityVersion >> versionName [
	
	^self versionEntity name
]

{ #category : #'public interface' }
HismoEntityVersion >> versionUniqueName [
	
	^self versionEntity historicalUniqueName
]
