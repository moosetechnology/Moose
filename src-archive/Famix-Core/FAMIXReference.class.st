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
Class {
	#name : #FAMIXReference,
	#superclass : #FAMIXAssociation,
	#instVars : [
		'source',
		'target'
	],
	#category : #'Famix-Core'
}

{ #category : #meta }
FAMIXReference class >> annotation [
	<MSEClass: #Reference super: #FAMIXAssociation>
	<package: #FAMIX>
]

{ #category : #'initialize-release' }
FAMIXReference class >> source: source target: target [
	^ self new source: source; target: target
]

{ #category : #accessing }
FAMIXReference >> from [
	^ self source. 
]

{ #category : #accessing }
FAMIXReference >> from: aSource [
	self source: aSource . 
]

{ #category : #accessing }
FAMIXReference >> source [
	<MSEProperty: #source type: #FAMIXBehaviouralEntity opposite: #outgoingReferences>
	<MSEComment: 'Source entity making the reference. from-side of the association'>
	<source>
	^source
]

{ #category : #accessing }
FAMIXReference >> source: aContainerEntity [
	source := FMMultivalueLink on: self
					update: #outgoingReferences
					from: self source
					to: aContainerEntity
]

{ #category : #accessing }
FAMIXReference >> target [
	<MSEProperty: #target type: #FAMIXType opposite: #incomingReferences>
	<MSEComment: 'Target entity referenced. to-side of the association'>
	<target>
	^target
]

{ #category : #accessing }
FAMIXReference >> target: aContainerEntity [
	target := FMMultivalueLink on: self
					update: #incomingReferences
					from: self target
					to: aContainerEntity
]

{ #category : #accessing }
FAMIXReference >> to [
	^ self target
]

{ #category : #accessing }
FAMIXReference >> to: aTarget [
	self target: aTarget
]
