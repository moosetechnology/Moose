Class {
	#name : #OnMooseUsagesOfObsoleteShowOnAPI,
	#superclass : #REPMooseQueryConcern,
	#category : #'OnMoose-Report'
}

{ #category : #accessing }
OnMooseUsagesOfObsoleteShowOnAPI >> computeResult [
	| explicitBrowser referencingMethods showOn a |
	explicitBrowser := self model allModelClasses entityNamed: #'Smalltalk::GLMExplicitBrowser'.
	showOn := explicitBrowser methods detect: [:each | each name = #'showOn:'].
	referencingMethods := showOn incomingInvocations collectAsSet: [:each | each from].
	^ referencingMethods asMooseGroup
]

{ #category : #accessing }
OnMooseUsagesOfObsoleteShowOnAPI >> explanation [
	^ 'GLMTabulator>>showOn: should not be used anymore. Please use the transmit ... andShow: API'
]

{ #category : #accessing }
OnMooseUsagesOfObsoleteShowOnAPI >> label [ 
	^ 'Usages of obsolete GLMTabulator>>showOn:'
]

{ #category : #accessing }
OnMooseUsagesOfObsoleteShowOnAPI >> stakeholder [
	^ OnMoosePeople tudorGirba
]
