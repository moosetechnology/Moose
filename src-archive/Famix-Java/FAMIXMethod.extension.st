Extension { #name : #FAMIXMethod }

{ #category : #'*Famix-Java' }
FAMIXMethod >> caughtExceptions [
	<MSEProperty: #caughtExceptions type: #FAMIXCaughtException opposite: #definingMethod> <multivalued> <derived>
	<MSEComment: 'The exceptions caught by the method'>
	<package: #Java>
	^ self privateState attributeAt: #caughtExceptions
							ifAbsentPut: [FMMultivalueLink on: self opposite: #definingMethod:]
]

{ #category : #'*Famix-Java' }
FAMIXMethod >> declaredExceptions [
	<MSEProperty: #declaredExceptions type: #FAMIXDeclaredException opposite: #definingMethod> <multivalued> <derived>
	<MSEComment: 'The exceptions declared by the method'>
	<package: #Java>
	^ self privateState attributeAt: #declaredExceptions
							ifAbsentPut: [FMMultivalueLink on: self opposite: #definingMethod:]
]

{ #category : #'*Famix-Java' }
FAMIXMethod >> hasInnerClassImplementingMethods [
	^ self innerClassesImplementingMethods isNotEmpty
]

{ #category : #'*Famix-Java' }
FAMIXMethod >> implementMethod [
	^ self belongsTo implementedInterfaces
		collect: [ :each | each implementationOf: self signature ]
]

{ #category : #'*Famix-Java' }
FAMIXMethod >> innerClassesImplementingMethods [
	^ self types select: [ :el | el methods anySatisfy: [ :m | m isStub not ] ]
]

{ #category : #'*Famix-Java' }
FAMIXMethod >> isImplementing [
	<MSEProperty: #isImplementing type: #Boolean>
	<derived>
	<MSEComment: 'The method is implementing a method defined in an interface'>
	^ self belongsTo directSuperclasses
		anySatisfy: [ :each | each isInterface and: [ each understands: self signature ] ]
]

{ #category : #'*Famix-Java' }
FAMIXMethod >> isJUnit4Test [
	<MSEProperty: #isJUnit4Test type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self isAnnotatedWith: 'Test'
]

{ #category : #'*Famix-Java' }
FAMIXMethod >> thrownExceptions [
	<MSEProperty: #thrownExceptions type: #FAMIXThrownException opposite: #definingMethod> <multivalued> <derived>
	<MSEComment: 'The exceptions thrown by the method'>
	<package: #Java>
	^ self privateState attributeAt: #thrownExceptions
							ifAbsentPut: [FMMultivalueLink on: self opposite: #definingMethod:]
]
