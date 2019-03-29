"
MooseObjectQueryResult hold the result of queries that return objects (e.g. opposite) as opposed by associations
"
Class {
	#name : #MooseObjectQueryResult,
	#superclass : #MooseQueryResult,
	#category : #'Moose-Query'
}

{ #category : #filtering }
MooseObjectQueryResult >> allAtAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allAtAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allAtScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allAtScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allToAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allToAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allToScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allToScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allWithAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allWithAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allWithScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allWithScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> atAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity atAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> atScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity atScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> outOfClass: aFAMIXClass [ 
	
	^ self newObjectResultWith: (storage reject: [ :obj | aFAMIXClass == obj typeScope ])
]

{ #category : #filtering }
MooseObjectQueryResult >> outOfNamespace: aFAMIXNamespace [ 

	^ self newObjectResultWith: (storage reject: [:obj | aFAMIXNamespace==obj namespaceScope])
]

{ #category : #filtering }
MooseObjectQueryResult >> outOfPackage: aFAMIXPackage [ 

	^ self newObjectResultWith: (storage reject: [ :obj | aFAMIXPackage == obj packageScope ])
]

{ #category : #filtering }
MooseObjectQueryResult >> toAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity toAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> toScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity toScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> withAnyScope: aCollectionOfFamixClasses [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity withAnyScope: aCollectionOfFamixClasses in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> withScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity withScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> within: aFAMIXEntity [
	"Copy from TDependencyQueryResult because trait is not to be used"
	^aFAMIXEntity selectWithinYourScope: self.
	
]

{ #category : #filtering }
MooseObjectQueryResult >> withinClass: aFAMIXClass [ 
	
	^ self newObjectResultWith: (storage select: [ :obj | aFAMIXClass == obj typeScope ])
]

{ #category : #filtering }
MooseObjectQueryResult >> withinNamespace: aFAMIXNamespace [ 

	^ self newObjectResultWith: (storage select: [:obj | aFAMIXNamespace==obj namespaceScope])
]

{ #category : #filtering }
MooseObjectQueryResult >> withinPackage: aFAMIXPackage [ 

	^ self newObjectResultWith: (storage select: [ :obj | aFAMIXPackage == obj packageScope ])
]

{ #category : #filtering }
MooseObjectQueryResult >> withoutSelfLoops [
	"exclude objects that match the receiver (modulo the scope)"

	^ self reject: [ :obj | obj withAllParents includes: self receiver ]
]
