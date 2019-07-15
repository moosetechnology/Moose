Class {
	#name : #StatefulTraitsManager,
	#superclass : #Object,
	#instVars : [
		'mergedClasses'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #StatefulTraits
}

{ #category : #accessing }
StatefulTraitsManager class >> reset [
	uniqueInstance ifNotNil:#unsubscribe.
	uniqueInstance := nil.
]

{ #category : #accessing }
StatefulTraitsManager class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'events handling' }
StatefulTraitsManager >> classModified: anEvent [
	
	mergedClasses do: [ :info | info classModified: anEvent].
]

{ #category : #accessing }
StatefulTraitsManager >> cleanAll [

	self mergedClasses do: #clean
]

{ #category : #pragmas }
StatefulTraitsManager >> findClasses [

	"return dictionary of classes that should be managed. Use traits as values"
	
	^ #statefulTraits pragmas collect: [ :pragma | 
		pragma method methodClass instanceSide -> (pragma method methodClass instanceSide perform: pragma method selector )].
]

{ #category : #initialization }
StatefulTraitsManager >> initialize [ 

	super initialize.
	
	mergedClasses := Set new.
	
	SystemAnnouncer uniqueInstance weak
		when: MethodAdded send: #methodAdded: to: self;
		when: MethodModified send: #methodModified: to: self;
		when: MethodRemoved send: #methodRemoved: to: self;
		when: ClassModificationApplied send: #classModified: to: self.

]

{ #category : #accessing }
StatefulTraitsManager >> manage: aClass [

	| info | 
	
	(self manages: aClass) ifTrue: [ 
		^ self mergedClasses detect: [ :each | each mergedClass = aClass ] ].
	
	info := StatefulTraitsMergedClassInfo on: aClass.
	self mergedClasses add: info.
	^ info
]

{ #category : #pragmas }
StatefulTraitsManager >> manageAllFromPragmas [

	"manage all classes defined by <statefulTraits> pragma"
	
	self findClasses do: [ :assoc |
		| info |
		info := self manage: assoc key.
		assoc value do: [:aTrait |
			info addTrait: aTrait].
		info merge.]
	

]

{ #category : #pragmas }
StatefulTraitsManager >> managePackageNamed: aPackageName [

	"manage all classes defined by <statefulTraits> pragma"
	
	(self findClasses select: [ :each | each key package name = aPackageName ]) do: [ :assoc |
		| info |
		info := self manage: assoc key.
		assoc value do: [:aTrait |
			aTrait ifNotNil: [ 
				info addTrait: aTrait]].
		info merge.]
	

]

{ #category : #accessing }
StatefulTraitsManager >> manages: aClass [

	^ self mergedClasses anySatisfy: [ :each | each mergedClass = aClass ]
]

{ #category : #accessing }
StatefulTraitsManager >> merge: aClass [

	| info |
	
	info := self manage: aClass.
	info clean.
	info merge.
]

{ #category : #accessing }
StatefulTraitsManager >> merge: aClass with: traits [

	| info |
	
	info := self manage: aClass.
	info clean.
	traits do: [ :each | info addTrait: each ].
	info merge.
]

{ #category : #accessing }
StatefulTraitsManager >> mergedClasses [
	^ mergedClasses
]

{ #category : #accessing }
StatefulTraitsManager >> mergedClasses: anObject [
	mergedClasses := anObject
]

{ #category : #'events handling' }
StatefulTraitsManager >> methodAdded: anEvent [
	
	mergedClasses do: [ :info | info methodAdded: anEvent].
]

{ #category : #'events handling' }
StatefulTraitsManager >> methodModified: anEvent [
	
	mergedClasses do: [ :info | info methodModified: anEvent].
]

{ #category : #'events handling' }
StatefulTraitsManager >> methodRemoved: anEvent [

	mergedClasses do: [ :info | info methodRemoved: anEvent].
]

{ #category : #'events handling' }
StatefulTraitsManager >> unsubscribe [
	SystemAnnouncer uniqueInstance unsubscribe: self.
]
