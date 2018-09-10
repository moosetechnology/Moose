Class {
	#name : #PPJavaSeaParserTest,
	#superclass : #PPCompositeParserTest,
	#category : #'PetitIslands-Examples'
}

{ #category : #'as yet unclassified' }
PPJavaSeaParserTest class >> classJavaLangClass [
	^ self new classJavaLangClass
]

{ #category : #'as yet unclassified' }
PPJavaSeaParserTest class >> classJavaLangObject [
	^ self new classJavaLangObject
]

{ #category : #src }
PPJavaSeaParserTest >> file1 [
 ^
'package org.test;

import java.util.*;

public class Foo 
{
	// I am only empty class
}'
]

{ #category : #src }
PPJavaSeaParserTest >> file2 [
 ^
'
public class Foo
{
	public void methodA() {}
	
	public Bar methodB(Some argument, and another) {}
}'
]

{ #category : #src }
PPJavaSeaParserTest >> file3 [
 ^
'package org.test;

import java.util.*;

public class Foo<Bar> extends Zorg
{
	// some comment
	
	public void methodA() {
		System.out.println();
	}
	
	private InnerClass  {}
	
	/**
	 *
	 */
	public Bar methodB(Some argument, and another)
	{
		return new Bar();
	}
}'
]

{ #category : #src }
PPJavaSeaParserTest >> file4 [
 ^
'package java.lang;

import java.lang.reflect.Array;
/**
 * Instances of the class {@code Class} represent classes and
 * interfaces in a running Java application. 
 * <p> The following example uses a {@code Class} object to print the
 * class name of an object:
 *
 * <p> <blockquote><pre>
 *     void printClassName(Object obj) {
 *         System.out.println("The class of " + obj +
 *                            " is " + obj.getClass().getName());
 *     }
 * </pre></blockquote>
 *
 * <p> It is also possible to get the {@code Class} object for a named
 * type (or for void) using a class literal
 * (JLS Section <A HREF="http://java.sun.com/docs/books/jls/second_edition/html/expressions.doc.html#251530">15.8.2</A>).
 * For example:
 *
 * <p> <blockquote>
 *     {@code System.out.println("The name of class Foo is: "+Foo.class.getName());}
 * </blockquote>
 *
 * @param <T> the type of the class modeled by this {@code Class}
 * object.  For example, the type of {@code String.class} is {@code
 * Class<String>}.  Use {@code Class<?>} if the class being modeled is
 * unknown.
 *
 * @author  unascribed
 * @see     java.lang.ClassLoader#defineClass(byte[], int, int)
 * @since   JDK1.0
 */
public final
    class Class<T> implements java.io.Serializable,
                              java.lang.reflect.GenericDeclaration,
                              java.lang.reflect.Type,
                              java.lang.reflect.AnnotatedElement {
    private static final int ANNOTATION= 0x00002000;
    private static final int ENUM      = 0x00004000;
    private static final int SYNTHETIC = 0x00001000;

    private static native void registerNatives();
    static {
        registerNatives();
    }

    /*
     * Constructor. Only the Java Virtual Machine creates Class
     * objects.
     */
    private Class() {}


    /**
     * Converts the object to a string. The string representation is the
     * string "class" or "interface", followed by a space, and then by the
     * fully qualified name of the class in the format returned by
     * {@code getName}.  If this {@code Class} object represents a
     * primitive type, this method returns the name of the primitive type.  If
     * this {@code Class} object represents void this method returns
     * "void".
     *
     * @return a string representation of this class object.
     */
    public String toString() {
        return (isInterface() ? "interface " : (isPrimitive() ? "" : "class "))
            + getName();
    }
}'
]

{ #category : #src }
PPJavaSeaParserTest >> file5 [
 ^
'package java.lang;

import java.lang.reflect.Array;

/**
 * This is a class that has a comment!
 * public class Bar { public void bar() { } }  }
 *
 * @author  unascribed
 * @since   JDK1.0
 */
public final class Foo implements java.io.Serializable {
    /*
     * Constructor. Only the Java Virtual Machine creates Class
     * objects.
     */
    private Foo() {}


    /**
     * Converts the object to a string. The string representation is the
     * string "class" or "interface", followed by a space, and then by the
     * fully qualified name of the class in the format returned by
     * {@code getName}.  If this {@code Class} object represents a
     * primitive type, this method returns the name of the primitive type.  If
     * this {@code Class} object represents void this method returns
     * "void".
     *
     * @return a string representation of this class object.
     */
    public String toString() {
        return (isInterface() ? "interface " : (isPrimitive() ? "" : "class "))
            + getName();
    }
}'
]

{ #category : #src }
PPJavaSeaParserTest >> file7 [
 ^
'

package java.lang;

import sun.reflect.annotation.*;

/**
 * @author  unascribed
 * @see     java.lang.ClassLoader#defineClass(byte[], int, int)
 * @since   JDK1.0
 */
public final
    class Class<T> implements java.io.Serializable,
                              java.lang.reflect.GenericDeclaration,
                              java.lang.reflect.Type,
                              java.lang.reflect.AnnotatedElement {
    
    private static native void registerNatives();
    
	 static {
        registerNatives();
    }

    /*
     * Constructor. Only the Java Virtual Machine creates Class
     * objects.
     */
    private Class() { }


    public String toString() {
        return (isInterface() ? "interface " : (isPrimitive() ? "" : "class "))
            + getName();
    }


    

    AnnotationType getAnnotationType() {
        return annotationType;
    }
}'
]

{ #category : #accessing }
PPJavaSeaParserTest >> parserClass [
	^ PPJavaSeaParser
]

{ #category : #tests }
PPJavaSeaParserTest >> test1 [
	self parse: self file1.
	self assert: result simpleName = 'Foo'.
	self assert: result methodDeclarations size = 0.
]

{ #category : #tests }
PPJavaSeaParserTest >> test2 [
	self parse: self file2.

	self assert: result simpleName = 'Foo'.
	self assert: result methodDeclarations size = 2.
	
	self assert: result methodDeclarations first simpleName = 'methodA'.
	self assert: result methodDeclarations second simpleName = 'methodB'.	
]

{ #category : #tests }
PPJavaSeaParserTest >> test3 [
	self parse: self file3.

	self assert: result simpleName = 'Foo'.
	self assert: result methodDeclarations size = 2.
	
	self assert: result methodDeclarations first simpleName = 'methodA'.
	self assert: result methodDeclarations second simpleName = 'methodB'.	
]

{ #category : #tests }
PPJavaSeaParserTest >> test4 [
	self parse: self file4.

	self assert: result simpleName = 'Class'.
	self assert: result methodDeclarations size = 2.
	
	self assert: (result methodDeclarations anySatisfy: [ :e | e simpleName = 'registerNatives' ]).
	self assert: (result methodDeclarations anySatisfy: [ :e | e simpleName = 'toString' ]).
]

{ #category : #tests }
PPJavaSeaParserTest >> test5 [
	self parse: self file5.

	self assert: result simpleName = 'Foo'.
	self assert: result methodDeclarations size = 1.
	
	"self assert: result second first = 'Foo'."
	self assert: result methodDeclarations first simpleName = 'toString'.	
]

{ #category : #tests }
PPJavaSeaParserTest >> test7 [
	self parse: self file7.

	self assert: result simpleName = 'Class'.
	self assert: result methodDeclarations size = 3.
	
	self assert: (result methodDeclarations anySatisfy: [ :e | e simpleName = 'toString' ]).
	self assert: (result methodDeclarations anySatisfy: [ :e | e simpleName = 'getAnnotationType' ]).
	self assert: (result methodDeclarations anySatisfy: [ :e | e simpleName = 'registerNatives' ]).

]

{ #category : #tests }
PPJavaSeaParserTest >> testBlock [
	self parse: '{}' rule: #block.
]

{ #category : #tests }
PPJavaSeaParserTest >> testBlock2 [
	self parse: '{ }' rule: #block.
]

{ #category : #tests }
PPJavaSeaParserTest >> testBlock3 [
	self parse: '{ {}  }' rule: #block.
]

{ #category : #tests }
PPJavaSeaParserTest >> testClass1 [
	self parse: 'private final class Foo 
		{
			// I am only empty class
		}'
	rule: #javaClass.

	self assert: result simpleName = 'Foo'.
	self assert: result methodDeclarations size = 0.
]

{ #category : #tests }
PPJavaSeaParserTest >> testClass2 [
	self parse: 'public class Foo<Bar> extends Zorg implements Qwark, Bark
		{
			// I am only empty class
		}' 
	rule: #javaClass.

	self assert: result simpleName = 'Foo'.
]

{ #category : #tests }
PPJavaSeaParserTest >> testClass3 [
	self parse: 'private class Bar<T> extends Zorg implements Qwark, Bark
		{
			public static void methodA() { /* is empty */ }
		}' 
	rule: #javaClass.

	self assert: result simpleName = 'Bar'.
	self assert: result methodDeclarations first simpleName = 'methodA'.
]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody1 [
	self parse: '{
		// some comment
		public void methodA() 
		{ 
		}
	}' 
	rule: #classBody.

	self assert: result first returnType = 'void'.	
	self assert: result first simpleName = 'methodA'.
]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody10 [
	self parse: '{
    private static final int SKIP_BUFFER_SIZE = 2048;
   	 public int read(byte b[]) throws IOException {
		return read(b, 0, b.length);
    }
}' 
	rule: #classBody.
	
	self assert: result isPetitFailure not.
	self assert: result size = 1.
	self assert: result first simpleName = 'read'.
]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody11 [
	self parse: '{
    void foo() { {}}
    void bar() { }
}' 
	rule: #classBody.
	
	self assert: result isPetitFailure not.
	self assert: result size = 2.
	self assert: result first simpleName = 'foo'.
	self assert: result second simpleName  = 'bar'.	
]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody12 [
	self parse: '{
    public boolean addAll(int index, Collection<? extends E> c) {
    }	
   
	 public Iterator<E> iterator() {
        return listIterator();
    }	 
}' 
	rule: #classBody.
	
	self assert: result isPetitFailure not.
	self assert: result first simpleName = 'addAll'.
	self assert: result second simpleName = 'iterator'.

]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody13 [
	self parse: '{
			class A { 
        		void bar() {}
			}
			
			void baz() {}
		}' 
	rule: #classBody.
	
	self assert: result isPetitFailure not.
	self assert: result first simpleName = 'A'.
	self assert: result first methodDeclarations first simpleName = 'bar'.
	self assert: result second simpleName = 'baz'.

]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody2 [
	self parse: '{
		// some comment
		public void methodA() { 
		}
	
		private Another methodB( )
		{
			return new Another();
		}
	}' 
	rule: #classBody.
	
	self assert: result first simpleName = 'methodA'.
	self assert: result second simpleName = 'methodB'.	
]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody3 [
	self parse: '{
		// some comment
	
		public void methodA() {
			System.out.println();
		}
	
		/**
		 *
		 */
		public Bar methodB(Some argument, and another)
		{
			return new Bar();
		}
	}' 
	rule: #classBody.
	
	self assert: result first simpleName = 'methodA'.
	self assert: result second simpleName = 'methodB'.	
	self assert: result second returnType = 'Bar'.
]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody4 [
	self parse: '{
		public void methodA() {
			System.out.println();
		}
		private InnerClass { }
	
		public Bar methodB(Some argument, and another)
		{
			return new Bar();
		}
	}' 
	rule: #classBody.
	
	self assert: result first simpleName = 'methodA'.
	self assert: result second simpleName = 'methodB'.	
]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody5 [
	self parse: '{
	// I am only empty class
}' 
	rule: #classBody.
	
	self assert: result size = 0.

]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody6 [
	self parse: '{
		static { int i; }
}' 
	rule: #classBody.
	
	
	self assert: result size = 0.

]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody7 [
	self parse: '{
		static { int i; }
		
		public String[] getStrings() {  }
}' 
	rule: #classBody.
	
	
	self assert: result size = 1.
	self assert: result first simpleName = 'getStrings'.
]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody8 [
	self parse: '{
		private static final int ANNOTATION= 0x00002000;
		static { int i; }
		
		public String[] getStrings() {  }
}' 
	rule: #classBody.
	
	
	self assert: result size = 1.
	self assert: result first simpleName = 'getStrings'.

]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassBody9 [
	self parse: '{
	 private static final int ANNOTATION= 0x00002000;
   
    private static native void registerNatives();
    static {
        registerNatives();
    }

    public String toString() {
        return (isInterface() ? "interface " : (isPrimitive() ? "" : "class "))
            + getName();
    }
}' 
	rule: #classBody.
	
	"debugResult inspect."
	self assert: result isPetitFailure not.
	self assert: result first simpleName = 'registerNatives'.
	self assert: result second simpleName = 'toString'.

]

{ #category : #'tests - class' }
PPJavaSeaParserTest >> testClassDef1 [
	self parse: 'public class Foo' rule: #classDef
]

{ #category : #tests }
PPJavaSeaParserTest >> testComment [
	| input  |
	input := '/* hello there */'.
	self parse: input rule: #comment
]

{ #category : #tests }
PPJavaSeaParserTest >> testComment2 [
	| input  |
	input := '/**
     * <p> If the {@code name} is "{@code <init>};"or "{@code <clinit>}" a
     * @since JDK1.1
     */'.

	self parse: input rule: #comment
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod1 [
	self parse: 'void foo() { }' rule: #methodDef.
	
	self assert: result simpleName = 'foo'.
	self assert: result returnType = 'void'.
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod10 [
	self parse: 'public void foo () { 
	}' rule: #methodDef.

	self assert: result simpleName = 'foo'.
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod11 [
	self parse: 'public void foo_bar () { 
	}' rule: #methodDef.

	self assert: result simpleName = 'foo_bar'.
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod12 [
	self parse: 'public void _bar () { 
	}' rule: #methodDef.

	self assert: result simpleName = '_bar'.
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod2 [
	self parse: 'Foo m() { /** method body */ }' rule: #methodDef.
	
	self assert: result simpleName = 'm'.
	self assert: result returnType = 'Foo'.
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod3 [
	self parse: 'Bar methodB(Some argument, and another)
		{
			return new Bar();
		}'
	rule: #methodDef.
	
	self assert: result simpleName = 'methodB'.
	self assert: result returnType = 'Bar'.
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod4 [
	self parse: 'void finalize() throws Throwable { }'
	rule: #methodDef.
	
	self assert: result simpleName = 'finalize'.
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod5 [
	self parse: 'public void methodA() 
		{ 
		}' 
	rule: #methodDef.
	
	self assert: result simpleName = 'methodA'.
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod6 [
	self fail: 'private InnerClass {  }
	
	   public void methodA() 
		{ 
		}' 
	rule: #methodDef.
	
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod7 [
	self parse: 'public int read(byte b) throws IOException {
		return b;
    }' 
	rule: #methodDef.
	
	self assert: result isPetitFailure not.
	self assert: result simpleName = 'read'.
	self assert: result returnType = 'int'.	
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod8 [
	"type is missing"
	self fail: 'private Class() {}' rule: #methodDef.
]

{ #category : #'tests - method' }
PPJavaSeaParserTest >> testMethod9 [
	self parse: 'public void foo() { if (true) {} return false;}' rule: #methodDef.

	self assert: result simpleName = 'foo'.
]

{ #category : #'tests - nested class' }
PPJavaSeaParserTest >> testNestedClass1 [
	self parse: 'private final class Foo 
		{
			public void foo() {  }
			
			class Bar { 
				public void bar() { }
			}
		}'
	rule: #javaClass.

	self assert: result simpleName = 'Foo'.
	self assert: result methodDeclarations size = 2.
	self assert: result methodDeclarations first simpleName = 'foo'.
	self assert: result methodDeclarations second simpleName = 'Bar'.
	self assert: result methodDeclarations second methodDeclarations first simpleName = 'bar'.
]

{ #category : #'tests - nested class' }
PPJavaSeaParserTest >> testNestedClass2 [
	self parse: 'class Foo 
		{
			private class Entry {
        		private void bar() {
       		}
			}
			
			public void baz() {  }
		}'
	rule: #javaClass.

	self assert: result simpleName = 'Foo'.
	self assert: result methodDeclarations size = 2.

	self assert: result methodDeclarations first simpleName = 'Entry'.
	self assert: result methodDeclarations first methodDeclarations first simpleName = 'bar'.
	self assert: result methodDeclarations second simpleName = 'baz'.
]

{ #category : #tests }
PPJavaSeaParserTest >> testSingleLineComment [
	| input  |
	input := '// hello there
'.
	self parse: input rule: #singleLineComment.
]
