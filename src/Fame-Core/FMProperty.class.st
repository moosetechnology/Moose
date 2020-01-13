"
Description
--------------------

I am a simple slot unique to Fame.

For now, I do nothing specific except annotationg the variable with the fact that the variable is a Fame property.

Examples
--------------------

	Trait named: #FamixTMethod
	 	slots: { #isAbstract => FMProperty. #isClassSide => FMProperty. #kind => FMProperty }
		package: 'Famix-Traits-Method'
"
Class {
	#name : #FMProperty,
	#superclass : #InstanceVariableSlot,
	#category : #'Fame-Core-Utilities'
}

{ #category : #testing }
FMProperty >> isFameSlot [
	^ true
]
