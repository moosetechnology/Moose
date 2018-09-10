"
FAMIXParameterizedType represents a type with arguments. So, it is an instantiation for the use of FAMIXParameterizableClass. It can appear as a type of an attribute, a type of a local variable, a parameter of a method, a return of a method, etc.
Example:

...
public Map<String,Collection> anAttribute;
...

Where Map<String,Collection> is the FAMIXParameterizedType of anAttribute. String and Collection are arguments. Map is the parameterizableClass.
"
Trait {
	#name : #FamixTParameterizedType,
	#instVars : [
		'#parameterizableClass => FMOne type: #FamixTWithParameterizedTypes opposite: #parameterizedTypes'
	],
	#category : #'Famix-Traits-ParameterizedType'
}

{ #category : #meta }
FamixTParameterizedType classSide >> annotation [

	<MSEClass: #TParameterizedType super: #Trait>
	<generated>
	<package: #'Famix-Traits'>
	^self
]

{ #category : #generator }
FamixTParameterizedType classSide >> generatedSlotNames [
	<generated>
	'FamixTParameterizedType class>>#generatedSlotNames'.
	^ #(parameterizableClass)
]

{ #category : #generator }
FamixTParameterizedType classSide >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #accessing }
FamixTParameterizedType >> parameterizableClass [

	<generated>
	<MSEComment: 'Base type of this parameterized type.'>
	^ parameterizableClass
]

{ #category : #accessing }
FamixTParameterizedType >> parameterizableClass: anObject [

	parameterizableClass := anObject.
	self resetMooseName.
	

]
