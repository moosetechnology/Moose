Class {
	#name : #RPGDragon,
	#superclass : #Object,
	#instVars : [
		'hoard',
		'killedBy'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
RPGDragon class >> annotation [
	<FMClass: #Dragon super: #Object>
	<package: #RPG>
]

{ #category : #accessing }
RPGDragon >> hoard [
	<FMProperty: #hoard type: #RPGTreasure opposite: #keeper>
	<multivalued>
	^ hoard
]

{ #category : #accessing }
RPGDragon >> hoard: aTreasure [
	hoard value: aTreasure
]

{ #category : #initialization }
RPGDragon >> initialize [
	super initialize.
	hoard := FMMultivalueLink on: self opposite: #keeper:.
	killedBy := FMMultiMultivalueLink on: self opposite: #kills.
]

{ #category : #accessing }
RPGDragon >> killedBy [
	<FMProperty: #killedBy type: #RPGHero opposite: #kills>
	<multivalued>
	^ killedBy
]

{ #category : #accessing }
RPGDragon >> killedBy: aHero [
	killedBy value: aHero
]
