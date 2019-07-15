Class {
	#name : #RPGHero,
	#superclass : #Object,
	#instVars : [
		'twin',
		'talisman',
		'kills'
	],
	#category : #'Fame-Example'
}

{ #category : #meta }
RPGHero class >> annotation [
	<MSEClass: #Hero super: #Object>
	<package: #RPG>
]

{ #category : #initialization }
RPGHero >> initialize [
	super initialize.
	twin := nil.
	talisman := nil.
	kills := FMMultiMultivalueLink on: self opposite: #killedBy.
]

{ #category : #accessing }
RPGHero >> kills [
	<MSEProperty: #kills type: #RPGDragon opposite: #killedBy> <multivalued>
	^kills
]

{ #category : #accessing }
RPGHero >> kills: aDragon [
	kills value: aDragon
]

{ #category : #accessing }
RPGHero >> talisman [
	<MSEProperty: #talisman type: #RPGTreasure opposite: #owner>
	^talisman
]

{ #category : #accessing }
RPGHero >> talisman: aTreasure [
	talisman ~= aTreasure ifTrue: [ | old |
		old := talisman.
		talisman := aTreasure.
		old notNil ifTrue: [ old owner: nil ].
		aTreasure notNil ifTrue: [ aTreasure owner: self ]]
]

{ #category : #accessing }
RPGHero >> twin [
	<moot: #'4chan'>
	<MSEProperty: #twin type: #RPGHero opposite: #twin>
	^twin
]

{ #category : #accessing }
RPGHero >> twin: aHero [
	twin ~= aHero ifTrue: [ | old |
		old := twin.
		twin := aHero.
		old notNil ifTrue: [ old twin: nil ].
		aHero notNil ifTrue: [ aHero twin: self ]]
]
