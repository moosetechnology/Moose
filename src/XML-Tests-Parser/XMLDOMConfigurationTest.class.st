Class {
	#name : #XMLDOMConfigurationTest,
	#superclass : #XMLConfigurationTest,
	#category : #'XML-Tests-Parser'
}

{ #category : #accessing }
XMLDOMConfigurationTest >> configurationClass [
	^ XMLDOMConfiguration
]

{ #category : #accessing }
XMLDOMConfigurationTest >> nodeFactoryClass [
	^ XMLNodeFactory
]

{ #category : #accessing }
XMLDOMConfigurationTest >> parserHandlerClass [
	^ XMLDOMParser
]

{ #category : #tests }
XMLDOMConfigurationTest >> testCopy [
	| configuration nodeFactory copy |

	super testCopy.

	nodeFactory := self nodeFactoryClass new.
	(configuration := self newConfiguration)
		preservesCDataNodes: true;
		preservesCommentNodes: true;
		preservesIgnorableWhitespace: true;
		nodeFactory: nodeFactory.
	copy := configuration copy.
	self
		assert: copy preservesCDataNodes = configuration preservesCDataNodes;
		assert: copy preservesCommentNodes = configuration preservesCommentNodes;
		assert: copy preservesIgnorableWhitespace = configuration preservesIgnorableWhitespace;
		deny: copy nodeFactory == configuration nodeFactory;
		assert: copy nodeFactory class = configuration nodeFactory class.
]

{ #category : #tests }
XMLDOMConfigurationTest >> testNodeFactory [
	| configuration oldNodeFactory newNodeFactory |

	configuration := self newConfiguration.
	oldNodeFactory := configuration nodeFactory.
	self assert: oldNodeFactory class == self nodeFactoryClass.

	newNodeFactory := self nodeFactoryClass new.
	self
		assert: (configuration nodeFactory: newNodeFactory) == configuration;
		assert: configuration nodeFactory == newNodeFactory.
]

{ #category : #tests }
XMLDOMConfigurationTest >> testPreservesCDataNodes [
	| configuration |

	configuration := self newConfiguration.
	self
		deny: configuration preservesCDataNodes;
		assert: (configuration preservesCDataNodes: true) == configuration;
		assert: configuration preservesCDataNodes;
		assert: (configuration preservesCDataNodes: false) == configuration;
		deny: configuration preservesCDataNodes.
]

{ #category : #tests }
XMLDOMConfigurationTest >> testPreservesCommentNodes [
	| configuration |

	configuration := self newConfiguration.
	self
		deny: configuration preservesCommentNodes;
		assert: (configuration preservesCommentNodes: true) == configuration;
		assert: configuration preservesCommentNodes;
		assert: (configuration preservesCommentNodes: false) == configuration;
		deny: configuration preservesCommentNodes.
]

{ #category : #tests }
XMLDOMConfigurationTest >> testPreservesIgnorableWhitespace [
	| configuration |

	configuration := self newConfiguration.
	configuration isValidating: false.
	"should enable validation"
	self
		deny: configuration preservesIgnorableWhitespace;
		assert: (configuration preservesIgnorableWhitespace: true) == configuration;
		assert: configuration preservesIgnorableWhitespace;
		assert: configuration isValidating.

	"disabling validation should disable it"
	self
		assert: (configuration isValidating: false) == configuration;
		deny: configuration preservesIgnorableWhitespace;
		deny: configuration isValidating
]
