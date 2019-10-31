"
This is the abstract representation of an Exception. It is specific to Java. It points to an exceptionClass. The class of a FAMIXException is a normal FAMIXClass.
"
Trait {
	#name : #FamixTException,
	#instVars : [
		'#exceptionClass => FMOne type: #FamixTWithExceptions opposite: #exceptions'
	],
	#category : #'Famix-Traits-Exception'
}

{ #category : #meta }
FamixTException classSide >> annotation [

	<FMClass: #TException super: #Object>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #accessing }
FamixTException >> exceptionClass [
	"Relation named: #exceptionClass type: #FamixTWithExceptions opposite: #exceptions"

	<generated>
	<FMComment: 'Class to which the exception points. It is specific to Java'>
	^ exceptionClass
]

{ #category : #accessing }
FamixTException >> exceptionClass: anObject [

	<generated>
	exceptionClass := anObject
]
