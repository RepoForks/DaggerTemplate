package ${packageName};

import android.app.Application;
import ${packageName}.di.components.ApplicationComponent;
import ${packageName}.di.components.DaggerApplicationComponent;
import ${packageName}.di.modules.ApplicationModule;
<#if retrofit>import ${packageName}.di.modules.NetworkModule;</#if>

public class ${applicationClass} extends Application {

	public static ApplicationComponent component;
    public static ${applicationClass} instance;
	<#if retrofit>public static final String ENDPOINT = "http://webservice.com";</#if>

    @Override
    public void onCreate() {
        super.onCreate();
        component = DaggerApplicationComponent.builder()
                .applicationModule(new ApplicationModule(this))
				<#if retrofit>.networkModule(new NetworkModule())</#if>
                .build();

        instance = this;

    }

    public static ${applicationClass} getApp() {
        return instance;
    }
}
