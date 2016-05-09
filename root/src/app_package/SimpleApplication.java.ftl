package ${packageName};

import android.app.Application;
import ${packageName}.di.components.ApplicationComponent;
import ${packageName}.di.components.DaggerApplicationComponent;
import ${packageName}.di.modules.ApplicationModule;
<#if retrofit>import ${packageName}.di.modules.NetworkModule;</#if>

public class ${applicationClass} extends Application {

	public ApplicationComponent applicationComponent;
	<#if retrofit>public static final String ENDPOINT = "http://webservice.com";</#if>

    @Override
    public void onCreate() {
        super.onCreate();
        applicationComponent = DaggerApplicationComponent.builder()
                .applicationModule(new ApplicationModule(this))
				<#if retrofit>.networkModule(new NetworkModule())</#if>
                .build();

    }
}
