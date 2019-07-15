Class {
	#name : #RTAbstractPluginTest,
	#superclass : #RTTest,
	#category : #'Roassal2-Plugins'
}

{ #category : #tests }
RTAbstractPluginTest >> testAllPlugins [

	| c |
	c := RTAbstractPlugin allPlugins.
	self assert: c isCollection.
	self assert: (c noneSatisfy: #isBehavior)
]

{ #category : #tests }
RTAbstractPluginTest >> testallEnabledAndLoadedPlugins [

	| c |
	c := RTAbstractPlugin allEnabledAndLoadedPlugins.
	self assert: c isCollection.
	self assert: (c noneSatisfy: #isBehavior).
	self assert: (c allSatisfy: #isLoaded).
	self assert: (c allSatisfy: #isEnabled).
]

{ #category : #tests }
RTAbstractPluginTest >> testallEnabledAndNotLoadedPlugins [

	| c |
	c := RTAbstractPlugin allEnabledAndNotLoadedPlugins.
	self assert: c isCollection.
	self assert: (c noneSatisfy: #isBehavior).
	self assert: (c noneSatisfy: #isLoaded).
	self assert: (c allSatisfy: #isEnabled).
]

{ #category : #tests }
RTAbstractPluginTest >> testallLoadedPluginClasses [
	| c |
	c := RTAbstractPlugin allLoadedPluginClasses.
	self assert: c isCollection.
	self assert: (c allSatisfy: #isBehavior).
	self assert: ((c collect: #new) allSatisfy: #isLoaded)
]

{ #category : #tests }
RTAbstractPluginTest >> testallNotLoadedPluginClasses [
	| c |
	c := RTAbstractPlugin allNotLoadedPluginClasses.
	self assert: c isCollection.
	self assert: (c allSatisfy: #isBehavior).
	self assert: ((c collect: #new) noneSatisfy: #isLoaded)
]
