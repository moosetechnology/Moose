Class {
	#name : #FAMIXVisitor,
	#superclass : #Object,
	#category : #'Famix-Extensions'
}

{ #category : #visiting }
FAMIXVisitor >> visitAccess: anAccess [

	self visitAssociation: anAccess 
]

{ #category : #visiting }
FAMIXVisitor >> visitAssociation: anAssociation [

	self visitEntity: anAssociation 
]

{ #category : #visiting }
FAMIXVisitor >> visitAttribute: anAttribute [

	self visitStructuralEntity: anAttribute 
]

{ #category : #visiting }
FAMIXVisitor >> visitBehaviouralEntity: aBehaviouralEntity [ 
	self visitContainerEntity: aBehaviouralEntity.
]

{ #category : #visiting }
FAMIXVisitor >> visitClass: aClass [

	self visitType: aClass
]

{ #category : #visiting }
FAMIXVisitor >> visitComment: aComment [

	self visitEntity: aComment
]

{ #category : #visiting }
FAMIXVisitor >> visitContainerEntity: aContainerEntity [

	self visitNamedEntity: aContainerEntity.
]

{ #category : #visiting }
FAMIXVisitor >> visitEntity: anEntity [
	self subclassResponsibility 
]

{ #category : #visiting }
FAMIXVisitor >> visitGlobalVariable: aGlobalVariable [

	self visitStructuralEntity: aGlobalVariable 
]

{ #category : #visiting }
FAMIXVisitor >> visitImplicitVariable: anImplicitVariable [

	self visitStructuralEntity: anImplicitVariable 
]

{ #category : #visiting }
FAMIXVisitor >> visitInheritance: anInheritance [

	self visitAssociation: anInheritance 
]

{ #category : #visiting }
FAMIXVisitor >> visitInvocation: anInvocation [

	self visitAssociation: anInvocation 
]

{ #category : #visiting }
FAMIXVisitor >> visitLeafEntity: aLeafEntity [

	self visitNamedEntity: aLeafEntity 
]

{ #category : #visiting }
FAMIXVisitor >> visitLocalVariable: aLocalVariable [

	self visitStructuralEntity: aLocalVariable 
]

{ #category : #visiting }
FAMIXVisitor >> visitMethod: aMethod [

	self visitBehaviouralEntity: aMethod 
]

{ #category : #visiting }
FAMIXVisitor >> visitNamedEntity: aNamedEntity [

	self visitEntity: aNamedEntity 
]

{ #category : #visiting }
FAMIXVisitor >> visitNamespace: aNamespace [

	self visitScopingEntity: aNamespace 
]

{ #category : #visiting }
FAMIXVisitor >> visitPackage: aPackage [

	self visitScopingEntity: aPackage.
]

{ #category : #visiting }
FAMIXVisitor >> visitParameter: aParameter [

	self visitStructuralEntity: aParameter 
]

{ #category : #visiting }
FAMIXVisitor >> visitReference: aReference [

	self visitAssociation: aReference 
]

{ #category : #visiting }
FAMIXVisitor >> visitScopingEntity: aScopingEntity [

	self visitContainerEntity: aScopingEntity.
]

{ #category : #visiting }
FAMIXVisitor >> visitSourceAnchor: aSourceAnchor [
	self visitEntity: aSourceAnchor
]

{ #category : #visiting }
FAMIXVisitor >> visitStructuralEntity: aStructuralEntity [

	self visitLeafEntity: aStructuralEntity 
]

{ #category : #visiting }
FAMIXVisitor >> visitType: aType [

	self visitContainerEntity: aType.
]

{ #category : #visiting }
FAMIXVisitor >> visitUnknownVariable: anUnknownVariable [

	self visitStructuralEntity: anUnknownVariable 
]
