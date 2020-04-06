"
Description
--------------------

A Pharo entity source anchor is an anchor poiting to a Pharo entity to get the source code.

It uses a WeakSlot to let the entity be garbage collected in case we unload the code.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	pharoEntity:		<aClassOrCompiledMethod>		The Pharo class or compiled method holding the source code.

"
Class {
	#name : #FamixStPharoEntitySourceAnchor,
	#superclass : #FamixStSourceAnchor,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#instVars : [
		'#pharoEntity => WeakSlot'
	],
	#category : #'Famix-PharoSmalltalk-Entities-Entities'
}

{ #category : #meta }
FamixStPharoEntitySourceAnchor class >> annotation [

	<FMClass: #PharoEntitySourceAnchor super: #FamixStSourceAnchor>
	<package: #'Famix-PharoSmalltalk-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixStPharoEntitySourceAnchor >> pharoEntity [
	^ pharoEntity
]

{ #category : #accessing }
FamixStPharoEntitySourceAnchor >> pharoEntity: anObject [
	pharoEntity := anObject
]

{ #category : #accessing }
FamixStPharoEntitySourceAnchor >> sourceText [
	^ self pharoEntity ifNotNil: #definition  
]
