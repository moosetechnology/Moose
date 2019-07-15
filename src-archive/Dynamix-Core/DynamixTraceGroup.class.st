"
A DynamixTraceGroup is a group containing traces of execution

"
Class {
	#name : #DynamixTraceGroup,
	#superclass : #MooseGroup,
	#category : #'Dynamix-Core'
}

{ #category : #meta }
DynamixTraceGroup class >> annotation [
	<MSEClass: #TraceGroup super: #MooseGroup>
	<package: #Dynamix>
]

{ #category : #coverage }
DynamixTraceGroup >> classCoverage [
	"Returns percentage coverage of all feature-trace classes in the current model"

	| aCurrentClassesSize aPercentage aModelClassesSize  |
	aModelClassesSize := (self mooseModel allClasses 
				select: [:aClass | (aClass isStub not ) and: [aClass isMetaclass not]] ) size.
	aCurrentClassesSize := self getAllClasses size.
	aPercentage := ((aCurrentClassesSize / aModelClassesSize) asFloat * 100) 
				rounded.
	^aPercentage.
]

{ #category : #'all-getters' }
DynamixTraceGroup >> getAllClasses [

	"Get all classes associated with a group of TestCaseTraces and include in a set"
        |  aClassesSet|

	^self entityGroups at: #allTraceGroupClasses ifAbsentPut: [
       aClassesSet := Set new.
       self entities do: [:each | aClassesSet := (aClassesSet) union: (each uniqueClasses)].
       aClassesSet].
]

{ #category : #'all-getters' }
DynamixTraceGroup >> getAllMethods [

	"Get all methods associated with a group of TestCaseTraces and include in a set"
        | aMethodsSet|

	^self entityGroups at: #allTraceGroupMethods ifAbsentPut: [
       aMethodsSet := Set new.
       self entities do:  [:each | aMethodsSet := (aMethodsSet) union: (each uniqueMethods)].
        aMethodsSet].
]

{ #category : #coverage }
DynamixTraceGroup >> methodCoverage [
	"Returns method coverage for all feature-traces in the model"

	| aMethodsSize aCurrentMethodsSize aPercentage |
	aMethodsSize := (self mooseModel allMethods reject: [ :aMethod | aMethod isTestMethod ]) size.
	aCurrentMethodsSize := self getAllMethods size.
	aPercentage := ((aCurrentMethodsSize / aMethodsSize) asFloat * 100) rounded.
	^ aPercentage
]

{ #category : #helpers }
DynamixTraceGroup >> numberOfEvents [
	| nom |
	nom := 0.
	self entities do: [:eachTrace | nom := nom + ( eachTrace activations size) ].
	^nom.
]
