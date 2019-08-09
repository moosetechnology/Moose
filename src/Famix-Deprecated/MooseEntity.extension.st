Extension { #name : #MooseEntity }

{ #category : #'*Famix-Deprecated' }
MooseEntity >> clientMethods [
	self deprecated: 'Use #allClientsAtScope: instead.' transformWith: '`@receiver clientMethods' -> '`@receiver allClientsAtScope: FamixTMethod'.
	^ self allClientsAtScope: FamixTMethod
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> clientNamespaces [
	self deprecated: 'Use #allClientsAtScope: instead.' transformWith: '`@receiver clientNamespaces' -> '`@receiver allClientsAtScope: FamixTNamespace'.
	^ self allClientsAtScope: FamixTNamespace
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> clientPackages [
	self deprecated: 'Use #allClientsAtScope: instead.' transformWith: '`@receiver clientPackages' -> '`@receiver allClientsAtScope: FamixTPackage'.
	^ self allClientsAtScope: FamixTPackage
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> clientTypes [
	self deprecated: 'Use #allClientsAtScope: instead.' transformWith: '`@receiver clientTypes' -> '`@receiver allClientsAtScope: FamixTType'.
	^ self allClientsAtScope: FamixTType
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> methodScope [
	self
		deprecated:
			'methodScope does not have a coherent behavior and should be replaced with a query. The query will depend on your needs. It can either be:
	- `self allAtScope: FamixTMethod` if you want a collection of all the methods up in the containment tree of your entity
	- `self allToScope: FamixTMethod` if you want a collection of all the methods down in the containment tree of your entity
	- `self allWithScope: FamixTMethod` if you want a collection of all the methods up and down in the containment tree of your entity
	- `self atScope: FamixTMethod` if you want a collection of the first encountered methods up in the containment tree of your entity
	- `self toScope: FamixTMethod` if you want a collection of the first encountered methods down in the containment tree of your entity
	- `self withScope: FamixTMethod` if you want a collection of the first encountered methods up and down in the containment tree of your entity
	
	In case you know there is only one type (for example in java a #atScope: on a structural entity), you can call #anyOne on the result of the query.'.
	"This implementation seems to be the most common"
	^ (self toScope: FamixTMethod) anyOne
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> namespaceScope [
	self
		deprecated:
			'namespaceScope does not have a coherent behavior and should be replaced with a query. The query will depend on your needs. It can either be:
	- `self allAtScope: FamixTNamespace` if you want a collection of all the namespaces up in the containment tree of your entity
	- `self allToScope: FamixTNamespace` if you want a collection of all the namespaces down in the containment tree of your entity
	- `self allWithScope: FamixTNamespace` if you want a collection of all the namespaces up and down in the containment tree of your entity
	- `self atScope: FamixTNamespace` if you want a collection of the first encountered namespaces up in the containment tree of your entity
	- `self toScope: FamixTNamespace` if you want a collection of the first encountered namespaces down in the containment tree of your entity
	- `self withScope: FamixTNamespace` if you want a collection of the first encountered namespaces up and down in the containment tree of your entity
	
	In case you know there is only one type (for example in java a #atScope: on a structural entity), you can call #anyOne on the result of the query.'.
	"This implementation seems to be the most common"
	^ (self atScope: FamixTNamespace) anyOne
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> packageScope [
	self
		deprecated:
			'packageScope does not have a coherent behavior and should be replaced with a query. The query will depend on your needs. It can either be:
	- `self allAtScope: FamixTPackage` if you want a collection of all the packages up in the containment tree of your entity
	- `self allToScope: FamixTPackage` if you want a collection of all the packages down in the containment tree of your entity
	- `self allWithScope: FamixTPackage` if you want a collection of all the packages up and down in the containment tree of your entity
	- `self atScope: FamixTPackage` if you want a collection of the first encountered packages up in the containment tree of your entity
	- `self toScope: FamixTPackage` if you want a collection of the first encountered packages down in the containment tree of your entity
	- `self withScope: FamixTPackage` if you want a collection of the first encountered packages up and down in the containment tree of your entity
	
	In case you know there is only one type (for example in java a #atScope: on a structural entity), you can call #anyOne on the result of the query.'.
	"This implementation seems to be the most common"
	^ (self atScope: FamixTPackage) anyOne
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> providerMethods [
	self deprecated: 'Use #allProvidersAtScope: instead.' transformWith: '`@receiver providerMethods' -> '`@receiver allProvidersAtScope: FamixTMethod'.
	^ self allProvidersAtScope: FamixTMethod
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> providerNamespaces [
	self deprecated: 'Use #allProvidersAtScope: instead.' transformWith: '`@receiver providerNamespaces' -> '`@receiver allProvidersAtScope: FamixTNamespace'.
	^ self allProvidersAtScope: FamixTNamespace
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> providerPackages [
	self deprecated: 'Use #allProvidersAtScope: instead.' transformWith: '`@receiver providerPackages' -> '`@receiver allProvidersAtScope: FamixTPackage'.
	^ self allProvidersAtScope: FamixTPackage
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> providerTypes [
	self deprecated: 'Use #allProvidersAtScope: instead.' transformWith: '`@receiver providerTypes' -> '`@receiver allProvidersAtScope: FamixTType'.
	^ self allProvidersAtScope: FamixTType
]

{ #category : #'*Famix-Deprecated' }
MooseEntity >> typeScope [
	self
		deprecated:
			'typeScope does not have a coherent behavior and should be replaced with a query. The query will depend on your needs. It can either be:
	- `self allAtScope: FamixTType` if you want a collection of all the types up in the containment tree of your entity
	- `self allToScope: FamixTType` if you want a collection of all the types down in the containment tree of your entity
	- `self allWithScope: FamixTType` if you want a collection of all the types up and down in the containment tree of your entity
	- `self atScope: FamixTType` if you want a collection of the first encountered types up in the containment tree of your entity
	- `self toScope: FamixTType` if you want a collection of the first encountered types down in the containment tree of your entity
	- `self withScope: FamixTType` if you want a collection of the first encountered types up and down in the containment tree of your entity
	
	In case you know there is only one type (for example in java a #atScope: on a structural entity), you can call #anyOne on the result of the query.'.
	"This implementation seems to be the most common"
	^ (self atScope: FamixTType) anyOne
]
