<?xml version="1.0"?>
<recipe>
	<#include "../common/recipe_manifest.xml.ftl" />
	<instantiate from="root/src/app_package/SimpleApplication.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${applicationClass}.java" />
				   
	<instantiate from="root/src/app_package/di/components/ApplicationComponent.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/components/ApplicationComponent.java" />
				   
	<instantiate from="root/src/app_package/di/modules/ApplicationModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/modules/ApplicationModule.java" />

<#if generateLayout>
    <#include "../common/recipe_simple.xml.ftl" />
</#if>

    <instantiate from="root/src/app_package/SimpleActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java" />
	
	<instantiate from="root/src/app_package/DaggerReadme.txt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/DaggerReadme.txt" />
				   
	<open file="${escapeXmlAttribute(srcOut)}/DaggerReadme.txt" />
	
    <dependency mavenUrl="com.google.dagger:dagger-compiler:2.0.2"/>
	<dependency mavenUrl="com.google.dagger:dagger:2.0.2"/>
	<dependency mavenUrl="org.glassfish:javax.annotation:10.0-b28"/>
	
	<#if retrofit>
	<instantiate from="root/src/app_package/di/modules/NetworkModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/modules/NetworkModule.java" />
	<dependency mavenUrl="com.squareup.retrofit2:retrofit:2.0.0-beta4"/>
	<dependency mavenUrl="com.squareup.okhttp3:okhttp:3.2.0"/>
	<dependency mavenUrl="com.squareup.okhttp3:logging-interceptor:3.2.0"/>
		<#if gson>
			<dependency mavenUrl="com.squareup.retrofit2:converter-gson:2.0.0-beta4"/>
		</#if>
		<#if rxjava>
			<dependency mavenUrl="io.reactivex:rxandroid:1.1.0"/>
			<dependency mavenUrl="io.reactivex:rxjava:1.1.0"/>
			<dependency mavenUrl="com.squareup.retrofit2:adapter-rxjava:2.0.0-beta4"/>
		</#if>
	</#if>
	<#if eventbus>
	<instantiate from="root/src/app_package/di/modules/EventBusModule.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/di/modules/EventBusModule.java" />
		<dependency mavenUrl="org.greenrobot:eventbus:3.0.0"/>
	</#if>
</recipe>
