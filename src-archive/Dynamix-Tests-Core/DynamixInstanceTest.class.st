Class {
	#name : #DynamixInstanceTest,
	#superclass : #TestCase,
	#category : #'Dynamix-Tests-Core'
}

{ #category : #tests }
DynamixInstanceTest >> testInstanceType [
	| instance1 instance2 type |
	instance1 := DynamixInstance new.
	instance2 := DynamixInstance new.
	type := FamixType new.
	type instances: {instance1}.
	type instances add: instance2.
	self assert: instance1 type = type.
	self assert: instance2 type = type.
	self assert: type instances size = 2.
	self assert: type instances first = instance1.
	self assert: type instances last = instance2	
]

{ #category : #tests }
DynamixInstanceTest >> testTypeInstance [
	| instance1 instance2 type |
	instance1 := DynamixInstance new.
	instance2 := DynamixInstance new.
	type := FamixType new.
	instance1 type: type.
	instance2 type: type.
	self assert: type instances size = 2.
	self assert: type instances first = instance1.
	self assert: type instances last = instance2	
]
