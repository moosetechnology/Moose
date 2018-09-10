Extension { #name : #FAMIXType }

{ #category : #'*Famix-Java' }
FAMIXType >> argumentsInParameterizedTypes [
	<MSEProperty: #argumentsInParameterizedTypes type: #FAMIXParameterizedType opposite: #arguments>
	<multivalued> <derived>
	<MSEComment: 'Arguments of parameterized types that point to this type.'>
	
	^ self privateState 
		attributeAt: #argumentsInParameterizedTypes 
		ifAbsentPut: [
			FMMultiMultivalueLink on: self opposite: #arguments ]
]

{ #category : #'*Famix-Java' }
FAMIXType >> argumentsInParameterizedTypes: aCollection [
	^ self argumentsInParameterizedTypes value: aCollection
]

{ #category : #'*Famix-Java' }
FAMIXType >> implementedInterfaces [

	^ self directSuperclasses select: #isInterface
]

{ #category : #'*Famix-Java' }
FAMIXType >> isAnonymousClass [
	^  self container notNil and: [
			self container isMethod or: [
				self name isAllDigits or: [
					'*_anonymous_*' match: self name ]] ]
]

{ #category : #'*Famix-Java' }
FAMIXType >> isInnerClass [
	<MSEProperty: #isInnerClass type: #Boolean>
	<derived>
	<MSEComment:
		'True if the method is considered as an innerclass (i.e. is contained elsewhere than a java package: class, method, enum,...)'>
	^ self container ifNotNil: [ :c | c isNamespace not ] ifNil: [ false ]
]

{ #category : #'*Famix-Java' }
FAMIXType >> isJUnit3TestCase [
	^ self superclassHierarchy anySatisfy: [:each | each mooseName =  #'junit::framework::TestCase']
]

{ #category : #'*Famix-Java' }
FAMIXType >> isJUnit4TestCase [
	<MSEProperty: #isJUnit4TestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Junit 4 Java test'>
	^ self methods anySatisfy: [ :m | m isJUnit4Test ]
]

{ #category : #'*Famix-Java' }
FAMIXType >> isParameterType [
	^ false
]

{ #category : #'*Famix-Java' }
FAMIXType >> isParameterizedType [
	^ false
]

{ #category : #'*Famix-Java' }
FAMIXType >> isTestCase [
	<MSEProperty: #isTestCase type: #Boolean>
	<derived>
	<MSEComment: 'True if the method is considered as a Java test'>
	^ self isJUnit3TestCase or: [ self isJUnit4TestCase ] 
]
