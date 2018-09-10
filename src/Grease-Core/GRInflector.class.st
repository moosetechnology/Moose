"
The Inflector transforms words from singular to plural.
"
Class {
	#name : #GRInflector,
	#superclass : #GRObject,
	#classVars : [
		'InflectionRules',
		'Uninflected'
	],
	#category : #'Grease-Core-Text'
}

{ #category : #initialization }
GRInflector class >> initialize [
	Uninflected := #('bison' 'bream' 'breeches' 'britches' 'carp' 'chassis' 'clippers' 'cod' 'contretemps' 'corps' 'debris' 'deer' 'diabetes' 'djinn' 'eland' 'elk' 'equipment' 'fish' 'flounder' 'gallows' 'graffiti' 'headquarters' 'herpes' 'high-jinks' 'homework' 'information' 'innings' 'ities' 'itis' 'jackanapes' 'mackerel' 'measles' 'mews' 'money' 'mumps' 'news' 'ois' 'pincers' 'pliers' 'pox' 'proceedings' 'rabies' 'rice' 'salmon' 'scissors' 'sea-bass' 'series' 'shears' 'sheep' 'species' 'swine' 'trout' 'tuna' 'whiting' 'wildebeest').
	InflectionRules := #(('man' 'en' 2) ('child' 'ren' 0) ('cow' 'kine' 3) ('penis' 'es' 0) ('sex' 'es' 0) ('person' 'ople' 4) ('octopus' 'es' 0) ('quiz' 'zes' 0) ('ox' 'en' 0) ('louse' 'ice' 4) ('mouse' 'ice' 4) ('matrix' 'ices' 2) ('vertix' 'ices' 2) ('vertex' 'ices' 2) ('indix' 'ices' 2) ('index' 'ices' 2) ('x' 'es' 0) ('ch' 'es' 0) ('ss' 'es' 0) ('sh' 'es' 0) ('ay' 's' 0) ('ey' 's' 0) ('iy' 's' 0) ('oy' 's' 0) ('uy' 's' 0) ('y' 'ies' 1) ('alf' 'ves' 1) ('elf' 'ves' 1) ('olf' 'ves' 1) ('arf' 'ves' 1) ('nife' 'ves' 2) ('life' 'ves' 2) ('wife' 'ves' 2) ('sis' 'es' 2) ('tum' 'a' 2) ('ium' 'a' 2) ('buffalo' 'es' 0) ('tomato' 'es' 0) ('buffalo' 'es' 0) ('bus' 'es' 0) ('alias' 'es' 0) ('status' 'es' 0) ('octopus' 'i' 2) ('virus' 'i' 2) ('axis' 'es' 2) ('s' '' 0))
]

{ #category : #accessing }
GRInflector class >> pluralize: aString [
	| string |
	string := aString asLowercase.
	Uninflected do: [ :each |
		(string endsWithSubCollection: each)
			ifTrue: [ ^ aString ] ].
	InflectionRules do: [ :rule |
		(string endsWithSubCollection: rule first)
			ifTrue: [ ^ (aString allButLast: rule third) , rule second ] ].
	^ aString , 's'
]
