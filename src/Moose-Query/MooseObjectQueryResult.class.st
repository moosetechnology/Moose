"
MooseObjectQueryResult hold the result of queries that return objects (e.g. opposite) as opposed by associations
"
Class {
	#name : #MooseObjectQueryResult,
	#superclass : #MooseQueryResult,
	#category : #'Moose-Query'
}

{ #category : #filtering }
MooseObjectQueryResult >> allAtScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allAtScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allToScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allToScope: aClassFamix in: res ]) asSet
]

{ #category : #filtering }
MooseObjectQueryResult >> allWithScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity allWithScope: aClassFamix in: res ]) asSet
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

{ #category : #scoping }
MooseObjectQueryResult >> primCollectAtScope: aScopeSymbol [

	self deprecated: 'This method is part of the old query system. Now instead of #collectAtScope: aSymbol you should use #atScope: aClass.' on: '19/05/2016' in: 'Moose6.1'.
	^ storage collect: [ :obj | obj perform: aScopeSymbol ]
]

{ #category : #filtering }
MooseObjectQueryResult >> toScope: aClassFamix [
	^ self newObjectResultWith: (self storage inject: OrderedCollection new into: [ :res :entity | entity toScope: aClassFamix in: res ]) asSet
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
