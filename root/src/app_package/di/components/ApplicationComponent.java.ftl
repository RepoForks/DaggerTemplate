package ${packageName}.di.components;

import javax.inject.Singleton;

import dagger.Component;
import ${packageName}.${activityClass};
import ${packageName}.di.modules.ApplicationModule;
<#if retrofit>import ${packageName}.di.modules.NetworkModule;</#if>
<#if eventbus>import ${packageName}.di.modules.EventBusModule;</#if>

@Singleton
@Component(modules = {ApplicationModule.class <#if retrofit>,NetworkModule.class</#if><#if eventbus>,EventBusModule.class</#if>})
public interface ApplicationComponent {
    void inject(${activityClass} activity);
	}