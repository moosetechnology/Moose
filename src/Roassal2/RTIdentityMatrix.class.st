Class {
	#name : #RTIdentityMatrix,
	#superclass : #RTObject,
	#instVars : [
		'rows'
	],
	#category : #'Roassal2-Layouts'
}

{ #category : #accessing }
RTIdentityMatrix >> at: u [
	
	| row |
	row := rows
		at: u
		ifAbsentPut: [IdentityDictionary new].
	^row keys
]

{ #category : #accessing }
RTIdentityMatrix >> at: u at: v [
	
	| row |
	row := rows
		at: u
		ifAbsentPut: [IdentityDictionary new].
	^row
		at: v
		ifAbsent: [false]
]

{ #category : #accessing }
RTIdentityMatrix >> at: u at: v put: aBoolean [
	
	| row |
	"u -> v"
	row := rows
		at: u
		ifAbsentPut: [IdentityDictionary new].
	row at: v put: aBoolean.	"v -> u"
	row := rows
		at: v
		ifAbsentPut: [IdentityDictionary new].
	row at: u put: aBoolean
]

{ #category : #'initialize-release' }
RTIdentityMatrix >> initialize [
	
	rows := IdentityDictionary new
]
