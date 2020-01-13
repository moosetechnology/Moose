Class {
	#name : #FMModelBuilderTest,
	#superclass : #TestCase,
	#category : #'Fame-Tests'
}

{ #category : #tests }
FMModelBuilderTest >> testDocument [
	| client m s |
	client := FMMSEPrinter onString.
	m := FMModelScripter client: client.
	m document: [  ].
	s := client stream contents.
	self assert: s equals: '()'
]

{ #category : #tests }
FMModelBuilderTest >> testPerson [
	| client m s |
	client := FMMSEPrinter onString.
	m := FMModelScripter client: client.
	m document: [ m new: #Person with: [ m a: #name of: 'John Doe' ] ].
	s := client stream contents.
	self
		assert: s
		equals:
			'(
	(Person
		(name ''John Doe'')))'
]

{ #category : #tests }
FMModelBuilderTest >> testPersonWithDog [
	| client m s |
	client := FMMSEPrinter onString.
	m := FMModelScripter client: client.
	m
		document: [ m
				new: #Person
				with: [ m a: #name of: 'John Doe'.
					m
						a: #dog
						of: [ m
								new: #Dog
								with: [ m a: #color of: 'brown'.
									m an: #age of: 5 ] ] ] ].
	s := client stream contents.
	self
		assert: s
		equals:
			'(
	(Person
		(name ''John Doe'')
		(dog
			(Dog
				(color ''brown'')
				(age 5)))))'
]

{ #category : #tests }
FMModelBuilderTest >> testPersonWithDogUsingIdReferences [
	| client m s |
	client := FMMSEPrinter onString.
	m := FMModelScripter client: client.
	m
		document: [ m
				new: #Person
				with: [ m a: #name of: 'John Doe'.
					m a: #dog of: [ m ref: 42 ] ].
			m
				new: #Dog
				with: [ m id: 42.
					m a: #color of: 'brown'.
					m an: #age of: 5 ] ].
	s := client stream contents.
	self
		assert: s
		equals:
			'(
	(Person
		(name ''John Doe'')
		(dog (ref: 42)))
	(Dog (id: 42)
		(color ''brown'')
		(age 5)))'
]

{ #category : #tests }
FMModelBuilderTest >> testPersonWithNicknames [
	| client m s |
	client := FMMSEPrinter onString.
	m := FMModelScripter client: client.
	m
		document: [ m
				new: #Person
				with: [ m a: #name of: 'John Doe'.
					m a: #nick of: #('Joe' 'hack3r' 'dowey') ] ].
	s := client stream contents.
	self
		assert: s
		equals:
			'(
	(Person
		(name ''John Doe'')
		(nick ''Joe'' ''hack3r'' ''dowey'')))'
]
