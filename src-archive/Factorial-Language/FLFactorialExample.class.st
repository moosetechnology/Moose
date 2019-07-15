"
I implement the example given in ""factorial.txt"". The code can be edited directly in the Smalltalk code browser and is automatically parsed, transformed and eventually compiled down to Smalltalk bytecodes.
"
Class {
	#name : #FLFactorialExample,
	#superclass : #TestCase,
	#category : #'Factorial-Language'
}

{ #category : #accessing }
FLFactorialExample >> ack [
	^ 'ack m n = if (m == 0) then (n + 1) else if (n == 0) then (ack (m - 1) 1) else (ack (m - 1) (ack m (n - 1)))'
]

{ #category : #accessing }
FLFactorialExample >> fac [
	^ 'fac n = if (n == 0) then 1 else (mult n (fac (n - 1)))'
]

{ #category : #accessing }
FLFactorialExample >> fib [
	^ 'fib n = if (n == 0) then 0 else if (n == 1) then 1 else ((fib (n - 1)) + (fib (n - 2)))'
]

{ #category : #accessing }
FLFactorialExample >> mul [
	^ 'mult n m = if (n == 0) then 0 else (m + (mult (n - 1) m))'
]

{ #category : #testing }
FLFactorialExample >> testAck [
	self assert: (FLFactorialGrammar parse: self ack) = #('ack' #('m' 'n') '=' #('if' #('(' 'm' '==' '0' ')') 'then' #('(' 'n' '+' '1' ')') 'else' #('if' #('(' 'n' '==' '0' ')') 'then' #('(' 'ack' #(#('(' 'm' '-' '1' ')') '1') ')') 'else' #('(' 'ack' #(#('(' 'm' '-' '1' ')') #('(' 'ack' #('m' #('(' 'n' '-' '1' ')')) ')')) ')')))).
	self assert: (FLFactorialPrinter parse: self ack) = self ack.
	self assert: (FLFactorialCompiler parse: self ack) = (RBParser parseMethod: 'ack: m with: n
	^ m = 0
		ifTrue: [ n + 1 ]
		ifFalse: [ 
			n = 0
				ifTrue: [ self ack: m - 1 with: 1 ]
				ifFalse: [ self ack: m - 1 with: (self ack: m with: n - 1) ] ]')
]

{ #category : #testing }
FLFactorialExample >> testFac [
	self assert: (FLFactorialGrammar parse: self fac) = #('fac' #('n') '=' #('if' #('(' 'n' '==' '0' ')') 'then' '1' 'else' #('(' 'mult' #('n' #('(' 'fac' #(#('(' 'n' '-' '1' ')')) ')')) ')'))).
	self assert: (FLFactorialPrinter parse: self fac) = self fac.
	self assert: (FLFactorialCompiler parse: self fac) = (RBParser parseMethod: 'fac: n
	^ n = 0
		ifTrue: [ 1 ]
		ifFalse: [ self mult: n with: (self fac: n - 1) ]')
]

{ #category : #testing }
FLFactorialExample >> testFib [
	self assert: (FLFactorialGrammar parse: self fib) = #('fib' #('n') '=' #('if' #('(' 'n' '==' '0' ')') 'then' '0' 'else' #('if' #('(' 'n' '==' '1' ')') 'then' '1' 'else' #('(' #('(' 'fib' #(#('(' 'n' '-' '1' ')')) ')') '+' #('(' 'fib' #(#('(' 'n' '-' '2' ')')) ')') ')')))).
	self assert: (FLFactorialPrinter parse: self fib) = self fib.
	self assert: (FLFactorialCompiler parse: self fib) = (RBParser parseMethod: 'fib: n
	^ n = 0
		ifTrue: [ 0 ]
		ifFalse: [ 
			n = 1
				ifTrue: [ 1 ]
				ifFalse: [ (self fib: n - 1) + (self fib: n - 2) ] ]')
]

{ #category : #testing }
FLFactorialExample >> testMul [
	self assert: (FLFactorialGrammar parse: self mul) = #('mult' #('n' 'm') '=' #('if' #('(' 'n' '==' '0' ')') 'then' '0' 'else' #('(' 'm' '+' #('(' 'mult' #(#('(' 'n' '-' '1' ')') 'm') ')') ')'))).
	self assert: (FLFactorialPrinter parse: self mul) = self mul.
	self assert: (FLFactorialCompiler parse: self mul) = (RBParser parseMethod: 'mult: n with: m
	^ n = 0
		ifTrue: [ 0 ]
		ifFalse: [ m + (self mult: n - 1 with: m) ]')
]
