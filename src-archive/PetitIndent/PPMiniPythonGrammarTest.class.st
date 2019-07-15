Class {
	#name : #PPMiniPythonGrammarTest,
	#superclass : #PPCompositeParserTest,
	#instVars : [
		'indent',
		'align',
		'context',
		'dedent',
		'code'
	],
	#category : #'PetitIndent-Examples'
}

{ #category : #'as yet unclassified' }
PPMiniPythonGrammarTest >> assert:  res allSatisfy: block [
    ^	res allSatisfy: block
]

{ #category : #'as yet unclassified' }
PPMiniPythonGrammarTest >> assert:  res anySatisfy: block [
    ^	res anySatisfy: block
]

{ #category : #'as yet unclassified' }
PPMiniPythonGrammarTest >> context [
	^ context
]

{ #category : #'as yet unclassified' }
PPMiniPythonGrammarTest >> parserClass [
	^ PPMiniPythonGrammar 
]

{ #category : #'as yet unclassified' }
PPMiniPythonGrammarTest >> setUp [
	context := PPContext new.
]

{ #category : #'test-indentation' }
PPMiniPythonGrammarTest >> testAlign [
	align := self parserInstanceFor: #align.
	
	self assert: align parse: '' to: ''.
	self assert: align parse: '   ' end: 0.
	
	context indentStack push: '   ' asParser.
	self assert: align parse: '   ' end: 3.
	

	context := PPContext new.
	context indentStack push: '  ' asParser.
	context indentStack push: '  ' asParser.
	self assert: align parse: '      ' end: 4.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testBrackets [
	self parse: '[ foo ]' rule: #brackets.
	self parse: '{ foo }' rule: #brackets.	
	self parse: '( foo )' rule: #brackets.
			
		
	self parse: '[ foo, bar,
		baz, bam ]'.
	

	self parse: '( foo () bar)' rule: #brackets.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testBrackets2 [
	self parse: '(")")' rule: #brackets.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testBrackets3 [
	self parse: '["id rexl", "punct", r"""foobar.]/"]jkl;ky"""]' rule: #brackets.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testClass01 [

self parse: 
'class Foo():
	message = array(
		foo
		bar
		baz)
	print b
' rule: #classDef.

	self assert: result size = 4.
	self assert: result first = 'class:'.
	self assert: result second = 'Foo'.
	self assert: result third size = 2.
	
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testClass02 [

self parse: 
'class SubredditExists(Exception): pass' rule: #classDef.

	self assert: result size = 4.
	self assert: result first = 'class:'.
	self assert: result second = 'SubredditExists'.
	self assert: result third size = 0.
	
]

{ #category : #'test-indentation' }
PPMiniPythonGrammarTest >> testDedent [
	dedent := self parserInstanceFor: #dedent.

	context := PPContext new.
	context indentStack push: '  ' asParser.
	self assert: context indentStack size = 1.

	self parse: '   ' rule: #align to: '  ' end: 2.
	self parse: '' rule: #dedent.
	self assert: context indentStack size = 0.
	self fail: '' rule: #dedent.	
		
	context indentStack push: '  ' asParser.
	self fail: '  ' rule: #dedent.
		

	context := PPContext new.
	context indentStack push: '  ' asParser.
	context indentStack push: '  ' asParser.
	context indentStack size = 2.
	
	self assert: dedent parse: '  whatever' to: '  ' end: 0.
	self assert: context indentStack size = 1.
	self assert: dedent fail: '  whatever'.
	self assert: context indentStack size = 1.


	context := PPContext new.
	context indentStack push: '  ' asParser.
	context indentStack push: '  ' asParser.
	context indentStack push: '  ' asParser.
	
	self assert: dedent parse: '  whatever' to: '  ' end: 0.
	self assert: dedent parse: '  whatever' to: '  ' end: 0.
	self assert: dedent fail: '  whatever'.
	
		
	context := PPContext new.
	context indentStack push: '  ' asParser.

	self assert: dedent parse: ''.
	self assert: dedent fail: ''.
	
	context := PPContext new.
	context indentStack push: '  ' asParser.
	context indentStack push: '  ' asParser.

	self assert: dedent fail: '
    foo'.

	context := PPContext new.
	context indentStack push: '  ' asParser.
	context indentStack push: '  ' asParser.
	parser := 'a' asParser, dedent.
	self assert: parser fail: 'a 
    not dedent'.
]

{ #category : #'as yet unclassified' }
PPMiniPythonGrammarTest >> testEmptyLine [
	parser := self parserInstanceFor: #emptyLine.
	
	self assert: parser parse: ''.
	self assert: parser parse: '   '.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testEmptyStatement [
	self parse: '
' rule: #emptyStatement.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testEmptyStatement2 [
	self parse: '   # foo comment
' rule: #emptyStatement.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testExpression [
	true ifTrue: [ ^ 'not yet in a grammar' ].
	
	self parse: 'x < y' rule: #expression.
	self parse: 'x == y' rule: #expression.
	self parse: 'a + b + c' rule: #expression.
	self parse: 'a + (b) + c' rule: #expression.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testExpressionList [
	true ifTrue: [ ^ 'not yet in a grammar' ].

	self parse: 'x < y , x == y' rule: #expressionList.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFile01 [
	code := '
name = raw_input(''What is your name?\n'')
print ''Hi, %s.'' % name
'.
	self parse: code.
	
	self assert: result size = 1.
	self assert: result first = #print.

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFile02 [
	code := '
friends = [''john'', ''pat'', ''gary'', ''michael'']
for i, name in enumerate(friends):
    print "iteration {iteration} is {name}".format(iteration=i, name=name)'.
	self parse: code.
	
	self assert: result size = 3.
	self assert: result first = 'for:'.
	self assert: result second = #print.
	self assert: result third = ':for'.

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFile03 [
	code := '
def greet(name):
    print ''Hello '', name
greet(''Jack'')
greet(''Jill'')
greet(''Bob'')
'.
	self parse: code.
	
	self assert: result size = 4.
	self assert: result first = 'fundef:'.
	self assert: result second = 'greet'.
	self assert: result third = #print.
	self assert: result fourth = ':fundef'.

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFile04 [
	code := '
import re
for test_string in [''555-1212'', ''ILL-EGAL'']:
    if re.match(r''^\d{3}-\d{4}$'', test_string):
        print test_string, ''is a valid US local phone number''
    else:
        print test_string, ''rejected''
'.
	self parse: code.
	
	self assert: result size = 6.
	self assert: result first = #for:.
	self assert: result second = #if:.
	self assert: result third = #print.
	self assert: result fourth = #print.
	self assert: result fifth = #':if'.

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFile05 [
	code := '
prices = {''apple'': 0.40, ''banana'': 0.50}
my_purchase = {
    ''apple'': 1,
    ''banana'': 6}
grocery_bill = sum(prices[fruit] * my_purchase[fruit]
                   for fruit in my_purchase)
print ''I owe the grocer $%.2f'' % grocery_bill
'.
	self parse: code.
	
	self assert: result size = 1.
	self assert: result first = #print.
	
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFile06 [
	code := '
class BankAccount(object):
    def __init__(self, initial_balance=0):
        self.balance = initial_balance
    def deposit(self, amount):
        self.balance += amount
    def withdraw(self, amount):
        self.balance -= amount
    def overdrawn(self):
        return self.balance < 0
my_account = BankAccount(15)
my_account.withdraw(5)
print my_account.balance
'.
	self parse: code.
	
	self assert: (result joinUsing: String cr) = 
'class:
BankAccount
fundef:
__init__
:fundef
fundef:
deposit
:fundef
fundef:
withdraw
:fundef
fundef:
overdrawn
:fundef
:class
print'

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFile07 [
	code := '
# indent your Python code to put into an email
import glob
# glob supports Unix style pathname extensions
python_files = glob.glob(''*.py'')
for file_name in sorted(python_files):
    print ''    ------'' + file_name

    with open(file_name) as f:
        for line in f:
            print ''    '' + line.rstrip()

    print bar
'.
	self parse: code.

	self assert: result size = 9.
	self assert: result first = #for:.
	self assert: result second = #print.
	self assert: result third = #with:.
	self assert: result fourth = #for:.
	self assert: result fifth = #print.
	self assert: result sixth = #':for'.
	self assert: result seventh = #':with'.
	self assert: result eighth = #print.

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFile08 [
	code := '
BOARD_SIZE = 8

class BailOut(Exception):
    pass

def validate(queens):
    left = right = col = queens[-1]
    for r in reversed(queens[:-1]):
        left, right = left-1, right+1
        if r in (left, col, right):
            raise BailOut

def add_queen(queens):
    for i in range(BOARD_SIZE):
        test_queens = queens + [i]
        try:
            validate(test_queens)
            if len(test_queens) == BOARD_SIZE:
                return test_queens
            else:
                return add_queen(test_queens)
        except BailOut:
            pass
    raise BailOut

queens = add_queen([])
print queens
print "\n".join(". "*q + "Q " + ". "*(BOARD_SIZE-q-1) for q in queens)
'.
	self parse: code.
	"
	self debug: code
	"
	
	self assert: (result joinUsing: String cr) = 
'class:
BailOut
:class
fundef:
validate
for:
if:
:if
:for
:fundef
fundef:
add_queen
for:
try:
if:
:if
:try
:for
:fundef
print
print'

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFile09 [
	code := '
if foobar :
	print a
elif barfoo :
	print b
else :
	print c
'.
	self parse: code.
	
	self assert: (result joinUsing: String cr) = 
'if:
print
if:
print
print
:if
:if'

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFile10 [
	code := '
if foobar :
	print a
elif barfoo :
	print b
elif bazbar :
	print c
else :
	print d
'.
	self parse: code.
	
	self assert: (result joinUsing: String cr) = 
'if:
print
if:
print
if:
print
print
:if
:if
:if'

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testForStmt [

	self parse: 
'for w in words:
	print test
	print abc
	print def
' 	rule: #forStmt.

	self assert: result size = 4.
	self assert: result first = 'for:'.

	self assert: result second  size = 3.
	self assert: result second allSatisfy: [ :e | e = #print ].


	self assert: result third  isEmpty.





]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testForStmt2 [

	self parse: 
'for ( w , x , y ) in words:
	print a
	print b
	print c
else :
	print d
	print e
' rule: #forStmt.

	self assert: result size = 4.
	self assert: result first = 'for:'.

	self assert: result second  size = 3.
	self assert: result second allSatisfy: [ :e | e = #print ].


	self assert: result third size = 2.
	self assert: result third allSatisfy: [ :e | e = #print ].





]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testForStmt3 [

self parse: 
'for ( w , x , y ) in words:
	if  x== y :
		print a
		print b
	else :
		print c
	print f
else :
	print d
' rule: #forStmt.

	self assert: result size = 4.
	self assert: result first = 'for:'.

	self assert: result second size = 2.
	self assert: result second first first = 'if:'.
	self assert: result second first second size = 2.
	self assert: result second first second allSatisfy: [ :e | e = #print ].
	self assert: result second first third size = 1.
	self assert: result second first third allSatisfy: [ :e | e = #print ].

	self assert: result second second = #print.
	
	self assert: result third size = 1.
	self assert: result third allSatisfy: [ :e | e = #print ].





]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testForStmt4 [

self parse: 
'for ( w , x , y ) in words:
	if  x== y :
		print a
		print b
else :
	print d
' rule: #forStmt.

	self assert: result size = 4.
	self assert: result first = 'for:'.

	self assert: result second size = 1.
	self assert: result second first first = 'if:'.
	self assert: result second first second size = 2.
	self assert: result second first second allSatisfy: [ :e | e = #print ].
	self assert: result second first third size = 0.

	
	self assert: result third size = 1.
	self assert: result third allSatisfy: [ :e | e = #print ].





]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testForStmt5 [

self fail: 
'for ( w , x , y ) in words:
	print a
	print b
	print c
 else :
	print d
	print e
' rule: #forStmt.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testForStmt6 [

self parse: 
'for r in reversed(queens[:-1]):
    print b
' rule: #forStmt.

	self assert: result size = 4.
	self assert: result first = 'for:'.
	self assert: result second first = #print.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFuncDef [

self parse: 
'def __eq__(self,other):
	print 1
' rule: #funcDef.

	self assert: result size = 4.
	self assert: result first = 'fundef:'.
	
	self assert: result second = '__eq__'.

	self assert: result third size = 1.
	self assert: result third first allSatisfy: [ :e | e = #print ].

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFuncDef10 [

self parse: 
'def _(self,other):
	print 1
' rule: #funcDef.

	self assert: result size = 4.
	self assert: result first = 'fundef:'.
	
	self assert: result second = '_'.

	self assert: result third size = 1.
	self assert: result third first allSatisfy: [ :e | e = #print ].

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFuncDef2 [

self parse: 
'def __eq__(self,
	other):
	print 1
' rule: #funcDef.

	self assert: result size = 4.
	self assert: result first = 'fundef:'.
	
	self assert: result second = '__eq__'.

	self assert: result third size = 1.
	self assert: result third allSatisfy: [ :e | e = #print ].

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFuncDef3 [

self parse: 
'def __eq__(self,
	other):
	"""
	  this is very
	 strange and
	    unformatted comment
	"""
	print 1
' rule: #funcDef.

	self assert: result size = 4.
	self assert: result first = 'fundef:'.
	
	self assert: result second = '__eq__'.

	self assert: result third size = 2.
	self assert: result third first = #().
	self assert: result third second  = #print.

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFuncDef4 [

self parse: 
'def _fd(self,
	other):
	""" this is very"""
	print 1
' rule: #funcDef.

	self assert: result size = 4.
	self assert: result first = 'fundef:'.
	
	self assert: result second = '_fd'.

	self assert: result third size = 2.
	self assert: result third first = #().
	self assert: result third second  = #print.

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFuncDef5 [

self parse: 
'def _fd(self, other): #comment
	""" this is very"""
	print 1
' rule: #funcDef.

	self assert: result size = 4.
	self assert: result first = 'fundef:'.
	
	self assert: result second = '_fd'.

	self assert: result third size = 2.
	self assert: result third first = #().
	self assert: result third second  = #print.

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFuncDef6 [

self fail: 
'default=''default''
def _fd()
	""" this is very"""
	print 1
' rule: #funcDef.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFuncDef7 [

self parse: 
'def _fd(self, other): #comment
	""" this is very"""
	print 2
	
	print 1
' rule: #funcDef.

	self assert: result size = 4.
	self assert: result first = 'fundef:'.
	
	self assert: result second = '_fd'.

	self assert: result third size = 4.
	self assert: result third first = #().
	self assert: result third second  = #print.
	self assert: result third third = #().
	self assert: result third fourth  = #print.

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFuncDef8 [

self parse: 
'def _fd(self, other): #comment
	something
	
	crazy
' rule: #funcDef.

	self assert: result size = 4.
	self assert: result first = 'fundef:'.
	
	self assert: result second = '_fd'.

	self assert: result third size = 3.
	self assert: result third first = #().
	self assert: result third second  = #().
	self assert: result third third  = #().

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testFuncDef9 [

self parse: 
'def _run_callback(self, callback, *args):
        def wrapper():
            self._pending_callbacks -= 1
            try:
                return callback(*args)
            except Exception:
                app_log.error("Uncaught exception, closing connection.",
                              exc_info=True)
                # Close the socket on an uncaught exception from a user callback
                # (It would eventually get closed when the socket object is
                # gc''d, but we don''t want to rely on gc happening before we
                # run out of file descriptors)
                self.close(exc_info=True)
                # Re-raise the exception so that IOLoop.handle_callback_exception
                # can see it and log the error
                raise
            finally:
                self._maybe_add_error_listener()
        # We schedule callbacks to be run on the next IOLoop iteration
        # rather than running them directly for several reasons:
        # * Prevents unbounded stack growth when a callback calls an
        #   IOLoop operation that immediately runs another callback
        # * Provides a predictable execution context for e.g.
        #   non-reentrant mutexes
        # * Ensures that the try/except in wrapper() is run outside
        #   of the application''s StackContexts
        with stack_context.NullContext():
            # stack_context was already captured in callback, we don''t need to
            # capture it again for IOStream''s wrapper.  This is especially
            # important if the callback was pre-wrapped before entry to
            # IOStream (as in HTTPConnection._header_callback), as we could
            # capture and leak the wrong context here.
            self._pending_callbacks += 1
            self.io_loop.add_callback(wrapper)
' rule: #funcDef.

	self assert: result size = 4.
	self assert: result first = 'fundef:'.
	
	self assert: result second = '_run_callback'.

	self assert: result third size = 2.
	self assert: result third first size = 4.
	self assert: result third first second = 'wrapper'.

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIdentifier [
	self parse: 'foo' rule: #identifier.
	self parse: '__eq__' rule: #identifier.
	self parse: '_' rule: #identifier.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt01 [

	self parse: 
	'if x < y :
		print x
		print y
		print z' rule: #ifStmt.

	self assert: result size = 4.
	self assert: result first = 'if:'.

	self assert: result second  size = 3.
	self assert: result second allSatisfy: [ :e | e = #print ].


	self assert: result third  isEmpty.





]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt02 [

	self parse: 
'if x < y :
		print x
		print 2
else :
		print 1' 
	rule: #ifStmt.

	self assert: result size = 4.
	self assert: result first = 'if:'.

	self assert: result second size = 2.
	self assert: result second allSatisfy: [ :e | e = #print ].
	self assert: result third size = 1.
	self assert: result second allSatisfy: [ :e | e = #print ].

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt03 [

	self parse: 
'if x < y :
	if x== y :
		print 1
	else :
		print 2
else :
	print z' rule: #ifStmt.

	self assert: result size = 4.
	self assert: result first = 'if:'.

	self assert: result second size = 1.
	self assert: result second first first = 'if:'.
	self assert: result second first second allSatisfy: [ :e | e = #print ].
	self assert: result second first third  allSatisfy: [ :e | e = #print ].

	self assert: result third size = 1.
	self assert: result second allSatisfy: [ :e | e = #print ].

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt04 [

	self parse: 
'if x < y :
	print 1
	print 2
else :
	print 3
	print 4
' rule: #ifStmt.

	self assert: result size = 4.
	self assert: result first = 'if:'.

	self assert: result second size = 2.
	self assert: result second allSatisfy: [ :e | e = #print ].
	self assert: result third size = 2.
	self assert: result second allSatisfy: [ :e | e = #print ].

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt05 [

self parse: 
'if x < y :
	if x== y :
		print 1
else :
	print 2
' rule: #ifStmt.

	self assert: result size = 4.
	self assert: result first = 'if:'.

	self assert: result second size = 1.
	self assert: result second first first = 'if:'.
	self assert: result second first second allSatisfy: [ :e | e = #print ].
	self assert: result second first third isEmpty.

	self assert: result third size = 1.
	self assert: result second allSatisfy: [ :e | e = #print ].

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt06 [

self fail: 
'if x < y :
	print x
	print 2
 else :
	print 1
' rule: #ifStmt.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt07 [

self fail: 
'if x < y :
   print x
   if x :
      print 2
    else :
      print 3
else :
   print 1
' rule: #ifStmt.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt08 [

self fail: 
'if x:
   print x
   if x :
      print 2
  else :
      print 3
else :
   print 1
' rule: #ifStmt.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt09 [

self fail: 
'if x:
   print x
   if x :
      print 2
   else :
      print 3
 else :
   print 1
' rule: #ifStmt.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt10 [

self parse: 
'if x:
   print x
elif z :
	print z
elif qwak :
	print z
else :
      print 3
' rule: #ifStmt.

	self assert: result size = 10.
	self assert: result first = 'if:'.

	self assert: result second size = 1.
	self assert: result second first allSatisfy: [ :e | e = #print ].

	self assert: result third = 'if:'.

	self assert: result fourth size = 1.
	self assert: result fourth allSatisfy: [ :e | e = #print ].


	self assert: result fifth = 'if:'.

	self assert: result sixth size = 1.
	self assert: result sixth allSatisfy: [ :e | e = #print ].

	self assert: result seventh size = 1.
	self assert: result seventh allSatisfy: [ :e | e = #print ].

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt11 [

self parse: 
'if x:
   print x
elif z :
	print z
elif  grant_type == "https://oauth.reddit.com/grants/installed_client":
	print z
else :
      print 3
' rule: #ifStmt.

	self assert: result size = 10.
	self assert: result first = 'if:'.

	self assert: result second size = 1.
	self assert: result second first allSatisfy: [ :e | e = #print ].

	self assert: result third = 'if:'.

	self assert: result fourth size = 1.
	self assert: result fourth allSatisfy: [ :e | e = #print ].


	self assert: result fifth = 'if:'.

	self assert: result sixth size = 1.
	self assert: result sixth allSatisfy: [ :e | e = #print ].

	self assert: result seventh size = 1.
	self assert: result seventh allSatisfy: [ :e | e = #print ].

]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt12 [

self parse: 
'if bytes is str:  # py2
   print a
   curl.setopt(pycurl.WRITEFUNCTION, write_function)
else:  # py3
   # ported pycurl package, but in the meantime this lambda will
   # make it work for downloading (utf8) text.
   curl.setopt(pycurl.WRITEFUNCTION, lambda s: write_function(utf8(s)))
' rule: #ifStmt.


	self assert: result size = 4.
	self assert: result first = 'if:'.

	self assert: result second size = 2.
	self assert: result second allSatisfy: [ :e | e = #print ].
	self assert: result third size = 3.	
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt13 [

self fail: 
'if_modified = ()
if if_modified:
  if_modified = 1
' rule: #ifStmt.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt14 [

	self parse: 
	'if x < y : #do something smart
		print x
		print z' rule: #ifStmt.

	self assert: result size = 4.
	self assert: result first = 'if:'.

	self assert: result second  size = 2.
	self assert: result second allSatisfy: [ :e | e = #print ].


	self assert: result third  isEmpty.





]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testIfStmt15 [

	self parse: 
	'if(x):
		print x
		print z' rule: #ifStmt.

	self assert: result size = 4.
	self assert: result first = 'if:'.

	self assert: result second  size = 2.
	self assert: result second allSatisfy: [ :e | e = #print ].


	self assert: result third  isEmpty.





]

{ #category : #'test-indentation' }
PPMiniPythonGrammarTest >> testIndent [
"	parser := self parserInstanceFor: #indent.
	align := self parserInstanceFor: #align.
"
	self parse: '   ' rule: #align to: '' end: 0.
	self parse: '   ' rule: #indent to: '   ' end: 0.
	self assert: context indentStack size = 1.
	self parse: '   ' rule: #align to: '   ' end: 3.
	
	context := PPContext new.
	context indentStack push: '  ' asParser.
	self parse: '  
    foo' rule: #indent to: '  ' end: 0.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testMultilineComment [
	self parse: '"""
		whatever
	"""' rule: #multilineComment.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testMultilineCommentSingleQuot [
	self parse: '''''''
		whatever
	''''''' rule: #multilineComment.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testPrintStmt [

	self parse: 'print 1' rule: #printStmt.
	self parse: 'print 12' rule: #printStmt.
	self parse: 'print abc' rule: #printStmt.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testPrintStmt2 [

	self parse: 'print "%d items processed (%s)" % (fileinput.lineno(),
                                                   fileinput.filename())' rule: #printStmt.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testStatement [

	self parse: 'print y' rule: #statement.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testString [
	self parse: '"foo:"' rule: #string.
	self parse: '''foo: ''' rule: #string.	
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testString2 [
	self parse: '''foo\''s: ''' rule: #string.	
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testString3 [
	self parse: '"\\"' rule: #string.	
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testSuite [

	self parse: 
'
    print test' rule: #suite.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testSuite2 [

self parse: 
'	try:
		print a
		if len(test_queens) == BOARD_SIZE:
			print b
		else:
			print c
			return add_queen(test_queens)
	except BailOut:
			print d
' rule: #suite.

	result := result first.
	"try-except"
	self assert: result size = 5.
	self assert: result first = 'try:'.
	
	self assert: result second size = 2.
	self assert: result second first = #print.
	self assert: result second second first = 'if:'.
	self assert: result second second third size = 2.

	self assert: result third size = 1.


]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testTry1Stmt [

self parse: 
'try :
	print x
except :
	print y
' rule: #try1Stmt.

	self assert: result size = 5.
	self assert: result first = 'try:'.
	
	self assert: result second size = 1.
	self assert: result second allSatisfy: [ :e | e = #print ].

	self assert: result third size = 1.
	self assert: result third first size = 1.
	self assert: result third first allSatisfy: [ :e | e = #print ].
	
	self assert: result fourth isEmpty.
	self assert: result fifth = ':try'.



]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testTry1Stmt2 [

self parse: 
'try :
	print x
except :
	print y
	print y
else :
	print z
finally:
	print d
' rule: #try1Stmt.

	"try-finally"
	self assert: result size = 4.
	self assert: result first = 'try:'.
	
	self assert: result second size = 5.
	self assert: result second first = 'try:'.

	"body"
	self assert: result second second size = 1.
	self assert: result second allSatisfy: [ :e | e = #print ].

	"excepts"
	self assert: result second third size = 1.
	self assert: result second third first size = 2.
	self assert: result second third first allSatisfy: [ :e | e = #print ].
	
	"else"
	self assert: result second fourth size = 1.
	self assert: result second fourth allSatisfy: [ :e | e = #print ].

	"finally"
	self assert: result third size = 1.
	self assert: result third allSatisfy: [ :e | e = #print ].


]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testTry1Stmt3 [

self parse: 
'try :
	print x
except :
	print y
else :
	if x==y :
		print x
	else :
		print y
finally :
	print t
' rule: #try1Stmt.

	"try-finally"
	self assert: result size = 4.
	self assert: result first = 'try:'.
	
	"try-except"
	self assert: result second size = 5.
	self assert: result second first = 'try:'.

	"body"
	self assert: result second second size = 1.
	self assert: result second second allSatisfy: [ :e | e = #print ].

	"excepts"
	self assert: result second third size = 1.
	self assert: result second third first size = 1.
	self assert: result second third first allSatisfy: [ :e | e = #print ].
	
	"else"
	self assert: result second fourth size = 1.
	self assert: result second fourth first first = 'if:'.
	self assert: result second fourth first second size = 1.
	self assert: result second fourth first third size = 1.
	self assert: result second fourth first third allSatisfy: [ :e | e = #print ].

	"finally"
	self assert: result third size = 1.
	self assert: result third allSatisfy: [ :e | e = #print ].


]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testTry1Stmt4 [

self parse: 
'try :
	print x
except :
	print y
else :
	if x==y :
		print x
finally :
	print t
' rule: #try1Stmt.


	"try finally"
	self assert: result size = 4.
	self assert: result first = 'try:'.
	
	"try-except"
	self assert: result second size = 5.
	self assert: result second first = 'try:'.
	
	self assert: result second second size = 1.
	self assert: result second second allSatisfy: [ :e | e = #print ].

	self assert: result second third size = 1.
	self assert: result second third first size = 1.
	self assert: result second third first allSatisfy: [ :e | e = #print ].
	
	self assert: result second fourth size = 1.
	self assert: result second fourth first first = 'if:'.
	self assert: result second fourth first second size = 1.
	self assert: result second fourth first third size = 0.

	self assert: result third size = 1.
	self assert: result third allSatisfy: [ :e | e = #print ].


]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testTry1Stmt5 [

self parse: 
'try:
	print a
	if len(test_queens) == BOARD_SIZE:
		print b
	else:
		print c
		return add_queen(test_queens)
except BailOut:
		print d
' rule: #try1Stmt.

	"try-except"
	self assert: result size = 5.
	self assert: result first = 'try:'.
	
	self assert: result second size = 2.
	self assert: result second first = #print.
	self assert: result second second first = 'if:'.
	self assert: result second second third size = 2.

	self assert: result third size = 1.
	
	self assert: result fourth size = 0.
	self assert: result fifth = ':try'.


]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testTry1Stmt6 [

self parse: 
'try:
	print a
except Foo:
	print b
else:
	print c
finally:
	print 	d
' rule: #try1Stmt.

	"try-finally"
	self assert: result size = 4.
	self assert: result first = 'try:'.
	
	"try-except"
	self assert: result second size = 5.
	self assert: result second first = 'try:'.
	self assert: result second second first = #print.
	self assert: result second third first first = #print.
	
	self assert: result second fourth size = 1.
	self assert: result second fourth first = #print.

	self assert: result third size = 1.
	
	self assert: result fourth = ':try'.


]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testTry1Stmt7 [

self parse: 
'try : #something smart
	print x
except :
	print y
' rule: #try1Stmt.

	self assert: result size = 5.
	self assert: result first = 'try:'.
	
	self assert: result second size = 1.
	self assert: result second allSatisfy: [ :e | e = #print ].

	self assert: result third size = 1.
	self assert: result third first size = 1.
	self assert: result third first allSatisfy: [ :e | e = #print ].
	
	self assert: result fourth isEmpty.
	self assert: result fifth = ':try'.



]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testTry2Stmt1 [

self parse: 
'try :
	print x
finally :
	print y
' rule: #try2Stmt.


	self assert: result size = 4.
	self assert: result first = 'try:'.
	
	self assert: result second size = 1.
	self assert: result second allSatisfy: [ :e | e = #print ].

	self assert: result third size = 1.
	self assert: result third allSatisfy: [ :e | e = #print ].


]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testUnknownStmt [
	parser := self parserInstanceFor: #unknownStmt.
	
	self assert: parser parse: 'whatever'.
	self assert: parser fail: '  whatever'.
	self assert: parser parse: 'whatever foo,
	bar' end: 13.
	
	self assert: parser parse: 'whtever [ foo, bar
		baz ]'.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testUnknownStmt2 [
	parser := self parserInstanceFor: #unknownStmt.
	
	self assert: parser parse: 'return isinstance(other, Message) and self.level == other.level and \
            self.message == other.message'.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testUnknownStmt3 [
	self parse: 'return toUnicode(r"""fkjdf;jkdla;fjdf""")' rule: #unknownStmt.
]

{ #category : #'test-grammar' }
PPMiniPythonGrammarTest >> testWhatever01 [
	
	parser := self parserInstanceFor: #whatever.
	self assert: parser parse: '(foo):'.

	self assert: parser parse: '(foo, 
	bar):'.



]
