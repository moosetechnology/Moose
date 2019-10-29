"
FAMIXClass represents an entity which can build new instances. A FAMIXClass is a FAMIXType, therefore it is involved in super/sub types relationships (depending on the language) and it holds attributes, methods.

FAMIX does not model explicitly interfaces, but a FAMIXClass can represent a Java interface by setting the isInterface property.

A class is typically scoped in a namespace. To model nested or anonymous classes, extractors can set the container of classes to classes or methods, respectively.
"
Trait {
	#name : #FamixTClass,
	#traits : 'FamixTNamed - {#mooseNameOn:} + FamixTWithMethods + FamixTWithInheritances + FamixTWithAttributes + FamixTType + FamixTPackageable + FamixTInvocationsReceiver + FamixTWithComments',
	#classTraits : 'FamixTNamed classTrait + FamixTWithMethods classTrait + FamixTWithInheritances classTrait + FamixTWithAttributes classTrait + FamixTType classTrait + FamixTPackageable classTrait + FamixTInvocationsReceiver classTrait + FamixTWithComments classTrait',
	#category : #'Famix-Traits-Class'
}

{ #category : #meta }
FamixTClass classSide >> annotation [

	<FMClass: #TClass super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #groups }
FamixTClass classSide >> famixTClassRelatedGroup [

	<mooseGroup>
	
	^ FAMIXClassGroup
]

{ #category : #testing }
FamixTClass >> isClass [

	<generated>
	^ true
]

{ #category : #testing }
FamixTClass >> isTestCase [

	<FMProperty: #isTestCase type: #Boolean>
	<FMComment: 'True if the method is considered as a test'>
	<derived>

	^ self privateState attributeAt: #isTestCase ifAbsent: [ false ]
]

{ #category : #testing }
FamixTClass >> isTestCase: aBoolean [
	^ self privateState attributeAt: #isTestCase put: true
]

{ #category : #metrics }
FamixTClass >> weightOfAClass [
	<FMProperty: #weightOfAClass type: #Number>
	<derived>
	<FMComment: 'Weight of a class'>	
			
	^self
		lookUpPropertyNamed: #weightOfAClass
		computedAs: [self notExistentMetricValue]
]

{ #category : #metrics }
FamixTClass >> weightOfAClass: aNumber [

	self privateState propertyAt: #weightOfAClass put: aNumber
]
