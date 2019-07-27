Trait {
	#name : #FamixTLCOMMetrics,
	#category : #'Famix-Traits-Support'
}

{ #category : #meta }
FamixTLCOMMetrics classSide >> annotation [

	<MSEClass: #TLCOMMetrics super: #Trait>
	<package: #'Famix-Traits'>
	<generated>
	^self
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixTLCOMMetrics >> calculateLCOM2 [
	
	"Definitions used for LCOM2 and LCOM3 m	number of procedures (methods) in class
	m	         number of procedures (methods) in class
	a             number of variables (attributes) in class
	mA	         number of methods that access a variable (attribute)
	sum(mA)  sum of mA over attributes of a class
	LCOM2 = 1 - sum(mA)/(m*a)
	LCOM3 = (m - sum(mA)/a) / (m-1)"

	| m a sumMa |
	
	m := self methodsWithoutSutbsAndConstructors size.
	a := self numberOfAttributes.
	sumMa := self accessedAttributes size.
	
	"If the number of methods or attributes is zero, 
	LCOM2 is undefined and displayed as zero"
	((m = 0) or: [ a = 0 ])
		ifTrue: [^ 0].
	
	^ (1 - (sumMa / (m*a)))
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixTLCOMMetrics >> calculateLCOM3 [
	
	"Definitions used for LCOM2 and LCOM3 m	number of procedures (methods) in class
	m	         number of procedures (methods) in class
	a             number of variables (attributes) in class
	mA	         number of methods that access a variable (attribute)
	sum(mA)  sum of mA over attributes of a class
	LCOM2 = 1 - sum(mA)/(m*a)
	LCOM3 = (m - sum(mA)/a) / (m-1)"

	| m a sumMa |
	
	m := self methodsWithoutSutbsAndConstructors size.
	a := self numberOfAttributes.
	sumMa := self accessedAttributes size.
	
	"If there are no more than one method in a class, LCOM3 is undefined. 
	 If there are no variables in a class, LCOM3 is undefined. 
	An undefined LCOM3 is displayed as zero."
	((m <= 1) or: [ a = 0 ])
		ifTrue: [ ^ 0].
	
	^ (m - (sumMa/a)) / (m-1)
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixTLCOMMetrics >> lcom2 [

	<MSEProperty: #lcom2 type: #Number>
	<MSEComment: 'lack of cohesion in methods 2 (lcom2)'>
	<derived>

	^ self
		lookUpPropertyNamed: #lcom2
		computedAs: [self calculateLCOM2]
]

{ #category : #'Famix-Extensions-metrics-support' }
FamixTLCOMMetrics >> lcom3 [

	<MSEProperty: #lcom3 type: #Number>
	<MSEComment: 'lack of cohesion in methods 3 (lcom3)'>
	<derived>

	^ self
		lookUpPropertyNamed: #lcom3
		computedAs: [self calculateLCOM3]
]
