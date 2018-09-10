"
I am used to intercept messages from instance which class was substituted by GHClassGhost
I play role of superclass of proxified class and I intercept messages by #cannotInterpret: trick. Then I found real class proxy and delegate message to it behavior.

I can be used as class of superclass variable of GHClassGhost. It will reduce number of objects required to substitute real object class.
Or my instance can be used as superclass variable of GHClassGhost. In this case my superclass can be initialized with original object class. And internaly VM will think that object still belongs to original class by inheritance chain. And for example such proxified object can be used normally with VM #perform: primitives with given lookup class.
"
Class {
	#name : #GHInstanceMessagesInterceptor,
	#superclass : #Object,
	#instVars : [
		'superclass',
		'methodDict',
		'format'
	],
	#category : 'Ghost-ClassGhost'
}

{ #category : #'instance creation' }
GHInstanceMessagesInterceptor class >> for: originalClass [
	^self new 
		superclass: originalClass
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor class >> intercept: message to: receiver [
	"This method intercepts all messages to objects (receiver) which class was proxified by GHClassGhost.
	 IMPORTANT! In this case, 'receiver' is the instance whose class was proxified. Therefore, we cannot send ANY message to 'receiver' because we will cause an infinitive loop.
	We first have to find the ghost in the class hierarchy of receiver. And then we delegate message to it behaviour. Concrete GHClassGhost should define #instancesBehaviour which will perform processing of intercepted messages. (#ghostBehaviour is used to intercept direct messages to ghosts).	
	Originaly instance side method #cannotInterpret: intercepts message to receiver du to special VM trick. Look at class comment"
	| thisClass ghost |
	thisClass := GHMetaMessages extractClassOf: receiver.
	
	ghost := thisClass findGhostInHierarchy.
	
	^ ghost instancesBehaviour intercept: message to: receiver
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor class >> prepareCannotInterpretMethodFor: selector [
"I should prepare special method to simulate support behaviour of debugger to step into method which receiver class was proxified. Which means that step into should reflect cannotInterpret: trick"
	| numArgs methodName method copy |
	numArgs := selector numArgs.
	methodName := 'cannotInterpretMethodForSelector'.
	
	numArgs timesRepeat: [methodName := methodName, 'with:'].
	methodName := methodName asSymbol.
	
	method := self compiledMethodAt: methodName ifAbsent: [ ^self error: 'Please implement method ', methodName, ' on instance side for new num args'].

	copy := method copy.
	copy propertyValueAt: #canNotInterpretSelector put: selector.
	^copy
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor class >> simulateCannotInterpretIn: trickMethodContext [
"I am called from special methods which created to support debugging of methods which receiver class was proxified by cannotInterpret: trick"	
	| message selector receiver |
	selector := trickMethodContext method propertyValueAt: #canNotInterpretSelector.	
	message := Message selector: selector arguments: trickMethodContext arguments.
	receiver := trickMethodContext receiver.	
		
	^self intercept: message to: receiver
]

{ #category : #intercepting }
GHInstanceMessagesInterceptor >> cannotInterpret: aMessage [ 
	"This method intercepts all messages to objects which class was proxified by GHClassGhost.
	 IMPORTANT! In this case, 'self' is the instance whose class was proxified. Therefore, we cannot send ANY message to 'self' because we will cause an infinitive loop.
	We first have to find the ghost in the class hierarchy of receiver. And then we delegate message to it behaviour. Concrete GHClassGhost should define #instancesBehaviour which will perform processing of intercepted messages. (#ghostBehaviour is used to intercept direct messages to ghosts).	
	This logic extracted to class side method to be reused during simulation process when for example debugger step into is executed.
	"
	
	^GHInstanceMessagesInterceptor intercept: aMessage to: self
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor >> cannotInterpretMethodForSelector [
	
	^GHInstanceMessagesInterceptor simulateCannotInterpretIn: thisContext
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor >> cannotInterpretMethodForSelectorwith: arg1 [
	
	^GHInstanceMessagesInterceptor simulateCannotInterpretIn: thisContext
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor >> cannotInterpretMethodForSelectorwith: arg1 with: arg2 [
	
	^GHInstanceMessagesInterceptor simulateCannotInterpretIn: thisContext
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor >> cannotInterpretMethodForSelectorwith: arg1 with: arg2 with: arg3 [
	
	^GHInstanceMessagesInterceptor simulateCannotInterpretIn: thisContext
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor >> cannotInterpretMethodForSelectorwith: arg1 with: arg2 with: arg3 with: arg4 [
	
	^GHInstanceMessagesInterceptor simulateCannotInterpretIn: thisContext
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor >> cannotInterpretMethodForSelectorwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 [
	
	^GHInstanceMessagesInterceptor simulateCannotInterpretIn: thisContext
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor >> cannotInterpretMethodForSelectorwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 [
	
	^GHInstanceMessagesInterceptor simulateCannotInterpretIn: thisContext
]

{ #category : #'simulation trick' }
GHInstanceMessagesInterceptor >> cannotInterpretMethodForSelectorwith: arg1 with: arg2 with: arg3 with: arg4 with: arg5 with: arg6 with: arg7 [
	
	^GHInstanceMessagesInterceptor simulateCannotInterpretIn: thisContext
]

{ #category : #initialization }
GHInstanceMessagesInterceptor >> initialize [
	super initialize.
	
	format := GHInstanceMessagesInterceptor format.
	methodDict := MethodDictionary new.
	methodDict at: #cannotInterpret: put: GHInstanceMessagesInterceptor >> #cannotInterpret:
]

{ #category : #accessing }
GHInstanceMessagesInterceptor >> superclass [
	^ superclass
]

{ #category : #accessing }
GHInstanceMessagesInterceptor >> superclass: anObject [
	superclass := anObject
]
