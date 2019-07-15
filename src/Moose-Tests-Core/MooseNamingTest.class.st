Class {
	#name : #MooseNamingTest,
	#superclass : #TestCase,
	#category : #'Moose-Tests-Core'
}

{ #category : #testing }
MooseNamingTest >> testMooseNameOfClassVariable [
	self assert: TheRoot @ #TheSharedVariable equals: #'Smalltalk::TheRoot.TheSharedVariable'.	"contrary to compiled method notation we do not garanty that the class has an iv"	"we could! Now do we want? We could also have @@ for class variables."	"now the name of shared variable is always its class and not its metaclass"
	self assert: TheRoot class @ #TheSharedVariable equals: #'Smalltalk::TheRoot.TheSharedVariable'
]

{ #category : #testing }
MooseNamingTest >> testMooseNameOfCompiledMethod [
	self
		assert: (TheRoot class >> #accessInstanceVariable) mooseName
		equals: #'Smalltalk::TheRoot_class.accessInstanceVariable()'.
	self assert: (TheRoot >> #accessingClass) mooseName equals: #'Smalltalk::TheRoot.accessingClass()'.	"May be we could fix that too. using another notation so that we could use the notation create method
	name too"
	self should: [ (TheRoot >> #zork) mooseName ] raise: Error
]

{ #category : #testing }
MooseNamingTest >> testMooseNameOfInstanceVariable [
	self assert: TheRoot @ #x equals: #'Smalltalk::TheRoot.x'.	"contrary to compiled method notation we do not garanty that the class has an iv"	"we could! Now do we want"
	self assert: TheRoot @ #foo equals: #'Smalltalk::TheRoot.foo'.
	self assert: TheRoot class @ #mx equals: #'Smalltalk::TheRoot_class.mx'
]
