﻿<cfcomponent hint="Abstract decorator for extending when you want to have decorators for unit tests" output="false">

<!------------------------------------------- PUBLIC ------------------------------------------->

<!--- proxies --->

<cffunction name="TestCase" returntype="any" access="remote">
	<cfargument name="aTestCase" type="any" required="yes" />
	<cfscript>
		//skip down to the end, since it may be a decorator
		getBaseTarget().TestCase(arguments.aTestCase.getBaseTarget());

		return this;
    </cfscript>
</cffunction>

<cffunction name="beforeTests" returntype="void" access="public">
	<cfreturn getTarget().beforeTests()>
</cffunction>

<cffunction name="afterTests" returntype="void" access="public">
	<cfreturn getTarget().afterTests() />
</cffunction>

<cffunction name="setUp" returntype="void" access="public" hint="">
	<cfreturn getTarget().setUp() />
</cffunction>

<cffunction name="tearDown" returntype="void" access="public">
	<cfreturn getTarget().tearDown() />
</cffunction>

<cffunction name="invokeTestMethod"	access="public" returntype="string" output="false" >
	<cfargument name="methodName" hint="the name of the method to invoke" type="string" required="Yes">
	<cfargument name="args" hint="Optional set of arguments" type="struct" required="No" >
	<cfreturn getTarget().invokeTestMethod(argumentCollection=arguments) />
</cffunction>

<cffunction name="getRunnableMethods" access="public" returntype="array" output="false">
	<cfreturn getTarget().getRunnableMethods() />
</cffunction>

<cffunction name="initDebug" access="public" output="false">
	<cfreturn getTarget().initDebug() />
</cffunction>

<cffunction name="debug" access="public" returntype="void">
	<cfargument name="var" type="any" required="true" />
	<cfset getTarget().debug(arguments.var)>
</cffunction>

<cffunction name="getDebug" access="public" returntype="array">
	<cfreturn getTarget().getDebug()>
</cffunction>

<cffunction name="clearDebug" access="public" returntype="void">
	<cfset getTarget().clearDebug()>
</cffunction>

<cffunction name="getAnnotation" access="public" returntype="Any" >
	<cfargument name="methodName" type="Any" required="true" />
	<cfargument name="annotationName" type="Any" required="true" />
	<cfargument name="defaultValue" type="Any" required="false" />
	<cfreturn getTarget().getAnnotation(argumentCollection=arguments) />
</cffunction>

<cffunction name="clearClassVariables" access="public">
	<cfset getTarget().clearClassVariables()>
</cffunction>

<cffunction name="getTarget" hint="get the current Target. May actually be another decorator." access="public" returntype="any" output="false">
	<cfreturn instance.target />
</cffunction>

<cffunction name="setTarget" access="public" returntype="void" output="false">
	<cfargument name="target" type="any" required="true">
	<cfset instance.target = arguments.target />
</cffunction>

<cffunction name="getBaseTarget" hint="Get the absolute bottom target - the actual test case" access="public" returntype="any" output="false">
	<cfreturn getTarget().getBaseTarget()/>
</cffunction>

<!------------------------------------------- PACKAGE ------------------------------------------->

<!------------------------------------------- PRIVATE ------------------------------------------->

</cfcomponent>