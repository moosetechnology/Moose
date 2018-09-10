Class {
	#name : #FAMIXImportingVisitor,
	#superclass : #FAMIXVisitor,
	#instVars : [
		'model',
		'importingContext'
	],
	#category : #'Famix-Extensions'
}

{ #category : #accessing }
FAMIXImportingVisitor >> context [

	^ importingContext 
]

{ #category : #accessing }
FAMIXImportingVisitor >> importingContext: anImportingContext [

	importingContext := anImportingContext 
]

{ #category : #'initialize-release' }
FAMIXImportingVisitor >> initialize [

	importingContext := MooseImportingContext new importMaximum  
]

{ #category : #accessing }
FAMIXImportingVisitor >> model [
	^ model
]

{ #category : #accessing }
FAMIXImportingVisitor >> model: anObject [
	model := anObject
]

{ #category : #running }
FAMIXImportingVisitor >> runAllPackages [

	self model allPackages do: [ :p | p accept: self ]
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitAccess: anAccess [

	self visitAssociation: anAccess 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitAssociation: anAssociation [

	self visitEntity: anAssociation 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitAttribute: anAttribute [

	self visitStructuralEntity: anAttribute 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitBehaviouralEntity: aBehaviouralEntity [ 
	self visitContainerEntity: aBehaviouralEntity.
	self context shouldImportAccess ifTrue: [ aBehaviouralEntity accesses do: [ :acc | acc accept: self ] ].
	self context shouldImportInvocation ifTrue: 
		[ aBehaviouralEntity outgoingInvocations do: [ :inv | inv accept: self ] ].
	self context shouldImportLocalVariable ifTrue: [ aBehaviouralEntity localVariables do: [ :var | var accept: self ] ].
	self context shouldImportArgument ifTrue: [ aBehaviouralEntity parameters do: [ :par | par accept: self ] ]
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitClass: aClass [

	self visitType: aClass
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitComment: aComment [

	self visitEntity: aComment
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitContainerEntity: aContainerEntity [

	self visitNamedEntity: aContainerEntity.
	
	self context shouldImportAccess ifTrue: [
		aContainerEntity outgoingReferences do: [ :ref | ref accept: self ] ].
	self context shouldImportClass ifTrue: [
		aContainerEntity types do: [ :type | type accept: self ] ].
	
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitEntity: anEntity [

	anEntity sourceAnchor accept: self.
	anEntity comments do: [:com | com accept: self ].
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitGlobalVariable: aGlobalVariable [

	self visitStructuralEntity: aGlobalVariable 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitImplicitVariable: anImplicitVariable [

	self visitStructuralEntity: anImplicitVariable 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitInheritance: anInheritance [

	self visitAssociation: anInheritance 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitInvocation: anInvocation [

	self visitAssociation: anInvocation 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitLeafEntity: aLeafEntity [

	self visitNamedEntity: aLeafEntity 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitLocalVariable: aLocalVariable [

	self visitStructuralEntity: aLocalVariable 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitMethod: aMethod [

	self visitBehaviouralEntity: aMethod 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitNamedEntity: aNamedEntity [

	self visitEntity: aNamedEntity 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitNamespace: aNamespace [

	self visitScopingEntity: aNamespace 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitPackage: aPackage [

	self visitScopingEntity: aPackage.
	aPackage childNamedEntities do: [ :child | child accept: self ]

]

{ #category : #visiting }
FAMIXImportingVisitor >> visitParameter: aParameter [

	self visitStructuralEntity: aParameter 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitReference: aReference [

	self visitAssociation: aReference 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitScopingEntity: aScopingEntity [

	self visitContainerEntity: aScopingEntity.
	
	aScopingEntity childScopes do: [ :cs | cs accept: self ].
	self context shouldImportGlobalVariable ifTrue: [
		aScopingEntity globalVariables do: [ :glv | glv accept: self ].].
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitSourceAnchor: aSourceAnchor [
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitStructuralEntity: aStructuralEntity [

	self visitLeafEntity: aStructuralEntity 
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitType: aType [

	self visitContainerEntity: aType.
	
	self context shouldImportInheritance ifTrue: [
		aType superInheritances do: [:inh | inh accept: self ] ].
	self context shouldImportMethod ifTrue: [
		aType methods do: [ :mth | mth accept: self ] ].
	self context shouldImportAttribute ifTrue: [
		aType attributes do: [ :att | att accept: self ] ].
]

{ #category : #visiting }
FAMIXImportingVisitor >> visitUnknownVariable: anUnknownVariable [

	self visitStructuralEntity: anUnknownVariable 
]
