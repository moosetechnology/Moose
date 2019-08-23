"
A FAMIXReference entity is created whenever one manipulates a class name as a variable. For example:
(i) if the class is passed as a parameter to a method, or
(ii) if a static method is invoked on a class.

For example, in the following Java code
method a()
{B bObject = new B();  B.aStaticMethod(); }
There is only one reference which is created when the static method aStaticMethod is invoked on class variable B. In the declaration of B objects, the class B is the type of variable b but not a FAMIXReference. And instantiation new B() is an invocation of the default constructor, and not a FAMIXReference.


Note that FAMIXReference was defined between two FAMIXContainerEntity entities. So, it used to represent dependencies between container entities that are computed from the dependencies of contained entities. For example, references between two packages can be computed from dependencies between classes of the packages.
"
Trait {
	#name : #FamixTReference,
	#instVars : [
		'#source => FMOne type: #FamixTWithReferences opposite: #outgoingReferences',
		'#target => FMOne type: #FamixTReferenceable opposite: #incomingReferences'
	],
	#category : #'Famix-Traits-Reference'
}

{ #category : #meta }
FamixTReference classSide >> annotation [

	<MSEClass: #TReference super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'instance creation' }
FamixTReference classSide >> source: source target: target [
	^ self new source: source; target: target
]

{ #category : #accessing }
FamixTReference >> from [
	^ self source. 
]

{ #category : #accessing }
FamixTReference >> from: aSource [
	self source: aSource. 
]

{ #category : #testing }
FamixTReference >> isReference [

	<generated>
	^ true
]

{ #category : #accessing }
FamixTReference >> source [
	"Relation named: #source type: #FamixTWithReferences opposite: #outgoingReferences"

	<generated>
	<MSEComment: 'Source entity making the reference. from-side of the association'>
	<source>
	^ source
]

{ #category : #accessing }
FamixTReference >> source: anObject [

	<generated>
	source := anObject

]

{ #category : #accessing }
FamixTReference >> target [
	"Relation named: #target type: #FamixTReferenceable opposite: #incomingReferences"

	<generated>
	<MSEComment: 'Target entity referenced. to-side of the association'>
	<target>
	^ target
]

{ #category : #accessing }
FamixTReference >> target: anObject [

	<generated>
	target := anObject

]

{ #category : #accessing }
FamixTReference >> to [
	^ self target
]

{ #category : #accessing }
FamixTReference >> to: aTarget [
	self target: aTarget
]
