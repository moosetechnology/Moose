"
I am a platform independent package representation. I know my name, description, my dependencies, the license and the repository URL. Packages are declared by creating a class side extension method that answers a configured package instance. The expression

    GRPackage packages

answers the collection of the complete package graph.
"
Class {
	#name : #GRPackage,
	#superclass : #GRObject,
	#instVars : [
		'name',
		'description',
		'dependencies',
		'license',
		'url'
	],
	#category : #'Grease-Core'
}

{ #category : #querying }
GRPackage class >> grPackages [
	"Answer a list of all registered packages. A package is registered by adding a class extension to the receiving class answering an instance of the receiving class."

	| packages package |
	packages := Dictionary new.
	self class selectors do: [ :each |
		(each numArgs = 0 and: [ each ~= #grPackages ]) ifTrue: [ 
			package := self perform: each.
			packages at: package name put: package ] ].
	packages do: [ :each | each resolveWith: packages ].
	^ packages values
]

{ #category : #accessing }
GRPackage class >> greaseCore [
	^ self new
		name: 'Grease-Core';
		description: 'The main package of the Grease compatibility layer.';
		url: #greaseUrl;
		yourself
]

{ #category : #private }
GRPackage >> addDependenciesTo: aCollection [
	(aCollection includes: self) ifFalse: [
		self dependencies
			do: [ :each | each addDependenciesTo: aCollection ].
		aCollection add: self ].
	^ aCollection
]

{ #category : #dependencies }
GRPackage >> addDependency: aString [
	dependencies add: aString
]

{ #category : #dependencies }
GRPackage >> allDependencies [
	"Answer all dependencies on which this package depends."

	^ self addDependenciesTo: OrderedCollection new
]

{ #category : #dependencies }
GRPackage >> dependencies [
	"Return a collection of package names on which this package depends."

	^ dependencies
]

{ #category : #accessing }
GRPackage >> description [
	"Answer a short description of the package."

	^ description
]

{ #category : #accessing }
GRPackage >> description: aString [
	description := aString
]

{ #category : #'accessing-repositories' }
GRPackage >> greaseUrl [
	^ 'http://smalltalkhub.com/mc/Seaside/Grease11/main'
]

{ #category : #initialization }
GRPackage >> initialize [
	super initialize.
	dependencies := OrderedCollection new.
	license := #MIT
]

{ #category : #testing }
GRPackage >> isLGPL [
	^ self license = #LGPL
]

{ #category : #testing }
GRPackage >> isMIT [
	^ self license = #MIT
]

{ #category : #accessing }
GRPackage >> license [
	"Answer the current license of this package, by default MIT is used."

	^ license
]

{ #category : #accessing }
GRPackage >> license: aSymbol [
	license := aSymbol
]

{ #category : #accessing }
GRPackage >> name [
	"Answer the name of the package. This string should be useable to identify the platform specific native package object, e.g. the Monticello package name."

	^ name
]

{ #category : #accessing }
GRPackage >> name: aString [
	name := aString
]

{ #category : #printing }
GRPackage >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(; nextPutAll: self name; nextPut: $)
]

{ #category : #dependencies }
GRPackage >> resolveWith: aDictionary [
	dependencies := dependencies 
		collect: [ :each |
			aDictionary at: each ifAbsent: [
				"if Foo-Pharo-Bar fails try Foo-Pharo20-Bar and Foo-Pharo30-Bar"
				(each indexOfSubCollection: '-Pharo-' startingAt: 1) ~= 0 ifTrue: [ 
					"try -Pharo20-"
					aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo20-') ifAbsent: [
						"try -Pharo30-"
						aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo30-') ifAbsent: [
							"try -Pharo40-"
							aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo40-') ifAbsent: [
								"try -Pharo50-"
								aDictionary at: (each copyReplaceAll: '-Pharo-' with: '-Pharo50-') ifAbsent: [
									self error: self name printString , ' depends on unknown package ' , each printString ] ] ] ] ] ] ]
]

{ #category : #'accessing-repositories' }
GRPackage >> seasideAddonsUrl [
	^ 'http://smalltalkhub.com/mc/Seaside/Seaside30Addons/main'
]

{ #category : #'accessing-repositories' }
GRPackage >> seasideLGPLUrl [
	^ 'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main'
]

{ #category : #'accessing-repositories' }
GRPackage >> seasideUrl [
	^ 'http://smalltalkhub.com/mc/Seaside/Seaside31/main'
]

{ #category : #accessing }
GRPackage >> url [
	"Answer the base-URL of the package. This string is only meaningful for platforms that can directly access Monticello repositories."

	^ url isSymbol
		ifTrue: [ self perform: url ]
		ifFalse: [ url ]
]

{ #category : #accessing }
GRPackage >> url: aStringOrSymbol [
	"Set the base-URL of the package, or a symbol referring to a method in this class that answers the URL. This setting is only meaningful for platforms that can directly access Monticello repositories."

	url := aStringOrSymbol
]
